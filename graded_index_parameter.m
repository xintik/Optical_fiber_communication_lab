clc;
clear;
close all;
n1 = 1.48;
n2 = 1.46;
a = 25e-6;
alpha_value = [ 1 , 2, 4, 10];
r = linspace(0, a , 500);
delta = (n1^2 - n2^2 )/( 2 * n1^2);
figure;
hold on;
for k = 1 : length(alpha_value)
    alpha = alpha_value(k);
    nr  = n1 .* sqrt(1 - 2 * delta.* (r ./ a).^alpha);
    plot(r*1e6 , nr , 'LineWidth',2);
end
grid on;
xlabel('Radius of core (\mum');
ylabel('core refractive index n(r)');
title('Core refractive index vs radius different profile parameters');
legend('\alpha = 1' , '\alpha = 2' , '\alpha = 4', '\alpha = 10');

hold off;

figure;
hold on;
for k = 1 : length(alpha_value)
    alpha = alpha_value(k);
    NA_r = n1 .*sqrt(2 * delta * (1 - (r./a).^alpha));
    plot(r*1e6 , NA_r , 'LineWidth', 2);
end
grid on;
xlabel('core radious r (\mum)');
ylabel('Numarical aperture NA(r)');
title('Numarical Aperture vs core radious in different profile index');
legend('\alpha = 1' , '\alpha = 2' , '\alpha = 4' , '\alpha = 10');
hold off;
r_given = 10e-6;
alpha = 2;
NA_given = n1 * sqrt(2 * delta * (1 - (r_given/a)^alpha));
theta_a_rad = asin(NA_given);
theta_a_deg = rad2deg(theta_a_rad);
fprintf('For radius r = %.2f micrometer and alpha = %.1f\n', r_given*1e6, alpha);
fprintf('Numerical Aperture at given radius = %.4f\n', NA_given);
fprintf('Acceptance Angle = %.4f degrees\n', theta_a_deg);
