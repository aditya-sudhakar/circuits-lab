close all
clearvars

load exp3A.mat


% Determine the Ix value for the according resistor
IyB300 = Vin./R3;
IyB3000 = Vin./R3k;
IyB30000 = Vin./R30k;

% Make labels for data
lbl3 = sprintf("Data: I_x = %.8f", IyB300);
lbl3k = sprintf("Data: I_x = %.8f", IyB3000);
lbl30k = sprintf("Data: I_x = %.8f", IyB30000);

% Make labels for fits
flbl3 = sprintf("Fit: I_x = %.8f", IyB300);
flbl3k = sprintf("Fit: I_x = %.8f", IyB3000);
flbl30k = sprintf("Fit: I_x = %.8f", IyB30000);

% Make theoretical data. Iy values negative due to setup.
fIz300 = (IxB300.^2./-IyB300);
fIz3000 = (IxB3000.^2./-IyB3000);
fIz30000 = (IxB30000.^2./-IyB30000);

% Plot away. Iz values are negative due to setup.
loglog(IyB300, -IxB300, 'r.', ...
       IyB3000, -IxB3000, 'b.', ...
       IyB30000, -IxB30000, 'g.',...
       IyB300, fIz300, 'r', ...
       IyB3000, fIz3000, 'b', ...
       IyB30000, fIz30000, 'g')
xlabel('I_y Current (A)')
ylabel('I_z Current (A)')
legend(lbl3, lbl3k, lbl30k, flbl3, flbl3k, flbl30k)
title('I_z as a function of I_x for all I_y values')