
clearvars
addpath("../../GlobalFunctions");
raw_datan = LTspice2Matlab("./ltspice/lab5e2.raw");

var = raw_datan.variable_mat;

raw_datan.variable_name_list

Isn = (-1.*var(19,:,1));
Isp = (var(21,:,1));
Vdd = var(6,:);

Isn2 = log(-1.*var(19,:,1));
Isp2 = log(var(21,:,1));

Vs = var(3,:,1);


gsp = diff(Isp)./diff(Vs);
gspl = log(gsp);

gsWI = Isp./0.025;

gsSI = (((2.957*10^-8).*Isp).^(0.5))./(0.025);

SInff = polyfit(Isp2(101:116),(gspl(101:116)), 1);
SInfit = polyval(SInff, Isp2(101:116));

WIpff = polyfit(Vs(95:118),(Isp2(95:118)), 1);
WIpfit = polyval(WIpff, Vs);


figure()
loglog(Isp(1:500),gsp,'r.',...
       Isp(1:500),gsWI(1:500),'b',...
       Isp(1:500),gsSI(1:500),'c');

legend("Data: ALD1107 pMOS", "Fit: WI Model", "Fit: SI Model")
     
ylim([10e-10 10e-4]);
xlim([10e-12 10e-5]);
     
xlabel('I_{sat} (A)')
ylabel('g_{s} (1/\Omega)')
title("g_{s} vs I_{sat} for pMOS Transistor ALD1107")
