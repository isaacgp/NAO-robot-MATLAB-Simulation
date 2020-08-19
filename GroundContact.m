function GroundContact()

    global uLINK my_min
    
    my_points = [ 0.0805  0.0375 -0.0226
    -0.0805  0.0375 -0.0226
    0.0805  -0.0375 -0.0226
    -0.0805  -0.0375 -0.0226

    0.0805  0.0375 0.0226
    -0.0805  0.0375 0.0226
    0.0805  -0.0375 0.0226
    -0.0805  -0.0375 0.0226 ];
    my_z = [];
    my_CoM = [0.0491  0 -0.0226]';
    my_pos = [ my_CoM' - my_points(1,:)', my_CoM' - my_points(2,:)', my_CoM' - my_points(3,:)', my_CoM' - my_points(4,:)',...
                my_CoM' - my_points(5,:)', my_CoM' - my_points(6,:)', my_CoM' - my_points(7,:)', my_CoM' - my_points(8,:)'];
    for i=1:size(my_pos,2)
        Lfoot_vertex = [ uLINK(13).p + roty(rad2deg(uLINK(12).q))*rotx(rad2deg(uLINK(13).q))*(my_pos(:,i))  ];
        Rfoot_vertex = [ uLINK(7).p + roty(rad2deg(uLINK(6).q)) * rotx(rad2deg(uLINK(7).q)) * (my_pos(:,i))  ];
        my_z = [ my_z, Rfoot_vertex(3), Lfoot_vertex(3)];
    end
    my_min = min(my_z);

end

