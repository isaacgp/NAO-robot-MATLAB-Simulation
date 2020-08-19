%%% SetupBipedRobot2.m
%%% ‚Q‘«•à?sƒ?ƒ{ƒbƒg?\‘¢ƒf?[ƒ^?F?}2.19?C?}2.20ŽQ?Æ
%%% ŠeƒtƒB?[ƒ‹ƒh‚Ì’è‹`‚Í?u•\2.1?@ƒŠƒ“ƒN?î•ñ?v‚ðŽQ?Æ‚Ì‚±‚Æ

ToDeg = 180/pi;
ToRad = pi/180;
UX = [1 0 0]';
UY = [0 1 0]';
UZ = [0 0 1]';

uLINK    = struct('name','BODY'    , 'm', 10, 'sister', 0, 'child', 2, 'b',[0  0    0.7]','a',UZ,'q',0);

uLINK(2) = struct('name','RLEG_J0' , 'm',  5, 'sister', 8, 'child', 3, 'b',[0 -0.1 0]'   ,'a',UZ,'q',0);
uLINK(3) = struct('name','RLEG_J1' , 'm',  1, 'sister', 0, 'child', 4, 'b',[0  0   0]','a',UX,'q',0);
uLINK(4) = struct('name','RLEG_J2' , 'm',  5, 'sister', 0, 'child', 5, 'b',[0  0   0]'   ,'a',UY,'q',0);
uLINK(5) = struct('name','RLEG_J3' , 'm',  1, 'sister', 0, 'child', 6, 'b',[0  0  -0.3]' ,'a',UY,'q',0);
uLINK(6) = struct('name','RLEG_J4' , 'm',  6, 'sister', 0, 'child', 7, 'b',[0  0  -0.3]' ,'a',UY,'q',0);
uLINK(7) = struct('name','RLEG_J5' , 'm',  2, 'sister', 0, 'child', 0, 'b',[0  0   0  ]' ,'a',UX,'q',0);

uLINK(8) = struct('name','LLEG_J0' , 'm',  5, 'sister', 0, 'child', 9, 'b',[0  0.1 0]'   ,'a',UZ,'q',0);
uLINK(9) = struct('name','LLEG_J1' , 'm',  1, 'sister', 0, 'child',10, 'b',[0  0   0]','a',UX,'q',0);
uLINK(10)= struct('name','LLEG_J2' , 'm',  5, 'sister', 0, 'child',11, 'b',[0  0   0]'   ,'a',UY,'q',0);
uLINK(11)= struct('name','LLEG_J3' , 'm',  1, 'sister', 0, 'child',12, 'b',[0  0  -0.3]' ,'a',UY,'q',0);
uLINK(12)= struct('name','LLEG_J4' , 'm',  6, 'sister', 0, 'child',13, 'b',[0  0  -0.3]' ,'a',UY,'q',0);
uLINK(13)= struct('name','LLEG_J5' , 'm',  2, 'sister', 0, 'child', 0, 'b',[0  0   0  ]' ,'a',UX,'q',0);

FindMother(1);   %?@–…?C–ºƒŠƒ“ƒN‚Ì?î•ñ‚ð‚à‚Æ‚É•êƒŠƒ“ƒN‚ð?Ý’è‚·‚é

%% ƒtƒB?[ƒ‹ƒh‚Ì’Ç‰Á
for n=1:length(uLINK)
    uLINK(n).dq     = 0;            % ŠÖ?ß‘¬“x   [rad/s]
    uLINK(n).ddq    = 0;            % ŠÖ?ß‰Á‘¬“x [rad/s^2]
    uLINK(n).c      = [0 0 0]';     % ?d?SˆÊ’u   [m]
    uLINK(n).I      = zeros(3,3);   % ?d?S‰ñ‚è‚ÌŠµ?«ƒeƒ“ƒ\ƒ‹ [kg.m^2]
    uLINK(n).Ir     = 0.0;          % ƒ‚?[ƒ^‚Ì“d‹CŽqŠµ?«ƒ‚?[ƒ?ƒ“ƒg [kg.m^2]
    uLINK(n).gr     = 0.0;          % ƒ‚?[ƒ^‚ÌŒ¸‘¬”ä [-]
    uLINK(n).u      = 0.0;          %  ŠÖ?ßƒgƒ‹ƒN [Nm]
end

%%% ƒvƒ?ƒOƒ‰ƒ€‚ðŒ©‚â‚·‚­‚·‚é‚½‚ß?CƒŠƒ“ƒNname‚Æ“¯–¼‚Ì•Ï?”‚ÉID”Ô?†‚ðƒZƒbƒg
for n=1:length(uLINK)
    eval([uLINK(n).name,'=',num2str(n),';']);
end

%%%%%%%%%?@“·‘Ì?C‚¨‚æ‚Ñ‘«•”‚ð?„‘Ì‚Åƒ‚ƒfƒ‹‰» %%%%%%%%%
shape = [0.1 0.3 0.5];     % ‰œ?s‚«?C•??C?‚‚³ [m]
com   = [0 0 0.3]';        % ?d?SˆÊ’u
SetupRigidBody(BODY, shape,com);

shape = [0.2 0.1 0.02];    % ‰œ?s‚«?C•??C?‚‚³ [m]
com   = [0.05  0 -0.04]';   % ?d?SˆÊ’u
SetupRigidBody(RLEG_J5, shape,com);

shape = [0.2 0.1 0.02];     % ‰œ?s‚«?C•??C?‚‚³ [m]
com   = [0.05  0 -0.04]';    % ?d?SˆÊ’u
SetupRigidBody(LLEG_J5, shape,com);

%%%%%%%%%%% ”ñ“ÁˆÙŽp?¨‚ÖˆÚ?s?@%%%%%%%%%%%%
uLINK(RLEG_J2).q = -10.0*ToRad;
uLINK(RLEG_J3).q = 20.0*ToRad;
uLINK(RLEG_J4).q = -10.0*ToRad;

uLINK(LLEG_J2).q = -10.0*ToRad;
uLINK(LLEG_J3).q = 20.0*ToRad;
uLINK(LLEG_J4).q = -10.0*ToRad;

uLINK(BODY).p = [0.0, 0.0, 0.7]';
uLINK(BODY).R = eye(3);
% 
% uLINK(1).vo= [0 0 0]';                   % ?‰‘¬“x [m/s]
% uLINK(1).w = [0 0 0]';                  % ?‰ŠúŠp‘¬“x [rad/s]
% 
% uLINK(7).vo= [0 0 0]';                   % ?‰‘¬“x [m/s]
% uLINK(7).w = [0 0 0]';                  % ?‰ŠúŠp‘¬“x [rad/s]


ForwardKinematics(1);