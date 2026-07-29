clc;
clear;
close all;

n1 = 1.48;
n2 = 1.46;

a = 8e-6;              % Core radius (m)
lamda = 870e-9;        % Wavelength (m)

NA = sqrt(n1^2-n2^2);

V = (2*pi*a*NA)/lamda;

w = a*(0.65 + 1.619/(V^(3/2)) + 2.879/(V^6));

MFD = 2*w;

fprintf('Numerical Aperture = %.4f\n',NA);
fprintf('V number = %.3f\n',V);
fprintf('Mode Field Radius = %.3f um\n',w*1e6);
fprintf('Mode Field Diameter = %.3f um\n',MFD*1e6);
r = linspace(-3*w , 3*w ,500);
I = exp(-(2*(r.^2)/(w^2)));
figure ;
hold on;
grid on;

plot(r,I,'LineWidth',2);

xlabel('Radial distance r');
ylabel('Nomalize intensity I(r)');
title('I(r) vs r ');
hold off;
