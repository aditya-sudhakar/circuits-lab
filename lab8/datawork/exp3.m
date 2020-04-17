close all
clearvars
addpath(genpath("../../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/exp3.raw");
vnml=raw_data.variable_name_list;
var = raw_data.variable_mat;

Vin = var(2,:);
Vout = var(5,:);

ff = polyfit(Vin(40:60), Vout(40:60),1)
Vfit = polyval(ff, Vin);

figure(1)
plot(Vin, Vout,'r.',Vin, Vfit,'r')
legend('Data','Fit')
ylabel("$V_{out}$", 'Interpreter', 'Latex')
xlabel("$V_{in}$", 'Interpreter', 'Latex')
ylim([0 5])
title("VTC of the unity-gain follower: Incremental gain from fit: 0.9968 (dim-less)", 'Interpreter', 'Latex')

figure(2)
plot(Vin, Vout-Vin, 'r.')
ylabel("$V_{out}-V_{in}$", 'Interpreter', 'Latex')
xlabel("$V_{in}$", 'Interpreter', 'Latex')
ylim([-0.05 0.05])
title("Comparison of $V_{in}$ vs. $V_{out}-V_{in}$ for the unity-gain follower", 'Interpreter', 'Latex')