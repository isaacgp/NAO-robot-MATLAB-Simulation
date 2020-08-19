function ForwardAllKinematics(j)
global uLINK G k_q 

if j == 0 return; end
if j ~= 1
    mom = uLINK(j).mother;
    
% disp(rad2deg(uLINK(5).q))
%     if j==13 || j==12 || j==11 || j==10 || j==9
%     else
%     uLINK(j).q = k_q(j-1); %follow Coppelia Trajectory
%     end
    
    % position and orientation
    uLINK(j).p = uLINK(mom).R * uLINK(j).b + uLINK(mom).p;
    uLINK(j).R = uLINK(mom).R * Rodrigues(uLINK(j).a, uLINK(j).q);
    
    % spatial velocity
    hw = uLINK(mom).R * uLINK(j).a;  % axis vector in world frame
    hv = cross(uLINK(j).p, hw);      % p_i x axis
    
    uLINK(j).hw = hw;                % store h1 and h2 for future use
    uLINK(j).hv = hv;
    
    uLINK(j).w  = uLINK(mom).w  + hw * uLINK(j).dq;
    uLINK(j).vo = uLINK(mom).vo + hv * uLINK(j).dq; 
    
    % spatial acceleration
    dhv = cross(uLINK(mom).w, hv) + cross(uLINK(mom).vo, hw);
    dhw = cross(uLINK(mom).w, hw);
    
    uLINK(j).dw  = uLINK(mom).dw  + dhw * uLINK(j).dq + hw * uLINK(j).ddq;
    uLINK(j).dvo = uLINK(mom).dvo + dhv * uLINK(j).dq + hv * uLINK(j).ddq;  
    
% disp(rad2deg(uLINK(5).q))
end
ForwardAllKinematics(uLINK(j).sister);
ForwardAllKinematics(uLINK(j).child);
