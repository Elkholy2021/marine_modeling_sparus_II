function [Out] = Command(PosE,VitB,AccB)

% desired_z=5;
% error_z=PosE(6)-desired_z
% 
% commande nulle
global delta_z0 int_delta_z0 delta_Vsurge0 int_delta_Vsurge0 step1 step2 step3 c
Kp_m=2000;      %middle motor
Kd_m=2500;
Ki_m=25;

Kp_r=1000;          %right motot
Kd_r=1;
Ki_r=0.1;

Kp_l=1000;          %left motor
Kd_l=1;
Ki_l=0.1;

dt=0.01; %like in simulink
if step1==1 && step2==0 
    desired_z = 5; %5 meter depth       % desired output, or reference point
    desired_Vsurge=0;
elseif step1==0 && step2==1 && c>=20
    desired_z = 5;
    desired_Vsurge=1;
    
end
if step1==1 && step2==0 && PosE(3) <= 5*1.1 && PosE(3)>= 5*0.9
    step1=0;
    step2=1;
    desired_z = 5; %5 meter depth       % desired output, or reference point
    desired_Vsurge=0;
    
end
if step1==0 && step2==1
    desired_z = 5; %5 meter depth       % desired output, or reference point
    desired_Vsurge=0;
    c=c+1;
    if c>=20
        desired_z = 5;
        desired_Vsurge=1;
    end    
end
if PosE(1) <= 20*1.1 && PosE(1)>= 19
step3=1;

end
if step3==1
    
desired_z=5;
desired_Vsurge=0;
end
% desired_z
% desired_Vsurge
delta_z= desired_z-PosE(3);
diff_delta_z=(delta_z-delta_z0)/dt;
int_delta_z=int_delta_z0+delta_z*dt;

delta_Vsurge= desired_Vsurge-VitB(1);
diff_delta_Vsurge=(delta_Vsurge-delta_Vsurge0)/dt;
int_delta_Vsurge=int_delta_Vsurge0+delta_Vsurge*dt;


thrust_middle= Kp_m*delta_z+Ki_m*int_delta_z+Kd_m* diff_delta_z;
thrust_right= Kp_r*delta_Vsurge+Ki_r*int_delta_Vsurge+Kd_r*diff_delta_Vsurge;
thrust_left= Kp_l*delta_Vsurge+Ki_l*int_delta_Vsurge+Kd_l*diff_delta_Vsurge;
% 
thrust_middle=saturate_thruster(thrust_middle);
thrust_right=saturate_thruster(thrust_right);
thrust_left=saturate_thruster(thrust_left);

Thrust=[thrust_middle thrust_right thrust_left];
delta_z0=delta_z;
int_delta_z0=int_delta_z;%initialized as zero in parameters
delta_Vsurge0=delta_Vsurge;
int_delta_Vsurge0=int_delta_Vsurge;%initialized as zero in parameters

Out=Thrust;
