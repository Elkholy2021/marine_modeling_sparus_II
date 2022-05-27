
syms x
cyl.m=48.79;
cyl.R=0.115;
cyl.L=1.6;
rho=1000;

%%
cyl.a22=pi*cyl.R^2;
cyl.a33=pi*cyl.R^2;
cyl.a44=0;
cyl.a= cyl.L/2;
cyl.b=cyl.R;
cyl.m_df=(4/3)*rho*pi*cyl.a*cyl.b*cyl.b;

cyl.e=sqrt(1-((cyl.b^2)/(cyl.a^2)));
cyl.alpha0=2*((1-cyl.e^2)/cyl.e^3)*(0.5*log((1+cyl.e)/(1-cyl.e))-cyl.e);
cyl.k1=cyl.alpha0/(2-cyl.alpha0);
cyl.m11=cyl.k1*cyl.m_df;
cyl.m22 = rho*(integral(@(x) ((x*0)+cyl.a22),-0.5*cyl.L,0.5*cyl.L));
cyl.m33 = rho*integral(@(x) ((x*0)+cyl.a33),-0.5*cyl.L,0.5*cyl.L);
cyl.m44 = rho*integral(@(x) ((x*0)+cyl.a44),-0.5*cyl.L,0.5*cyl.L);
cyl.m55 = rho*integral(@(x) ((x.^2).*cyl.a33),-0.5*cyl.L,0.5*cyl.L);
cyl.m66 = rho*integral(@(x) ((x.^2).*cyl.a22),-0.5*cyl.L,0.5*cyl.L);
cyl.m26 = rho*integral(@(x) -((x).*cyl.a22),-0.5*cyl.L,0.5*cyl.L);
cyl.m35 = rho*integral(@(x) (-(x).*cyl.a33),-0.5*cyl.L,0.5*cyl.L);
cyl.m53 = rho*integral(@(x) (-(x).*cyl.a33),-0.5*cyl.L,0.5*cyl.L);
cyl.m62 = rho*integral(@(x) (-(x).*cyl.a22),-0.5*cyl.L,0.5*cyl.L);
cyl.M_a=zeros(6);

cyl.M_a(1,1)=cyl.m11;
cyl.M_a(2,2)=cyl.m22;
cyl.M_a(3,3)=cyl.m33;
cyl.M_a(4,4)=cyl.m44;
cyl.M_a(5,5)=cyl.m55;
cyl.M_a(6,6)=cyl.m66;

cyl.M_a(2,6)=cyl.m26;
cyl.M_a(3,5)=cyl.m35;
cyl.M_a(5,3)=cyl.m53;
cyl.M_a(6,2)=cyl.m62;
cyl.M_a(2,2)=cyl.m22;







