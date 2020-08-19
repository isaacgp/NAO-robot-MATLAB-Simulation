function [px,vx] = LIPM(time,org,x0,Tc)

px = (x0-org) * cosh(time/Tc) + org;
vx = (x0-org)/Tc * sinh(time/Tc);