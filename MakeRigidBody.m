function MakeRigidBody(j, wdh, mass)
global uLINK

uLINK(j).m = mass;                                    % mass kg
uLINK(j).c = [0 0 0]';                                % center of mass
uLINK(j).I = [1/12*(wdh(2)^2 + wdh(3)^2) 0 0;...
            0 1/12*(wdh(1)^2 + wdh(3)^2)  0;...
            0 0 1/12*(wdh(1)^2 + wdh(2)^2)] * mass; % inertia tensor
uLINK(j).vertex = [
   0      0      0;
   0      wdh(2) 0;
   wdh(1) wdh(2) 0;
   wdh(1) 0      0;
   0      0      wdh(3);
   0      wdh(2) wdh(3);
   wdh(1) wdh(2) wdh(3);
   wdh(1) 0      wdh(3);
]';                             % vertex points
for n=1:3
    uLINK(j).vertex(n,:) = uLINK(j).vertex(n,:) - wdh(n)/2;  
end
uLINK(1).face = [
   1 2 3 4; 2 6 7 3; 4 3 7 8;
   1 5 8 4; 1 2 6 5; 5 6 7 8;
]';                             % polygons
