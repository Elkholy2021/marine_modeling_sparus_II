
syms x
right_thruster.m=1.24;
right_thruster.R=0.04;
right_thruster.L=0.26;
rho=1000;

%%
right_thruster.a22=pi*right_thruster.R^2;
right_thruster.a33=pi*right_thruster.R^2;
right_thruster.a44=0;
right_thruster.a= right_thruster.L/2;
right_thruster.b=right_thruster.R;
right_thruster.m_df=(4/3)*rho*pi*right_thruster.a*right_thruster.b*right_thruster.b;

right_thruster.e=sqrt(1-((right_thruster.b^2)/(right_thruster.a^2)));
right_thruster.alpha0=2*((1-right_thruster.e^2)/right_thruster.e^3)*(0.5*log((1+right_thruster.e)/(1-right_thruster.e))-right_thruster.e);
right_thruster.k1=right_thruster.alpha0/(2-right_thruster.alpha0);
right_thruster.m11=right_thruster.k1*right_thruster.m_df;
right_thruster.m22 = rho*(integral(@(x) ((x*0)+right_thruster.a22),-0.5*right_thruster.L,0.5*right_thruster.L));
right_thruster.m33 = rho*integral(@(x) ((x*0)+right_thruster.a33),-0.5*right_thruster.L,0.5*right_thruster.L);
right_thruster.m44 = rho*integral(@(x) ((x*0)+right_thruster.a44),-0.5*right_thruster.L,0.5*right_thruster.L);
right_thruster.m55 = rho*integral(@(x) ((x.^2).*right_thruster.a33),-0.5*right_thruster.L,0.5*right_thruster.L);
right_thruster.m66 = rho*integral(@(x) ((x.^2).*right_thruster.a22),-0.5*right_thruster.L,0.5*right_thruster.L);
right_thruster.m26 = rho*integral(@(x) -((x).*right_thruster.a22),-0.5*right_thruster.L,0.5*right_thruster.L);
right_thruster.m35 = rho*integral(@(x) (-(x).*right_thruster.a33),-0.5*right_thruster.L,0.5*right_thruster.L);
right_thruster.m53 = rho*integral(@(x) (-(x).*right_thruster.a33),-0.5*right_thruster.L,0.5*right_thruster.L);
right_thruster.m62 = rho*integral(@(x) (-(x).*right_thruster.a22),-0.5*right_thruster.L,0.5*right_thruster.L);
right_thruster.M_a=zeros(6);

right_thruster.M_a(1,1)=right_thruster.m11;
right_thruster.M_a(2,2)=right_thruster.m22;
right_thruster.M_a(3,3)=right_thruster.m33;
right_thruster.M_a(4,4)=right_thruster.m44;
right_thruster.M_a(5,5)=right_thruster.m55;
right_thruster.M_a(6,6)=right_thruster.m66;

right_thruster.M_a(2,6)=right_thruster.m26;
right_thruster.M_a(3,5)=right_thruster.m35;
right_thruster.M_a(5,3)=right_thruster.m53;
right_thruster.M_a(6,2)=right_thruster.m62;
right_thruster.M_a(2,2)=right_thruster.m22;

%% Transformation to Cg
right_thruster.Ma_sub=right_thruster.M_a(1:3,1:3);
right_thruster.Ia_sub=right_thruster.M_a(4:6,4:6);
right_thruster.r_gb=[-0.59,0.17,0];

right_thruster.S_r_gb=[0   -right_thruster.r_gb(3)   right_thruster.r_gb(2) ;
 right_thruster.r_gb(3)    0  -right_thruster.r_gb(1) ;
-right_thruster.r_gb(2)    right_thruster.r_gb(1)   0  ];

right_thruster.M_a_transformed=[right_thruster.Ma_sub  -right_thruster.Ma_sub*right_thruster.S_r_gb;
                         right_thruster.S_r_gb*right_thruster.Ma_sub right_thruster.Ia_sub-right_thruster.S_r_gb*right_thruster.Ma_sub*right_thruster.S_r_gb];







