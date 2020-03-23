close all
clearvars

load exp3B.mat

IyB300 = Iy;
IyB3000 = Iy;
IyB30000 = Iy;

% Determine the Ix value for the according resistor
IxB300 = 1e-6;
IxB3000 = 1e-5;
IxB30000 = 1e-4;

%  Make labels for data
 lbl3 = sprintf("Data: I_x (A) = %.8f", IxB300);
 lbl3k = sprintf("Data: I_x (A) = %.8f", IxB3000);
 lbl30k = sprintf("Data: I_x (A) = %.8f", IxB30000);
 
% Make labels for fits
 flbl3 = sprintf("Fit: I_x (A) = %.8f", IxB300);
 flbl3k = sprintf("Fit: I_x (A) = %.8f", IxB3000);
 flbl30k = sprintf("Fit: I_x (A) = %.8f", IxB30000);

% Make theoretical data. Iy values positive due to setup LTspice.
fIz300 = (IxB300.^2./IyB300);
fIz3000 = (IxB3000.^2./IyB3000);
fIz30000 = (IxB30000.^2./IyB30000);

% Plot away. Iz values are positive due to setup.
loglog(IyB300, Iz1, 'r.', ...
       IyB3000, Iz10, 'b.', ...
       IyB30000, Iz100, 'g.',...
       IyB300, fIz300, 'r', ...
       IyB3000, fIz3000, 'b', ...
       IyB30000, fIz30000, 'g')
xlabel('I_y Current (A)')
ylabel('I_z Current (A)')
legend(lbl3, lbl3k, lbl30k, flbl3, flbl3k, flbl30k)
title('I_z as a function of I_y for all I_x values')