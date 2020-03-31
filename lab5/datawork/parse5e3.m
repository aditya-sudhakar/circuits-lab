close all
clearvars
addpath(genpath("../../GlobalFunctions"));
raw_datan = LTspice2Matlab("./ltspice/lab5e3n.raw");

data =raw_datan.variable_mat;
raw_datan.variable_name_list;
Vin = data(9,:,1);

IdWn = data(14,:,1);
IdMn = data(14,:,2);
IdSn = data(14,:,3);

[~, ~, gsWn, yintWn, ~] = linefit(Vin(1:500), log(IdWn(1:500)), 0.001);
IdWOhmnfit = polyval([gsWn, yintWn], Vin);
IdWSatnff = polyfit(Vin(10001:end),log(IdWn(10001:end)), 1);
IdWSatnfit = polyval(IdWSatnff, Vin);
r0Wn = 1/IdWSatnff(1);
IsatWn = exp(IdWSatnff(2));
gsr0Wn = gsWn*r0Wn;

[~, ~, gsMn, yintMn, ~] = linefit(Vin(1:500), log(IdMn(1:500)), 0.001);
IdMOhmnfit = polyval([gsMn, yintMn], Vin);
IdMSatnff = polyfit(Vin(10001:end),log(IdMn(10001:end)), 1);
IdMSatnfit = polyval(IdMSatnff, Vin);
r0Mn = 1/IdMSatnff(1);
IsatMn = exp(IdMSatnff(2));
gsr0Mn = gsMn*r0Mn;

[~, ~, gsSn, yintSn, ~] = linefit(Vin(1:500), log(IdSn(1:500)), 0.001);
IdSOhmnfit = polyval([gsSn, yintSn], Vin);
IdSSATnff = polyfit(Vin(20001:end),log(IdSn(20001:end)), 1);
IdSSatnfit = polyval(IdSSATnff, Vin);
r0Sn = 1/IdSSATnff(1);
IsatSn = exp(IdSSATnff(2));
gsr0Sn = gsSn*r0Sn;

figure()
semilogy(Vin, IdWn,'r.', ...
    Vin, exp(IdWOhmnfit), 'r--',...
    Vin, exp(IdWSatnfit),'r-.',...
    Vin, IdMn, 'b.',...
    Vin, exp(IdMOhmnfit), 'b--',...
    Vin, exp(IdMSatnfit),'b-.',...
    Vin, IdSn, 'g.',...
    Vin, exp(IdSOhmnfit), 'g--',...
    Vin, exp(IdSSatnfit),'g-.');
title("nMOS Drain Characteristics", "Interpreter", "Latex");
legend("$V_{G}$ = Weak $0.6 V$","Weak Ohmic Fit", "Weak Saturation Fit",...
    "$V_{G}$ = Moderate $0.7V$","Moderate Ohmic Fit", "Moderate Saturation Fit",...
    "$V_{G}$ = Strong $5V (Vdd)$","Strong Ohmic Fit", "Strong Saturation Fit","Interpreter", "Latex");
xlabel("Drain Voltage (V)","Interpreter", "Latex");
ylabel("Channel Current (A)","Interpreter", "Latex");
ylim([1e-10 1e-3]);

figure()
semilogy(Vin, IdWn,'r.', ...
    Vin, exp(IdWOhmnfit), 'r--',...
    Vin, exp(IdWSatnfit),'r-.',...
    Vin, IdMn, 'b.',...
    Vin, exp(IdMOhmnfit), 'b--',...
    Vin, exp(IdMSatnfit),'b-.',...
    Vin, IdSn, 'g.',...
    Vin, exp(IdSOhmnfit), 'g--',...
    Vin, exp(IdSSatnfit),'g-.');
title("nMOS Drain Characteristics Zoomed In", "Interpreter", "Latex");
legend("$V_{G}$ = Weak $0.6 V$","Weak Ohmic Fit", "Weak Saturation Fit",...
    "$V_{G}$ = Moderate $0.7V$","Moderate Ohmic Fit", "Moderate Saturation Fit",...
    "$V_{G}$ = Strong $5V (Vdd)$","Strong Ohmic Fit", "Strong Saturation Fit","Interpreter", "Latex");
xlabel("Drain Voltage (V)","Interpreter", "Latex");
ylabel("Channel Current (A)","Interpreter", "Latex");
ylim([1e-10 1e-3]);
xlim([0 .1]);


raw_datan = LTspice2Matlab("./ltspice/lab5e3p.raw");

data =raw_datan.variable_mat;
raw_datan.variable_name_list;

Vin = data(9,:,1);

IdWp = data(13,:,1);
IdMp = data(13,:,2);
IdSp = data(13,:,3);

