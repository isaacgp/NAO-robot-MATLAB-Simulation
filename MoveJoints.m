function MoveJoints(idx, dq)
global uLINK

Joint_Limits;

for n=1:length(idx)
    j = idx(n);
    uLINK(j).q = uLINK(j).q + dq(n); % adds the corresponding correction value to the q
    if uLINK(j).q < Lower_Limits(j)
        uLINK(j).q = Lower_Limits(j);
    elseif uLINK(j).q > Upper_Limits(j)
        uLINK(j).q = Upper_Limits(j);
    end
end
