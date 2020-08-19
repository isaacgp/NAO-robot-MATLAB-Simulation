% ForwardDynamics.m - 
% 単位ベクトル法に基づく?∮ｮ力学の計算

nDoF = length(uLINK)-1+6;
A = zeros(nDoF,nDoF);
b = InvDyn(0);
for n=1:nDoF
    A(:,n) = InvDyn(n) - b;
end
for n=7:nDoF 
    j = n-6+1;
    A(n,n) = A(n,n) + uLINK(j).Ir * uLINK(j).gr^2; % add motor inertia
end
% 加速度の計算
u   = [0 0 0 0 0 0 u_joint(2:end)']';

    [U,S,V] = svd(A);
    S = diag(S);
    for my_i=1:size(S,1)
        if S(my_i)==0
           S(my_i) = 0.0001; 
        end
    end
    S = diag(S);
    A = U*S*V';


ddq = A \ (-b + u);
uLINK(1).dvo = ddq(1:3);
uLINK(1).dw  = ddq(4:6);

for j=2:length(uLINK)
    uLINK(j).ddq = ddq(j+6-1); % Acceleration of actuators
end