[~, ~, gsWp, yintWp, ~] = linefit(Vin(3000:4000), log(IdWp(3000:4000)), 0.001);
IdWOhmpfit = polyval([gsWp, yintWp], Vin);
IdWSatpff = polyfit(Vin(30001:end),log(IdWp(30001:end)), 1);
IdWSatpfit = polyval(IdWSatpff, Vin);
r0Wp = 1/IdWSatpff(1);
IsatWp = exp(IdWSatpff(2));
gsr0Wp = gsWp*r0Wp;

[~, ~, gsMp, yintMp, ~] = linefit(Vin(3500:5000), log(IdMp(3500:5000)), 0.001);
IdMOhmpfit = polyval([gsMp, yintMp], Vin);
IdMSatpff = polyfit(Vin(30001:end),log(IdMp(30001:end)), 1);
IdMSatpfit = polyval(IdMSatpff, Vin);
r0Mp = 1/IdMSatpff(1);
IsatMp = exp(IdMSatpff(2));
gsr0Mp = gsMp*r0Mp;

[~, ~, gsSp, yintSp, ~] = linefit(Vin(10000:12000), log(IdSp(10000:12000)), 0.001);
IdSOhmpfit = polyval([gsSp, yintSp], Vin);
IdSSATpff = polyfit(Vin(30001:end),log(IdSp(30001:end)), 1);
IdSSatpfit = polyval(IdSSATpff, Vin);
r0Sp = 1/IdSSATpff(1);
IsatSp = exp(IdSSATpff(2));
gsr0Sp = gsSp*r0Sp;

figure()
semilogy(Vin, IdWp,'r.', ...
    Vin, exp(IdWOhmpfit), 'r--',...
    Vin, exp(IdWSatpfit),'r-.',...
    Vin, IdMp, 'b.',...
    Vin, exp(IdMOhmpfit), 'b--',...
    Vin, exp(IdMSatpfit),'b-.',...
    Vin, IdSp, 'g.',...
    Vin, exp(IdSOhmpfit), 'g--',...
    Vin, exp(IdSSatpfit),'g-.');

title("pMOS Drain Characteristics", "Interpreter", "Latex");
legend("$V_{G}$ = Weak $4.2V$","Weak Ohmic Fit", "Weak Saturation Fit",...
    "$V_{G}$ = Moderate $4.3V$","Moderate Ohmic Fit", "Moderate Saturation Fit",...
    "$V_{G}$ = Strong $0V$","Strong Ohmic Fit", "Strong Saturation Fit","Interpreter", "Latex");
xlabel("Drain Voltage (V)","Interpreter", "Latex");
ylabel("Channel Current (A)","Interpreter", "Latex");
ylim([10e-14 1e-3]);

Isat = [IsatWn, IsatMn, IsatSn, IsatWp, IsatMp, IsatSp];
Ve = [r0Wn*IsatWn, r0Mn*IsatMn, r0Sn*IsatSn, r0Wp*IsatWp, r0Mp*IsatMp, r0Sp*IsatSp]; 
figure()
loglog(IsatWn, r0Wn*IsatWn, 'rs', ...
    IsatMn, r0Mn*IsatMn, 'bs', ...
    IsatSn, r0Sn*IsatSn, 'gs', ...
    IsatWp, r0Wp*IsatWp, 'r*', ...
    IsatMp, r0Mp*IsatMp, 'b*', ...
    IsatSp, r0Sp*IsatSp, 'g*');
xlabel("Satuation Current (A)","Interpreter", "Latex");
ylabel("Early Voltage (V)","Interpreter", "Latex");
title("Early Voltage as a function of Saturation Current","Interpreter", "Latex");
legend("nMOS Weak","nMOS Moderate","nMOS Strong", ...
    "pMOS Weak","pMOS Moderate","pMOS Strong","Interpreter", "Latex");

figure()
gsr0 = [gsWn, gsMn, gsSn, gsWp, gsMp, gsSp];
loglog(IsatWn, gsWn, 'rs', ...
    IsatMn, gsMn, 'bs', ...
    IsatSn, gsSn, 'gs', ...
    IsatWp, gsWp, 'r*', ...
    IsatMp, gsMp, 'b*', ...
    IsatSp, gsMp, 'g*');
xlabel("Satuation Current (A)","Interpreter", "Latex");
ylabel("Intrinsic Gain $(g_{s}r_{o})(dimless)$","Interpreter", "Latex");
title("Intrinsic Gain $(g_{s}r_{o})$ as a function of Saturation Current","Interpreter", "Latex");
legend("nMOS Weak","nMOS Moderate","nMOS Strong", ...
    "pMOS Weak","pMOS Moderate","pMOS Strong","Interpreter", "Latex");
ylim([30 250]);
