clearvars
close all
load exp3datatry3.mat;
% load exp4data.mat

Icff = polyfit(Vin, Vout, 1);
Icfit = polyval(Icff, Vin);
% Make plots
figure(1)
plot(Vin, Vout, 'r.',...
     Vin, Icfit, 'b')
legend("Measured", "Theoretical")
xlabel('V_{in} (V)')
ylabel('V_{out} (V)')
txt = sprintf("Emitter-Follower's Voltage Transfer Characteristic (VTC) with m = %.2f and  b = %.2f", Icff(1), Icff(2));
title(txt)

load exp4datanew.mat;
R6040ff = polyfit(Vin(11:47),Vout6001(11:47), 1);
R6040fit = polyval(R6040ff, Vin(11:47));
R9090ff = polyfit(Vin(11:39),Vout9030(11:39), 1);
R9090fit = polyval(R9090ff, Vin(11:39));
R12100ff = polyfit(Vin(11:34),Vout12068(11:34), 1);
R12100fit = polyval(R12100ff, Vin(11:34));


figure(2)
plot(Vin, Vout6001, 'r.',...
     Vin(11:47), R6040fit, 'r',...
     Vin, Vout9030, 'b.', ...
     Vin(11:39), R9090fit, 'b',...
     Vin, Vout12068, 'g.', ...
     Vin(11:34), R12100fit, 'g',...
     Vin, Vout, 'c.')
label6040 = sprintf("m = %.2f", R6040ff(1));
label9090 = sprintf("m = %.2f", R9090ff(1));
label12100 = sprintf("m = %.2f", R12100ff(1));
legend("Data: R = 6040 \Omega", strcat("Fit: R = 6040 \Omega, ", label6040),...
    "Data: R = 9090 \Omega", strcat("Fit: R = 9090 \Omega, ", label9090),...
    "Data: R = 12100 \Omega", strcat("Fit: R = 12100 \Omega, ", label12100), ...
    "Emitter-Follower VTC")
xlabel('V_{in} (V)')
ylabel('V_{out} (V)')
title("Inverter Voltage Transfer Characteristic (VTC)")