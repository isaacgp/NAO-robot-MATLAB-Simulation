function err = CalcVWerr(Target, Cnow)
global uLINK

perr = Target.p - Cnow.p;

if Cnow.child==2
    Rerr = Cnow.R'* Target.R;
%     Rerr = Target.R' * Cnow.R;
else

    if Cnow.name == 'RARM_J5' | Cnow.name == 'LARM_J5'
        Rerr = Cnow.R'*roty(-90) * Target.R;
    else
        Rerr = Cnow.R'* Target.R;
    end
end
werr = Cnow.R * rot2omega(Rerr);

err = [perr; werr];
