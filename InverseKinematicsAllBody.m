function InverseKinematicsAllBody(to, Target, i)
global uLINK

lambda = 0.9;
idx = [8, 7, 6, 5, 4, 3, 2, 1];
% uLINK(8).p
ForwardKinematicsBODY(idx(1));
% uLINK(8).p
% idx = FindRoute(to);
% if i == 1
%     idx = [1,2,3,4,5,6,7,8];
% else
%     idx = [15, 14, 13, 12, 11, 10, 9];  
% end
for n = 1:10
  J   = CalcJacobian(idx);
  err = CalcVWerr(Target, uLINK(to));
  if norm(err) < 1E-6 break, end;
  dq = lambda * (J \ err);
  MoveJoints(idx, dq);
  ForwardKinematicsBODY(idx(1));
%   ForwardKinematicsBODY1(1);
end

%--- Relative velocity with respect to the body
vd = Target.v - uLINK(1).vo - cross(uLINK(1).w, Target.p - uLINK(1).p);
wd = Target.w - uLINK(1).w;
J  = CalcJacobian(idx);
vq = J \ [vd; wd];

for n=1:length(idx)
    j = idx(n);
    uLINK(j).dq = vq(n);
end

% if i == 1
%     InverseKinematicsAllBody(to, Target, 2)
% end
