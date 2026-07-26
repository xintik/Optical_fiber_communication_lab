clc;
clear;
close all;
n1 = 1.48;
n2 = 1.46;
lamda = 850e-9;
NA = sqrt(n1^2 - n2^2);
Theta_a_rad = asin(NA);
Theta_a_deg = rad2deg(Theta_a_rad);
Omega = 2*pi*(1-cos(Theta_a_rad));
beta = (2*pi*n1)/lamda;%propagation constant

fprintf("Numarical Aperture : %f\n",NA);
fprintf("Acceptance Angel : %.2f degrees\n",Theta_a_deg);
fprintf("Solid Acceptance angle : %.4f sr\n",Omega);
fprintf("Propagation constant : %.4f rad/m \n",beta);
