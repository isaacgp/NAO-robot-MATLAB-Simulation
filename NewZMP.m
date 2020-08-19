function [lz, ly] = NewZMP(d_ddq, u, )

for i=1:size(u,1)
uf_x = 
um_y =
bf_x = 
bm_y = 

d_ddq =

lz = (um_y * d_ddq + bm_y ) / (uf_x * d_ddq + bf_x);

um_z =
bm_z =




ly = - ( um_z * d_ddq + bm_z) / (uf_x * d_ddq + bf_x);

end

