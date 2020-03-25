close all
clearvars

load exp2Adata.mat

% Determine the Iy value for the according resistor
IyA300 = Vin./R3;
IyA3000 = Vin./R3k;
IyA30000 = Vin./R30k;

% Make labels for data
lbl3 = sprintf("Data: I_y = %.8f A", IyA300);
lbl3k = sprintf("Data: I_y = %.8f A", IyA3000);
lbl30k = sprintf("Data: I_y = %.8f A", IyA30000);

% Make labels for fits
flbl3 = sprintf("Fit: I_y = %.8f A", IyA300);
flbl3k = sprintf("Fit: I_y = %.8f A", IyA3000);
flbl30k = sprintf("Fit: I_y = %.8f A", IyA30000);

% Make theoretical data
fIz300 = sqrt(IxA300.*IyA300);
fIz3000 = sqrt(IxA3000.*IyA3000);
fIz30000 = sqrt(IxA30000.*IyA30000);

% Plot away. Iz values are negative due to setup.
loglog(IxA300, -IzA300, 'r.', ...
       IxA3000, -IzA3000, 'b.', ...
       IxA30000, -IzA30000, 'g.', ...
       IxA30000, fIz300, 'r', ...
       IxA30000, fIz3000, 'b', ...
       IxA30000, fIz30000, 'g')
xlabel('I_x Current (A)')
ylabel('I_z Current (A)')
ylim([5*1e-9,1e-3])
legend(lbl3, lbl3k, lbl30k, flbl3, flbl3k, flbl30k)
title('I_z as a function of I_x for all I_y values')
