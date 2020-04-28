close all
clearvars
addpath(genpath("../../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/exp2b.raw");
raw_data.variable_name_list
var = raw_data.variable_mat;

Vout = var(18,:,1);
Iout = var(25,:,1);



Rff = polyfit(Vout(1001:4001),(Iout(1001:4001)), 1);
Rfit = polyval(Rff, Vout);



figure()
plot(Vout, Iout, 'r.',...
     Vout, Rfit, 'r');

ylim([-2e-7 2e-7]);
title("$I_{out}$ vs $V_{out}$ ", 'Interpreter', 'Latex');
xlabel("$V_{out}$ (V)", 'Interpreter', 'Latex');
ylabel("$I_{out}$ (A)", 'Interpreter', 'Latex');
fitwText = sprintf('Fit, $R_{out}$ = $%.3f$ $M\\Omega$', (1/Rff(1))/1000000);
legend('Data',fitwText, 'Interpreter', 'Latex');

