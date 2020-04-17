close all
clearvars
addpath(genpath("../../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/exp2b.raw");
raw_data.variable_name_list
var = raw_data.variable_mat;

Voutw = var(16,:,1);
Vouts = var(16,:,2);

Ioutw = var(19,:,1);
Iouts = var(19,:,2);


WIff = polyfit(Voutw(11:41),(Ioutw(11:41)), 1);
WIfit = polyval(WIff, Voutw);

SIff = polyfit(Vouts(11:41),(Iouts(11:41)), 1);
SIfit = polyval(SIff, Vouts);

figure()
plot(Voutw, Ioutw, 'r.',...
     Vouts, Iouts, 'b.',...
     Voutw, WIfit, 'r',...
     Vouts, SIfit, 'b');
% ylim([1.5 5]);
title("$I_{out}$ vs $V_{out}$ with $M_b$ in WI($V_b = 0.7V$) and SI($V_b = 1.5V$)", 'Interpreter', 'Latex');
xlabel("$V_{out}$ (V)", 'Interpreter', 'Latex');
ylabel("$I_{out}$ (A)", 'Interpreter', 'Latex');
fitwText = sprintf('Fit for WI, $R_{out}$ = $%.3f$ $M\\Omega$', (-1/WIff(1))/1000000);
fitsText = sprintf('Fit for SI, $R_{out}$ = $%.3f$ $M\\Omega$', (-1/SIff(1))/1000000);
legend('$M_b$ in WI','$M_b$ in SI',fitwText,fitsText, 'Interpreter', 'Latex');

WIff
SIff

