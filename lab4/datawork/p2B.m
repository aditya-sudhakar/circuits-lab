close all
clearvars

load exp2Bdata.mat

% Determine the Ix value for the according resistor
IxB300 = Vin./R3;
IxB3000 = Vin./R3k;
IxB30000 = Vin./R30k;

% Make labels for data
lbl3 = sprintf("Data: I_x = %.8f A", IxB300);
lbl3k = sprintf("Data: I_x = %.8f A", IxB3000);
lbl30k = sprintf("Data: I_x = %.8f A", IxB30000);

% Make labels for fits
flbl3 = sprintf("Fit: I_x = %.8f A", IxB300);
flbl3k = sprintf("Fit: I_x = %.8f A", IxB3000);
flbl30k = sprintf("Fit: I_x = %.8f A", IxB30000);

% Make theoretical data. Iy values negative due to setup.
fIz300 = sqrt(IxB300.*-IyB300);
fIz3000 = sqrt(IxB3000.*-IyB3000);
fIz30000 = sqrt(IxB30000.*-IyB30000);

% Plot away. Iz values are negative due to setup.
loglog(IyB300, -IzB300, 'r.', ...
       IyB3000, -IzB3000, 'b.', ...
       IyB30000, -IzB30000, 'g.',...
       IyB300, fIz300, 'r', ...
       IyB3000, fIz3000, 'b', ...
       IyB30000, fIz30000, 'g')
xlabel('I_y Current (A)')
ylabel('I_z Current (A)')
ylim([5*1e-6,1e-3])
legend(lbl3, lbl3k, lbl30k, flbl3, flbl3k, flbl30k)
title('I_z as a function of I_y for all I_x values')