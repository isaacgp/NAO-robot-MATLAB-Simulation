function L = EulerDynamics(j)
global uLINK
I = uLINK(j).R * uLINK(j).I * uLINK(j).R';    % Inertia tensor
L = I * uLINK(j).w;                           % Angular momentum
uLINK(j).dw  = I \ (-cross(uLINK(j).w, L));   % Euler’s equation