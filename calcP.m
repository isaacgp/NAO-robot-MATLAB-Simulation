function P = calcP(j)
global uLINK
% calculation of robot's momentum
if j == 0
   P = [0 0 0]';
else
   c1 = uLINK(j).R * uLINK(j).c; %Velocity of the link center of mass
   P = uLINK(j).m * (uLINK(j).vo + cross(uLINK(j).w, c1) ); 
   P = P + calcP(uLINK(j).sister) + calcP(uLINK(j).child); 
end