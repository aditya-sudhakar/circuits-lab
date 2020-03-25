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
% [Is_n, V_T0_n, k_n] = ekvfit(Vin, In, 0.0001, 'on');
% [Is_p, V_T0_p, k_p] = ekvfit(Vdd-Vin, Ip, 0.0001, 'on');

% Calculate g_m = del(I_sat) / del(V_g)
gn = diff(In)./diff(Vin);
gp = diff(Ip)./diff(Vin);

fgnw = kn*In(2:end)./U_T;
fgns = kn*sqrt(Is_n*In(2:end))/U_T;

fgpw = kn*Ip(2:end)./U_T;
fgps = kn*sqrt(Is_n*Ip(2:end))/U_T;

loglog(In(2:end), gn, 'r.', Ip(2:end), gp, 'b.', ...
       In(2:end), fgnw, 'r', In(2:end), fgns, 'y', ...
       Ip(2:end), fgpw, 'b', Ip(2:end), fgps, 'c')