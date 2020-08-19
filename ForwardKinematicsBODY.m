function ForwardKinematicsBODY(j)
global uLINK 

    if j == 0 return; 
    elseif j~=1
        uLINK(j-1).p = -uLINK(j).R * uLINK(j).b + uLINK(j).p;
        uLINK(j-1).R = uLINK(j).R * Rodrigues(uLINK(j-1).a, uLINK(j).q);
    end
    
%         uLINK(j).p = uLINK(mom).R * uLINK(j).b + uLINK(mom).p;
%     uLINK(j).R = uLINK(mom).R * Rodrigues(uLINK(j).a, uLINK(j).q);
%  
    
% result = [uLINK(8).R, uLINK(7).R, uLINK(6).R, uLINK(5).R, uLINK(4).R, uLINK(3).R, uLINK(2).R, uLINK(1).R  ]
ForwardKinematicsBODY(j-1)
