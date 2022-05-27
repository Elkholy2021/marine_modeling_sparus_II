
syms x
left_thruster.m=1.24;
left_thruster.R=0.04;
left_thruster.L=0.26;
rho=1000;

%%
left_thruster.a22=pi*left_thruster.R^2;
left_thruster.a33=pi*left_thruster.R^2;
left_thruster.a44=0;
left_thruster.a= left_thruster.L/2;
left_thruster.b=left_thruster.R;
left_thruster.m_df=(4/3)*rho*pi*left_thruster.a*left_thruster.b*left_thruster.b;

left_thruster.e=sqrt(1-((left_thruster.b^2)/(left_thruster.a^2)));
left_thruster.alpha0=2*((1-left_thruster.e^2)/left_thruster.e^3)*(0.5*log((1+left_thruster.e)/(1-left_thruster.e))-left_thruster.e);
left_thruster.k1=left_thruster.alpha0/(2-left_thruster.alpha0);
left_thruster.m11=left_thruster.k1*left_thruster.m_df;
left_thruster.m22 = rho*(integral(@(x) ((x*0)+left_thruster.a22),-0.5*left_thruster.L,0.5*left_thruster.L));
left_thruster.m33 = rho*integral(@(x) ((x*0)+left_thruster.a33),-0.5*left_thruster.L,0.5*left_thruster.L);
left_thruster.m44 = rho*integral(@(x) ((x*0)+left_thruster.a44),-0.5*left_thruster.L,0.5*left_thruster.L);
left_thruster.m55 = rho*integral(@(x) ((x.^2).*left_thruster.a33),-0.5*left_thruster.L,0.5*left_thruster.L);
left_thruster.m66 = rho*integral(@(x) ((x.^2).*left_thruster.a22),-0.5*left_thruster.L,0.5*left_thruster.L);
left_thruster.m26 = rho*integral(@(x) -((x).*left_thruster.a22),-0.5*left_thruster.L,0.5*left_thruster.L);
left_thruster.m35 = rho*integral(@(x) (-(x).*left_thruster.a33),-0.5*left_thruster.L,0.5*left_thruster.L);
left_thruster.m53 = rho*integral(@(x) (-(x).*left_thruster.a33),-0.5*left_thruster.L,0.5*left_thruster.L);
left_thruster.m62 = rho*integral(@(x) (-(x).*left_thruster.a22),-0.5*left_thruster.L,0.5*left_thruster.L);
left_thruster.M_a=zeros(6);

left_thruster.M_a(1,1)=left_thruster.m11;
left_thruster.M_a(2,2)=left_thruster.m22;
left_thruster.M_a(3,3)=left_thruster.m33;
left_thruster.M_a(4,4)=left_thruster.m44;
left_thruster.M_a(5,5)=left_thruster.m55;
left_thruster.M_a(6,6)=left_thruster.m66;

left_thruster.M_a(2,6)=left_thruster.m26;
left_thruster.M_a(3,5)=left_thruster.m35;
left_thruster.M_a(5,3)=left_thruster.m53;
left_thruster.M_a(6,2)=left_thruster.m62;
left_thruster.M_a(2,2)=left_thruster.m22;

%% Transformation to Cg
left_thruster.Ma_sub=left_thruster.M_a(1:3,1:3);
left_thruster.Ia_sub=left_thruster.M_a(4:6,4:6);
left_thruster.r_gb=[-0.59,-0.17,0];

left_thruster.S_r_gb=[0   -left_thruster.r_gb(3)   left_thruster.r_gb(2) ;
 left_thruster.r_gb(3)    0  -left_thruster.r_gb(1) ;
-left_thruster.r_gb(2)    left_thruster.r_gb(1)   0  ];

left_thruster.M_a_transformed=[left_thruster.Ma_sub  -left_thruster.Ma_sub*left_thruster.S_r_gb;
                         left_thruster.S_r_gb*left_thruster.Ma_sub left_thruster.Ia_sub-left_thruster.S_r_gb*left_thruster.Ma_sub*left_thruster.S_r_gb];







