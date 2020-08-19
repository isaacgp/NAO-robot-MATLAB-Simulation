function [P,L] = IntegrateEuler(j)
% following Featherstone "Robot Dynamics Algorithm" p.103
% '04 May 8 s.k AIST  
global uLINK Dtime 
i=1;
if j == 0 return; end
if j == 1
    [f,tau] = TopForce(1); 
%     [f,tau] = TopForce(8);          
%     [f,tau] = TopForce(15); 
%     for i=1:25                           
        [P,L]   = SE3dynamics(i,f,tau);                     % Acceleration 
%         [f,tau] = TopForce(13);                              
%         [P,L]   = SE3dynamics(13,f,tau);                     
%     end
    [uLINK(j).p, uLINK(j).R] = SE3exp(j, Dtime);        % Update configuration   
    uLINK(j).vo = uLINK(j).vo + Dtime * uLINK(j).dvo;   % Update lin. velocity
    uLINK(j).w  = uLINK(j).w  + Dtime * uLINK(j).dw;    % Update ang. velocity
else
    uLINK(j).q  = uLINK(j).q  + Dtime * uLINK(j).dq;
    uLINK(j).dq = uLINK(j).dq + Dtime * uLINK(j).ddq;
end
IntegrateEuler(uLINK(j).sister);
IntegrateEuler(uLINK(j).child);
