close all
clearvars
addpath(genpath("../../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/exp2a.raw");
raw_data.variable_name_list;
var = raw_data.variable_mat;


V1w = var(2,:,1);
V2w = var(5,:,1);

Vdmw = V1w-V2w;

V1s = var(2,:,2);
V2s = var(5,:,2);

Vdms = V1s-V2s;

Voutw = var(18,:,1);

Vouts = var(18,:,2);

WIff = polyfit(Vdmw(91:104),(Voutw(91:104)), 1);
WIfit = polyval(WIff, Vdmw);

SIff = polyfit(Vdms(87:109),(Vouts(87:109)), 1);
SIfit = polyval(SIff, Vdms);

figure()
plot(Vdmw, Voutw, 'r.',...
     Vdms, Vouts, 'b.',...
     Vdmw, WIfit, 'r',...
     Vdms, SIfit, 'b');
ylim([1.5 5]);
title("$V_{out}$ vs $V_{dm}$ with $M_b$ in WI($V_b = 0.7V$) and SI($V_b = 1.5V$)", 'Interpreter', 'Latex');
xlabel("$V_{dm}$ (V)", 'Interpreter', 'Latex');
ylabel("$V_{out}$ (V)", 'Interpreter', 'Latex');
legend('$M_b$ in WI','$M_b$ in SI','Fit for WI','Fit for SI', 'Interpreter', 'Latex');

WIff
SIff

