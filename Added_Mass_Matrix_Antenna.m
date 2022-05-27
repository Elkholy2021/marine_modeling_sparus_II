
syms x
antenna.m=0.41;
antenna.length=0.07;
antenna.width=0.03;
antenna.height=0.25;
rho=1000;
    
%%
antenna.a_y_dirction=antenna.length/2;
antenna.b_y_dirction=antenna.width/2;
antenna.A_R_y_direction=pi*antenna.a_y_dirction^2;
antenna.C_A_y_direction=1.36; %because ration of a/b =2.33
antenna.a22=rho*antenna.C_A_y_direction*antenna.A_R_y_direction;


antenna.a_x_dirction=antenna.width/2;
antenna.b_x_dirction=antenna.length/2;
antenna.A_R_x_direction=pi*antenna.a_x_dirction^2;
antenna.C_A_x_direction=1.7; % because ration of a/b=0.42
antenna.a11=rho*antenna.C_A_x_direction*antenna.A_R_x_direction;


antenna.a= antenna.height/2;
antenna.b=(sqrt(antenna.length/2*antenna.width/2));
antenna.m_df=(4/3)*rho*pi*antenna.a*antenna.length/2*antenna.width/2;
antenna.e=sqrt(1-((antenna.b^2)/(antenna.a^2)));
antenna.beta0=(1/antenna.e^2)-((1-antenna.e^2)/2*antenna.e^3)*log((1+antenna.e)/(1-antenna.e));
antenna.k2=antenna.beta0/(2-antenna.beta0);
% antenna.m33=antenna.k2*antenna.m_df;

%%
antenna.m11 = (integral(@(x) ((x*0)+antenna.a11),-0.5*antenna.height,0.5*antenna.height));
antenna.m22 = (integral(@(x) ((x*0)+antenna.a22),-0.5*antenna.height,0.5*antenna.height));
antenna.m33=rho*0.17*antenna.length*antenna.width*antenna.height;

% antenna.m44 = (integral(@(x) ((x*2).*antenna.m22/antenna.height),-0.5*antenna.height,0.5*antenna.height));
% antenna.m55 = (integral(@(x) ((x*2).*antenna.m11/antenna.height),-0.5*antenna.height,0.5*antenna.height));
antenna.m44 = (integral(@(x) ((x*2).*antenna.a22),-0.5*antenna.height,0.5*antenna.height));
antenna.m55 = (integral(@(x) ((x*2).*antenna.a11),-0.5*antenna.height,0.5*antenna.height));
antenna.m66 = 0.15*rho*pi*(antenna.length/2)^4;

antenna.m26 = (integral(@(x) (-(x*1).*antenna.a22),-0.5*antenna.height,0.5*antenna.height));
antenna.m35 = (integral(@(x) (-(x*1).*antenna.a11),-0.5*antenna.height,0.5*antenna.height));
antenna.m53 = antenna.m35;
antenna.m62 = antenna.m26;

antenna.M_a=zeros(6);

antenna.M_a(1,1)=antenna.m11;
antenna.M_a(2,2)=antenna.m22;
antenna.M_a(3,3)=antenna.m33;
antenna.M_a(4,4)=antenna.m44;
antenna.M_a(5,5)=antenna.m55;
antenna.M_a(6,6)=antenna.m66;

antenna.M_a(2,6)=antenna.m26;
antenna.M_a(3,5)=antenna.m35;
antenna.M_a(5,3)=antenna.m53;
antenna.M_a(6,2)=antenna.m62;
antenna.M_a(2,2)=antenna.m22;

%% Transformation to Cg
antenna.Ma_sub=antenna.M_a(1:3,1:3);
antenna.Ia_sub=antenna.M_a(4:6,4:6);
antenna.r_gb=[-0.315,0,-0.11];

antenna.S_r_gb=[0   -antenna.r_gb(3)   antenna.r_gb(2) ;
 antenna.r_gb(3)    0  -antenna.r_gb(1) ;
-antenna.r_gb(2)    antenna.r_gb(1)   0  ];

antenna.M_a_transformed=[antenna.Ma_sub  -antenna.Ma_sub*antenna.S_r_gb;
                         antenna.S_r_gb*antenna.Ma_sub antenna.Ia_sub-antenna.S_r_gb*antenna.Ma_sub*antenna.S_r_gb];
% 5432
% antenna.M_a_transformed
% tt=transform(antenna.M_a,antenna.r_gb)

