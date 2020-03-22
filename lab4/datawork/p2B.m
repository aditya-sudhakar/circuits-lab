close all
clearvars

load exp2Bdata.mat

IxB300 = Vin./R3;
IxB3000 = Vin./R3k;
IxB30000 = Vin./R30k;

lbl3 = sprintf("I_x = %.8f", IxB300);
lbl3k = sprintf("I_x = %.8f", IxB3000);
lbl30k = sprintf("I_x = %.8f", IxB30000);

loglog(IyB300, IzB300, 'r.', ...
       IyB3000, IzB3000, 'b.', ...
       IyB30000, IzB30000, 'g.')
xlabel('I_y Current (A)')
ylabel('I_z Current (A)')
legend(lbl3, lbl3k, lbl30k)
title('I_z as a function of I_y for all I_x values')