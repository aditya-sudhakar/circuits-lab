
clearvars
addpath("../../GlobalFunctions");
raw_datan = LTspice2Matlab("./ltspice/lab5e2.raw");

var = raw_datan.variable_mat;

raw_datan.variable_name_list

Isn = (-1.*var(19,:,1));
Isp = (var(21,:,1));

Is = 1.848.^-7;

Isn2 = log(var(19,:,1));
Isp2 = log(var(21,:,1));

Vs = var(3,:,1);

[Is_n, V_T0_n, kn] = ekvfit(Vs, Isn, 0.0001);

gsWI = Isp./0.025;

gsSI = (((2.7200e-08).*Isn).^(0.5))./(0.025);

Isnff = polyfit(Vs(95:118),(Isn2(95:118)), 1);
Isnfit = polyval(Isnff, Vs);

Ispff = polyfit(Vs(10:135),(Isp2(10:135)), 1);
Ispfit = polyval(Ispff, Vs(10:135));

gsn = diff(Isn)./diff(Vs);
gsnl = log(gsn);

figure()
loglog(Isn(1:500),gsn,'r.',...
       Isn(1:500),gsWI(1:500),'b',...
       Isn(1:500),gsSI(1:500),'c');

legend("Data: ALD1106 nMOS", "Fit: WI Model", "Fit: SI Model")
     
ylim([10e-10 10e-4]);
     
ylabel('g_{s} (1/\Omega)')
xlabel('I_{sat} (A)')
title("g_{s} vs. I_{sat}for nMOS Transistor ALD1106")

Is_n
V_T0_n
kn