clc;
clear;
close all;

n1 = 1.48;
n2 = 1.46;
a = 25e-6;                 % Core radius (m)
lamda = 870e-9;            % Wavelength (m)

NA = sqrt(n1^2 - n2^2);

V_number = (2*pi*a/lamda)*NA;

% Graded-index fiber
M = V_number^2/4;

lamda_graph = linspace(0.5e-6,2e-6,500);

v_graph = (2*pi*a./lamda_graph).*NA;

if V_number < 2.405
    fprintf('Fiber Type : Single Mode\n');
else
    fprintf('Fiber Type : Multimode\n');
end

figure;
plot(lamda_graph*1e6,v_graph,'LineWidth',2);
grid on;
xlabel('Wavelength (\mum)');
ylabel('Normalized Frequency (V)');
title('Normalized Frequency vs Wavelength');

lambda_cutoff = (2*pi*a*NA)/2.405;

fprintf('Numerical Aperture = %.4f\n',NA);
fprintf('V Number = %.4f\n',V_number);
fprintf('Cutoff Wavelength = %.3e m\n',lambda_cutoff);
fprintf('Maximum Guided Modes = %.2f\n',M);