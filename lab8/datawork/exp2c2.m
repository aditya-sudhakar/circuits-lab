close all
clearvars
addpath(genpath("../../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/exp2c2.raw");
raw_data.variable_name_list
var = raw_data.variable_mat;

Vdm = var(2,:) - var(5,:);
Iout = var(21,:);

gmff = polyfit(Vdm(15:27),Iout(15:27),1);
gmfit = polyval(gmff, Vdm);

figure()
plot(Vdm, Iout, 'b.', ...
    Vdm, gmfit, 'b');
xlim([-1 1]);
ylim([-3e-5 2.5e-5]);
VTCtitle = sprintf('$I_{out}$ vs. $V_{dm}$ with $G_m$ of = $%.8f$ $\\frac{1}{\\Omega}$ with $V_b$ at $1.5V$', gmff(1));
title(VTCtitle ,'Interpreter', 'Latex');
xlabel('$V_{dm}$','Interpreter', 'Latex');
ylabel('$I_{out}$','Interpreter', 'Latex');
fitwText = sprintf('Fit for WI, $R_{out}$ = $%.3f$ $M\\Omega$', (-1/WIff(1))/1000000);
fitsText = sprintf('Fit for SI, $R_{out}$ = $%.3f$ $M\\Omega$', (-1/SIff(1))/1000000);
legend('Data', 'Fit','Interpreter', 'Latex');

