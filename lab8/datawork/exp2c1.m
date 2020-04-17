close all
clearvars
addpath(genpath("../../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/exp2c1.raw");
raw_data.variable_name_list
var = raw_data.variable_mat;

Vdm = var(2,:) - var(5,:);
Iout = var(21,:);

gmff = polyfit(Vdm(25:37),Iout(25:37),1);
gmfit = polyval(gmff, Vdm);

figure()
plot(Vdm, Iout, 'r.', ...
    Vdm, gmfit, 'r');
xlim([-.3 .3]);
ylim([-5e-7 5e-7]);
VTCtitle = sprintf('$I_{out}$ vs. $V_{dm}$ with $G_m$ of = $%.8f$ $\\frac{1}{\\Omega}$ with $V_b$ at $.7V$', gmff(1));
title(VTCtitle ,'Interpreter', 'Latex');
xlabel('$V_{dm}$','Interpreter', 'Latex');
ylabel('$I_{out}$','Interpreter', 'Latex');
legend('Data', 'Fit','Interpreter', 'Latex');

