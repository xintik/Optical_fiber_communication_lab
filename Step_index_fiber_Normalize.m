clc;
clear ;
close all;
n1 = 1.48;
n2 = 1.46;
n_eff = 1.47;
lamda = 845e-9;
a = 83e-6;

%propagation constant
B = (2 * pi * n_eff)/lamda;
% normalize propagation constant 
b = (n_eff^2 - n2^2)/(n1^2-n2^2);
%Numarical apperture 
NA = sqrt(n1^2-n2^2);
%Normalize frequncey 
V = (2 * pi * a * NA)/lamda ;

% cut of wavelength 
lamda_c = (2 * pi * a * NA)/2.405;


if V < 2.405
    fprintf("Single mode fiber\n");
    M = 1;
else
    fprintf("MMF\n");
    M = (V^2)/2;
end


V_graph = 0.1 : 0.01 : 10;
b_graph = zeros(size(V_graph));

for i = 1 : length(V_graph)
    if V_graph(i) <= 2.405
        b_graph(i) = 0;

    else
        b_graph(i) = 1-(2.405/V_graph(i))^2;
    end
end

plot(V_graph , b_graph , 'LineWidth' , 3);
grid on;
xlabel("V number " );
ylabel("Normalize probagation constant ");
title("b vs V graph");
xlim([0.1,10]);
ylim([0,1]);
fprintf("Propagation Constant B = %f\n",B);
fprintf("Normalize propagation constant b = %f\n",b);
fprintf("Numarical Aperture = %f \n", NA);
fprintf("V number or normalize frequncy = %f\n", V);
fprintf("Cut Off wavelength = %f\n",lamda_c);
fprintf("Number of the mode = %d\n",M);
