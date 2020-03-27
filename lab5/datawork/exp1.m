close all
clearvars

raw_data = LTspice2Matlab("./ltspice/lab5e1.raw");

var = raw_data.variable_mat;

Ip = var(12,:);
In = var(13,:);
Vin = var(2,:);
Vdd = var(6,:);

[Is_n, V_T0_n, kn] = ekvfit(Vin, In, 0.0001);
[Is_p, V_T0_p, kp] = ekvfit(Vdd-Vin, Ip, 0.0001);

% For plot purposes
% [Is_n, V_T0_n, kn] = ekvfit(Vin, In, 0.0001, 'on');
% [Is_p, V_T0_p, kp] = ekvfit(Vdd-Vin, Ip, 0.0001, 'on');

% Calculate g_m = del(I_sat) / del(V_g)
gn = diff(In)./diff(Vin);
gp = diff(Ip)./diff(Vin);

% Extract U_T from exp2 data
raw_data = LTspice2Matlab("ltspice/lab5e2.raw");
var = raw_data.variable_mat;
nIsat = var(13,end-200:end-50);
Vs = var(3,end-200:end-50);
[~, ~, iUt, ~, ~] = linefit(Vs, log(nIsat), 0.001);
U_T = -1/iUt;

% proceed with fits for g_m
fgnw = kn*In(2:end)./U_T;
fgns = kn*sqrt(Is_n*In(2:end))/U_T;

fgpw = kp*Ip(2:end)./U_T;
fgps = kp*sqrt(Is_p*Ip(2:end))/U_T;

figure(1)
loglog(In(2:end), gn, 'r.', ...
       In(2:end), fgnw, 'r', In(2:end), fgns, 'y')
xlabel('I for nMOS (A)')
ylabel('g_m (1/\Omega)')
xlim([0.5e-11,1e-3])
ylim([1e-12, 3*1e-4])
legend('From data', 'WI model', 'SI model')
title('g_m vs. I for an nMOS transistor')

figure(2)
loglog(Ip(2:end), -gp, 'b.', ...
       Ip(2:end), fgpw, 'b', Ip(2:end), fgps, 'c')
xlabel('I for pMOS (A)')
ylabel('g_m (1/\Omega)')
xlim([0.5e-13, 2*1e-4])
ylim([1e-13, 1e-4])
legend('From data', 'WI model', 'SI model')
title('g_m vs. I for a pMOS transistor')