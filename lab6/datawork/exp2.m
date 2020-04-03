close all
clearvars
addpath(genpath("../../GlobalFunctions/"));
load("lab6/exp2");
% 
% Iohmic = load("./lab6/exp2/Iohmic.txt");
% Iohmicpar = load("./lab6/exp2/Iohmic_par.txt");
% Iohmicser = load("./lab6/exp2/Iohmic_ser.txt");
% Isat = load("./lab6/exp2/Isat.txt");
% Isatpar = load("./lab6/exp2/Isat_par.txt");
% Isatser = load("./lab6/exp2/Isat_ser.txt");
% Vdohmic = load("./lab6/exp2/Vd_ohmic.txt");
% Vdsat = load("./lab6/exp2/Vd_sat.txt");
% Vg = load("./lab6/exp2/Vg.txt");


figure()
semilogy(Vg, Iohmic, 'r',...
    Vg, Iohmicpar, 'g',...
    Vg, Iohmicser, 'b');
title("Channel Current for $V_{DS}=10mV$", "Interpreter", "Latex");
xlabel("Gate Voltage (V)", "Interpreter", "Latex");
ylabel("Channel Current(A)", "Interpreter", "Latex");
legend("Single nMOS", "Parallel Connection", "Series Connection", "Interpreter", "Latex");
xlim([0 5.5])

figure()
semilogy(Vg, Isat, 'r',...
    Vg, Isatpar, 'g',...
    Vg, Isatser, 'b');
title("Channel Current for $V_{DS}=V_{dd}$", "Interpreter", "Latex");
xlabel("Gate Voltage (V)", "Interpreter", "Latex");
ylabel("Channel Current(A)", "Interpreter", "Latex");
legend("Single nMOS", "Parallel Connection", "Series Connection", "Interpreter", "Latex");
xlim([0 5.5])
ylim([1e-11 1e-2])

figure()
plot (Vg, Iohmicpar./Iohmic,...
    Vg, Isatpar./Isat);
title("Ratio between Parllel and Single", "Interpreter", "Latex");
xlabel("Gate Voltage (V)", "Interpreter", "Latex");
ylabel("Parallel:Single (unitless)", "Interpreter", "Latex");
legend("Ratio in Ohmic Region", "Ratio in Saturation Region", "Interpreter", "Latex");

figure()
plot (Vg, Iohmic./Iohmicser,...
    Vg, Isat./Isatser);
title("Ratio between Single and Serial", "Interpreter", "Latex");
xlabel("Gate Voltage (V)", "Interpreter", "Latex");
ylabel("Single:Serial (unitless)", "Interpreter", "Latex");
legend("Ratio in Ohmic Region", "Ratio in Saturation Region", "Interpreter", "Latex");