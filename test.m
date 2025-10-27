clear
close all


%culoarea este NIGGA!!!!!!!!!

% 10 25 150
r=150;%referinta

% ce trebuie sa facem: facem fct de ord 1 si dupa facem fct de ord 2 si
% functia in bucla deschisa a comportamentului dorit yiiipiiii

% 
% load('matlab.mat', 'nivel_ursu_1');
% data1 = nivel_ursu_1.simout_nivel;
% [y1, u1,amor1] = filtrareDateSCPI(data1); 
% 
% load('matlab.mat', 'nivel_ursu_2');
% data2 = nivel_ursu_2.simout_nivel;
% [y2, u2,amor2] = filtrareDateSCPI(data2);
% 
% load('matlab.mat', 'nivel_ursu_3');
% data3 = nivel_ursu_3.simout_nivel;
% [y3, u3,amor3] = filtrareDateSCPI(data3); 

load("matlab_nou (1).mat")
data = out.simout_nivel;
[y, u,amor] = filtrareDateSCPI(data);


% minLength = min([length(y1), length(y2), length(y3)]);


% y1_trunc = y1(1:minLength);
% y2_trunc = y2(1:minLength);
% y3_trunc = y3(1:minLength);
% 
% 
% u1_trunc = u1(1:minLength);
% u2_trunc = u2(1:minLength);
% u3_trunc = u3(1:minLength);

% 
% y_mediu = (y1_trunc + y2_trunc + y3_trunc) / 3;
% u_mediu = u1_trunc; 
% 


figure;    
hold on;    

plot(u, y, 'r-', 'LineWidth', 2.5);

grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Comparatie Date Filtrate (Trunchiate) și Media lor');
legend('Data Filtrată 1', 'Data Filtrată 2', 'Data Filtrată 3', 'Media celor 3');

hold off;   

s= tf('s');
timp_pornire= 11;
yst = 87;
y0 =0;


u0 = 0;

tmort = 0;
zeta = 0.9; % din grafic

tt = 304 - timp_pornire;

Tp = (tt -tmort) / 3;
Kp = yst;


Hp = Kp /( Tp *s  +1)


omega = 3.9/(zeta*tt);

Tf = omega^2/(s^2 + 2* s*zeta * omega + omega^2);

Td = Tf/(1-Tf);

Tfdo2 = ( omega  * (2*zeta ) ) / ( s * ( 1/( 2*zeta*omega )* s +1 ) ) ;



Hr = Td / Tf
minreal(Hr)
impulse(Hr)


%  
% 
% 
% 
% CDBD = 