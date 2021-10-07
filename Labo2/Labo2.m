% Resistances
Rpbar = 0.47; % [kOhm]
R12 = 4.7; % [kOhm]

% Current
ipercentbar = 50; % % de mA

% Capacitance
C1 = 2.2; % [mF]
C2 = C1; % [mF]

% Voltage
V1bar = (-ipercentbar/(5*C1))/(1/(C1*R12)-(1/Rpbar + 1/R12)/C1); % [V]
V2bar = V1bar; % car C1 = C2

% Représentation d'état
% A components
a11 = (1/Rpbar+1/R12)/C1;
a12 = 1/(C1*R12);
a21 = a12;
a22 = 1/(C2*R12); % = à a12 et a21 puisque C1=C2
A = [a11 a12;a21 a22];

% B components
b = 1/(5*C1);
B = [b;0];

% C components
C = [0 10;-10 20]; % 1st row : minimum phase ; 2nd row : non-minimum phase 

% D components
d = V1bar/(C1*Rpbar*Rpbar);
D = [d;0];


% Settling time measurements 

% Minimum phase : 
[num_m,denum_m] = ss2tf(A,B,C(1,:),0);
Gs_min = tf(num_m,denum_m)
[num_v_m,denum_v_m] = ss2tf(A,D,C(1,:),0);
Hs_min = tf(num_v_m,denum_v_m)





