% Save the current Position, Rotation and velocities in the Target variables

%         err_t_Body.p = p_d((((k-1)*3)+1):(((k-1)*3)+3),1) - p_d((((k)*3)+1):(((k)*3)+3),1);
%         err_t_Body.R = quat2rotm( r_d(  (((k-1)*4)+1):(((k-1)*4)+4),1 )' ) ;

    t_BODY.p = p_d((((k-1)*3)+1):(((k-1)*3)+3),1) + [0.0009;-0.0000;-0.1032];
    t_BODY.R = quat2rotm( r_d(  (((k-1)*4)+1):(((k-1)*4)+4),1 )' );
    t_BODY.v = v_d(k:k+2,1) - [0;0;0.0012];
    t_BODY.w = w_d(k:k+2,1) - [0;0;-0.0029]; 
    
    t_Rfoot.p = p_d((((k-1)*3)+1):(((k-1)*3)+3),2);
    t_Rfoot.R = quat2rotm( r_d(  (((k-1)*4)+1):(((k-1)*4)+4),2 )' );
    t_Rfoot.v = v_d(k:k+2,2);
    t_Rfoot.w = w_d(k:k+2,2); 
    
    t_Lfoot.p = p_d((((k-1)*3)+1):(((k-1)*3)+3),3);
    t_Lfoot.R = quat2rotm( r_d(  (((k-1)*4)+1):(((k-1)*4)+4),3 )' );
    t_Lfoot.v = v_d(k:k+2,3);
    t_Lfoot.w = w_d(k:k+2,3);    
    
    t_Lhand.p = p_d((((k-1)*3)+1):(((k-1)*3)+3),4);
    t_Lhand.R = quat2rotm( r_d(  (((k-1)*4)+1):(((k-1)*4)+4),4 )' );
    t_Lhand.v = v_d(k:k+2,4);
    t_Lhand.w = w_d(k:k+2,4); 
    
    t_Rhand.p = p_d((((k-1)*3)+1):(((k-1)*3)+3),5);
    t_Rhand.R = quat2rotm( r_d(  (((k-1)*4)+1):(((k-1)*4)+4),5 )' );
    t_Rhand.v = v_d(k:k+2,5);
    t_Rhand.w = w_d(k:k+2,5); 
    