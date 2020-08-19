function ForwardKinematics(j)
global uLINK 

if j == 0 return; end
if j ~= 1
%     disp(uLINK(21).R)
    mom = uLINK(j).mother;
    uLINK(j).p = uLINK(mom).R * uLINK(j).b + uLINK(mom).p;
    uLINK(j).R = uLINK(mom).R * Rodrigues(uLINK(j).a, uLINK(j).q);
    
end

ForwardKinematics(uLINK(j).sister);
ForwardKinematics(uLINK(j).child);

