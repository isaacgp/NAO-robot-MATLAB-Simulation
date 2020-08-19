function idx = FindRoute(to)
% return the list of joint number connecting ROOT to 'to'
global uLINK
if to==0
    idx=0;
else
i = uLINK(to).mother;
if i == 1
    idx = [to];
else
    idx = [FindRoute(i) to];
end
end