clc;
clear;
close all;

% Wavelength range (micrometer)
lambda = linspace(1.4, 2.8, 1000);   

% Infrared absorption loss model
% alpha_IR = 0.01*exp(4*(lambda-1.55))
alpha_IR = 0.01 * exp(4*(lambda - 1.55));   % dB/km

% Calculate loss at 1.55 um
given_lambda = 1.55;

[~, idx] = min(abs(lambda - given_lambda));

alpha_given = alpha_IR(idx);

fprintf('Infrared Absorption Loss at %.2f um = %.6f dB/km\n',...
        given_lambda, alpha_given);

% Plot
figure;
plot(lambda, alpha_IR, 'LineWidth', 2);

grid on;
xlabel('Wavelength (\mum)');
ylabel('Infrared Absorption Loss (dB/km)');
title('Infrared Absorption Loss vs Wavelength');
