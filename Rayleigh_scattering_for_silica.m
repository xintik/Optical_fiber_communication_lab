clc;
clear;
close all;
lamda = 0.63e-6;
n = 1.46;
p = 0.286;
Bc = 7e-11;
K = 1.380649e-23;
Tf = 1400;
Y = ((8*pi^3)/(3*lamda^4)) * n^8 * p^2 * Bc*K*Tf;
fprintf('Rayleigh scattering coefficient = %f (m^{-1})\n',Y);
lamda0 = linspace(0.6e-6, 1.8e-6 , 10000);
Y0 = ((8*pi^3/ 3 )) * n^8 * p^2 * Bc*K*Tf;
Y1 = Y0./(lamda0).^4;
figure;
hold on;
grid on;
plot(lamda0 , Y1,'LineWidth',2);
xlabel('wavelength (\mum)');
ylabel('Rayleigh scattering losses');
hold off;



