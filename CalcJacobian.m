function J = CalcJacobian(idx)
% Jacobian matrix of current configuration in World frame
global uLINK
jsize = length(idx);
if jsize==5
    loopsize = 5;
else
    loopsize = 6;
end
target = uLINK(idx(end)).p + [0.01;0.01;0.01];   % absolute target position
J = zeros(6,jsize);

for n=1:jsize
    j = idx(n);
    a = uLINK(j).R * uLINK(j).a;  % joint axis vector in world frame
    J(:,n) = [cross(a, target - uLINK(j).p) ; a ];
end

[U,S,V] = svd(J);
A = diag(S);

for i=1:loopsize
    if A(i)<0.01
        A(i)=0.01;
%         A(i)=0.1;
    end
end
if jsize == 7
    S = [diag(A) , [0;0;0;0;0;0] ];
elseif jsize == 6
    S = diag(A);
elseif jsize == 8
    S = [diag(A) , [0;0;0;0;0;0] , [0;0;0;0;0;0] ];
else
    S = [diag(A) ; [0,0,0,0,0] ];
end
J = U*S*V';