
syms x

%% parameters
%Constant Given values
rho = 1000; 
Re = 10000; %Reynolds number for turbulent water
Cf = 0.074/(Re^(1/5)); % average Friction Coefficient in turbulent water

%% AUV Dimensions
%Main Body
lengthCylinder = 1.6;
rCylinder = 0.115;
dCylinder = 2*rCylinder;

%Antenna
heightAntenna = 0.25;
thicknessAntenna = 0.065; %Thickness of the Antena
widthAntenna = 0.03;

%Thrusters
lengthThruster = 0.26;
widthThruster = 0.1;
rThruster = 0.04;
dThruster = 2*rThruster;

%% Calculation of the Cylinder 

%Values needed for the drag matrix
Scx = pi*rCylinder^2; % Projected surface Surge "x-direction"
Scy = lengthCylinder*dCylinder; % Projected surface Sway "y-direction"
Scz = lengthCylinder*dCylinder; % Projected surface Heave "z-direction"
Cdircx = 1.3; %Drag coefficient Rectangular rod x-direction with L/D (7)>3 -> 1.3
% Cdircy = 0.3; %Drag coefficient Cylinder - Circular rod (cylinder) turbulent
% Cdircz = 0.3; %Drag coefficient Cylinder - Circular rod (cylinder) turbulent

Cdircy = 0.84; %Drag coefficient Cylinder - Circular rod (cylinder) laminar
Cdircz = 0.84; %Drag coefficient Cylinder - Circular rod (cylinder) laminar

%Calculating K values
K11cyl = 0.5*rho*Scx*Cdircx;
K22cyl = 0.5*rho*Scy*Cdircy;
K33cyl = 0.5*rho*Scz*Cdircz;
K44cyl = Cf*(2*pi*rCylinder*lengthCylinder);
K55cyl = int(x^2*K33cyl,-lengthCylinder/2,lengthCylinder/2);
K66cyl = int(x^2*K22cyl,-lengthCylinder/2,lengthCylinder/2);

KqCylinder = [K11cyl   0   0   0   0   0;
                0   K22cyl 0   0   0   0;
                0   0   K33cyl 0   0 0;
                0   0   0   K44cyl 0   0;  
                0   0   0 0   K55cyl 0;
                0   0 0   0   0   K66cyl];

KqCylinder = double(KqCylinder)

%% Calculation of the Antenna

%Values needed for the drag matrix
Sax = heightAntenna*widthAntenna; % Projected surface Surge "x-direction"
Say = thicknessAntenna*heightAntenna; % Projected surface Sway "y-direction"
Saz = thicknessAntenna*widthAntenna; % Projected surface Heave "z-direction"
Cdiax = 2.1; %Drag coefficient Rectangular with Thickness/Height = 0.26 ~ 0.3
Cdiay = 1.9; %Drag coefficient Rectangular with Width/Height = 0.12 ~ 0.1
Cdiaz = 2.5; %Drag coefficient Cylinder with Width/Thickness = 0.46 ~ 0.5


%Calculating K values
K11ant = 0.5*rho*Sax*Cdiax;
K22ant = 0.5*rho*Say*Cdiay;
K33ant = 0.5*rho*Saz*Cdiaz;
K44ant = Cf*(Sax+Say+Saz)*2;
K55ant = int(x^2*K33ant,-heightAntenna/2,heightAntenna/2);
K66ant = int(x^2*K22ant,-heightAntenna/2,heightAntenna/2);

KqAntenna = [K11ant   0   0   0   0   0;
                0   K22ant 0   0   0   0;
                0   0   K33ant 0   0 0;
                0   0   0   K44ant 0   0;  
                0   0   0 0   K55ant 0;
                0   0 0   0   0   K66ant];

KqAntenna = double(KqAntenna)

%% Thurster

%Values needed for the drag matrix
Stx = pi*rThruster^2; % Projected surface in Surge "x-direction"
Sty = 2*rThruster*lengthThruster; % Projected surface in Sway "y-direction"
Stz = widthThruster*lengthThruster; % Projected surface in Heave "z-direction"
Cditx = 0.3; %Drag coefficient Cylinder - Circular rod (cylinder) turbulent
Cdity = 1.2; %Drag coefficient Rectangular plate with L/D (3.25)>5 -> 1.2
Cditz = 1.2; %Drag coefficient Rectangular plate with L/D (3.25)>5 -> 1.2

%Calculating K values
K11thr = 0.5*rho*Stx*Cditx;
K22thr = 0.5*rho*Sty*Cdity;
K33thr = 0.5*rho*Stz*Cditz;
K44thr = Cf*(2*pi*rThruster*lengthThruster);
K55thr = int(x^2*K33thr,-lengthThruster/2,lengthThruster/2);
K66thr = int(x^2*K22thr,-lengthThruster/2,lengthThruster/2);

KqThruster = [K11thr   0   0   0   0   0;
                0   K22thr 0   0   0   0;
                0   0   K33thr 0   0 0;
                0   0   0   K44thr 0   0;  
                0   0   0 0   K55thr 0;
                0   0 0   0   0   K66thr];

KqThruster = double(KqThruster)