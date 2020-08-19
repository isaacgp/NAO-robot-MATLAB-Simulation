function [f,t] = TopForce(j)
global uLINK G my_min
% j=7;
% w_c = uLINK(j).R * uLINK(j).c + uLINK(j).p;   % center of mass
f = [0 0 -uLINK(j).m * G]';    % gravity
% support = ( uLINK(8).p + uLINK(15).p )/ 2;
% t = cross(w_c, f);            % gravity moment around the origin
if (uLINK(8).p(3) - 0.0329) < 0.005 
    if (uLINK(15).p(3) - 0.0329) < 0.005
       support = ((uLINK(8).R * uLINK(8).c + uLINK(8).p) + (uLINK(15).R * uLINK(15).c + uLINK(15).p) )/ 2; % double support 
    else
        support = uLINK(8).R * uLINK(8).c + uLINK(8).p - [0;0;0.0329];%single support right foot
    end
elseif (uLINK(15).p(3) - 0.0329) < 0.005
    support = uLINK(15).R * uLINK(15).c + uLINK(15).p - [0;0;0.0329]; % single support left foot    
else
    support = uLINK(j).R * uLINK(j).c + uLINK(j).p; % free fall
end
t = cross(support - [0.0181;0.0003;0], f);            % gravity moment around the origin
% t = [0;1;0];

% [f,t] = InverseDynamics(1);

if my_min < 0  % the top is contacting    
%     Kf = -0.6E+2;        % spring coefficient to give the floor stiffness[N/m]
%     Df = 0.7E+3;        % damping coefficient[N/(m/s)] (viscosity)
    Kf = -0.6E+2;        % spring coefficient to give the floor stiffness[N/m]
    Df = 0.9E+2;        % damping coefficient[N/(m/s)] (viscosity)
    v = uLINK(j).vo + cross(uLINK(j).w,uLINK(j).p);  % contacting speed
    fc = [-Df*v(1)  -Df*v(2) -Kf*uLINK(j).p(3)-Df*v(3)]';
    f = f + fc;
    t = t + cross(uLINK(j).p, fc);
end
