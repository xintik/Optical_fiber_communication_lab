clc;
clear;
close all;

n1 = 1.48;
n2 = 1.46;
a = 4.5e-6;

lambda0 = 1.55e-6;
c = 3e8;

Delta = (n1-n2)/n1;
NA = sqrt(n1^2-n2^2);


% V number at given wavelength
V0 = (2*pi*a*NA)/lambda0;


% Cutoff wavelength
lambda_cutoff = (2*pi*a*NA)/2.405;


% Wavelength range
lambda = linspace(0.8e-6,2e-6,1000);


% V number
V = (2*pi*a*NA)./lambda;


% Normalized propagation constant

b=zeros(size(V));

for i=1:length(V)

    if V(i)>2.405
        b(i)=1-(2.405/V(i))^2;
    else
        b(i)=0.5;
    end

end


% Effective refractive index

K0 = 2*pi./lambda;

beta = n2.*K0.*(1+b*Delta);

neff = beta./K0;


% Derivatives

dneff_dlambda = gradient(neff,lambda);

d2neff_dlambda2 = gradient(dneff_dlambda,lambda);


% Waveguide dispersion

Dw = -(lambda./c).*d2neff_dlambda2;


% Conversion

Dw = Dw*1e6;


% Value at 1.55 um

[~,idx]=min(abs(lambda-lambda0));

given = Dw(idx);


fprintf('V Number = %.4f\n',V0);

fprintf('Cut-off wavelength = %.4f um\n',lambda_cutoff*1e6);

fprintf('Waveguide dispersion at %.2f um = %.4f ps/(nm.km)\n',...
lambda0*1e6,given);




figure;

plot(lambda*1e6,Dw,'LineWidth',2);

grid on;

xlabel('Wavelength (\mum)');
ylabel('Waveguide Dispersion (ps/nm.km)');

title('Waveguide Dispersion vs Wavelength');