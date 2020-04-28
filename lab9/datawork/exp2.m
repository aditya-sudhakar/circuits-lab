close all
clearvars
addpath(genpath("../../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/exp2a.raw");
raw_data.variable_name_list
var = raw_data.variable_mat;

V1 = var(2,:);
V2 = var(5,:);

Vdm = V1-V2;

Vout = var(20,:);


mbff = polyfit(Vdm(51:63),(Vout(51:63)), 1);
mbfit = polyval(mbff, Vdm);

figure()
plot(Vdm, Vout, 'r.',...
     Vdm, mbfit, 'r');

ylim([0 5])
xlim([-0.02 .03])
title("$V_{out}$ vs $V_{dm}$ ", 'Interpreter', 'Latex');
xlabel("$V_{dm}$ (V)", 'Interpreter', 'Latex');
ylabel("$V_{out}$ (V)", 'Interpreter', 'Latex');
fitwText = sprintf('Fit, $A_{dm}$ = $%.3f$ ', mbff(1));
legend('Data',fitwText, 'Interpreter', 'Latex');

mbff


