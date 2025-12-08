clear
close all
clc


%culoarea este negru!!!!!!!!!

% 10 25 150
step_time = 10;
initial_value =25;
final_value  = 150;
r=120;%referinta

% ce trebuie sa facem: facem fct de ord 1 si dupa facem fct de ord 2 si
% functia in bucla deschisa a comportamentului dorit yiiipiiii


load("matlab_nou.mat")
data = out.simout_nivel;
[y, u,amor] = filtrareDateSCPI(data);

% figure;    
% hold on;    
% 
% plot(u, y, 'r-', 'LineWidth', 2.5);
% 
% grid on;
% xlabel('Time (s)');
% ylabel('Amplitude');
% title(' Date Filtrate (Trunchiate) ');
% 
% 
% hold off;   

s= tf('s');
timp_pornire= 11;
yst = 87;
y0 =0;


u0 = 0;

tmort = 0;
delta = 1.5;
zeta = 0.8; % din grafic
% zeta =1;

tt = 304 - timp_pornire;

Tp = 97.67;
Kp = r/yst;
Kp = 1.37;

Hp = Kp /( Tp *s  +1);


tt = 150;


omega = 3.9/(zeta*tt);
% 
% Tf = omega^2/(s^2 + 2* s*zeta * omega + omega^2);
% 
% Td = Tf/(1-Tf);
% 
% Tfdo2 = ( omega  * (2*zeta ) ) / ( s * ( 1/( 2*zeta*omega )* s +1 ) ) ;
% 
% 
% 
% Hr = Td / Tf;
% minreal(Hr)
% impulse(Hr)


H0 = ( omega^2 ) / ( s^2 + 2 * zeta * omega * s +  omega^2 );
Hd = H0/(1-H0);
% minreal(Hd)
Hd2 = ( omega / (2*zeta) ) / ( s * ( 1/ ( 2* zeta* omega) * s  + 1) ); %bucla deschisa

Hf = Hp;

Hd = 1/(50*s);
Hr =  Hd/ Hf;
% Hr = (97.67*s+1) /(3480*s)

L = Hr*Hp;
S = 1/(1+L);
% bode(S)
Hee = 0.04/(5e-3*s^2 + 26.1e-2*s + 55.09e-2);

Hpi = Hee * Hp
Hri = ( 97.67 * s + 1 ) / (12.33*s)
