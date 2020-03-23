close all
clearvars

load exp3A.mat

IxB300 = Ix;
IxB3000 = Ix;
IxB30000 = Ix;

% Determine the Ix value for the according resistor
IyB300 = 1e-6;
IyB3000 = 1e-5;
IyB30000 = 1e-4;

%  Make labels for data
 lbl3 = sprintf("Data: I_y (A) = %.8f", IyB300);
 lbl3k = sprintf("Data: I_y (A) = %.8f", IyB3000);
 lbl30k = sprintf("Data: I_y (A) = %.8f", IyB30000);
 
% Make labels for fits
 flbl3 = sprintf("Fit: I_y (A) = %.8f", IyB300);
 flbl3k = sprintf("Fit: I_y (A) = %.8f", IyB3000);
 flbl30k = sprintf("Fit: I_y (A) = %.8f", IyB30000);

% Make theoretical data. Iy values negative due to setup.
fIz300 = (IxB300.^2./IyB300);
fIz3000 = (IxB3000.^2./IyB3000);
fIz30000 = (IxB30000.^2./IyB30000);

% Plot away. Iz values are negative due to setup.
loglog(IxB300, Iz1, 'r.', ...
       IxB3000, Iz10, 'b.', ...
       IxB30000, Iz100, 'g.',...
       IxB300, fIz300, 'r', ...
       IxB3000, fIz3000, 'b', ...
       IxB30000, fIz30000, 'g')
xlabel('I_x Current (A)')
ylabel('I_z Current (A)')
legend(lbl3, lbl3k, lbl30k, flbl3, flbl3k, flbl30k)
title('I_z as a function of I_x for all I_y values')