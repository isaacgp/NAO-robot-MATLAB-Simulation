function u = InvDyn(j)
global uLINK G

uLINK(1).dvo = [0 0 0]'; % Cartesian Linear Acceleration 
uLINK(1).dw  = [0 0 0]'; % Cartesian Angular Acceleration
if j >= 1 & j <= 3 
    uLINK(1).dvo(j) = 1;
elseif j >= 4 & j <= 6
    uLINK(1).dw(j-3) = 1;
end
uLINK(1).dvo = uLINK(1).dvo + [0 0 G]';  % Add Gravity

for n=1:length(uLINK)-1
    if n == j-6
        uLINK(n+1).ddq = 1;
    else
        uLINK(n+1).ddq = 0;
    end
end
ForwardAllKinematics(1);
[f,t] = InverseDynamics(1);
u = [f',t',uLINK(2:end).u]'; % torque u
