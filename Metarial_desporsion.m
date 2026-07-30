clc;
clear;
close all;


%% ==============================
% Sellmeier Constants for Pure Silica
% ===============================

B1 = 0.6961663;
B2 = 0.4079426;
B3 = 0.8974794;

C1 = (0.0684043)^2;
C2 = (0.1162414)^2;
C3 = (9.896161)^2;



%% ==============================
% Wavelength Range
% Unit: micrometer (um)
% ===============================

lambda = linspace(0.6,1.8,1000);



%% ==============================
% Calculate Refractive Index
% Sellmeier Equation
% ===============================

n_square = 1 + ...
    (B1*lambda.^2)./(lambda.^2-C1) + ...
    (B2*lambda.^2)./(lambda.^2-C2) + ...
    (B3*lambda.^2)./(lambda.^2-C3);


n = sqrt(n_square);



%% ==============================
% (i) Refractive Index Graph
% ===============================

figure;

plot(lambda,n,'LineWidth',2);

grid on;

xlabel('Wavelength (\mum)');
ylabel('Refractive Index n');

title('Refractive Index vs Wavelength');



%% ==============================
% First Derivative dn/dlambda
% ===============================

dn_dlambda = gradient(n,lambda);



%% ==============================
% (ii) lambda(dn/dlambda)
% ===============================

lambda_dn = lambda .* dn_dlambda;


figure;

plot(lambda,lambda_dn,'LineWidth',2);

grid on;

xlabel('Wavelength (\mum)');
ylabel('\lambda dn/d\lambda');

title('\lambda(dn/d\lambda) vs Wavelength');



%% ==============================
% Second Derivative
% d2n/dlambda2
% ===============================

d2n_dlambda2 = gradient(dn_dlambda,lambda);



%% ==============================
% (iii) Second Derivative Graph
% ===============================

figure;

plot(lambda,d2n_dlambda2,'LineWidth',2);

grid on;

xlabel('Wavelength (\mum)');
ylabel('d^2n/d\lambda^2');

title('Second Derivative of Refractive Index');



%% ==============================
% Material Dispersion Calculation
% ===============================


% Convert wavelength um to meter

lambda_m = lambda*1e-6;


% Convert second derivative
% 1/um^2 to 1/m^2

d2n_m = d2n_dlambda2*1e12;


% Speed of light

c = 3e8;


% Material Dispersion

Dm = -(lambda_m./c).*d2n_m;



% Convert s/m to ps/(nm.km)

Dm_ps = Dm*1e6;



%% ==============================
% (iv) Material Dispersion Graph
% ===============================

figure;

plot(lambda,Dm_ps,'LineWidth',2);

grid on;

xlabel('Wavelength (\mum)');
ylabel('D_m (ps/nm/km)');

title('Material Dispersion vs Wavelength');



%% ==============================
% (v) Material Dispersion at Given Wavelength
% ===============================


lambda_given = 1.55;     % um


% Find nearest wavelength point

[~,index] = min(abs(lambda-lambda_given));


Dm_value = Dm_ps(index);


fprintf('Material Dispersion at %.2f um = %.3f ps/(nm.km)\n',...
    lambda_given,Dm_value);



%% ==============================
% Zero Material Dispersion
% ===============================


[~,zero_index] = min(abs(Dm_ps));


zero_lambda = lambda(zero_index);


fprintf('Zero Material Dispersion Wavelength = %.4f um\n',...
    zero_lambda);