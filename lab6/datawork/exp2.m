close all
clearvars
addpath(genpath("../../GlobalFunctions/"));

Iohmic = load("./lab6/exp2/Iohmic.txt");
Iohmic_par = load("./lab6/exp2/Iohmic_par.txt");
Iohmic_ser = load("./lab6/exp2/Iohmic_ser.txt");
Isat = load("./lab6/exp2/Isat.txt");
Isat_par = load("./lab6/exp2/Isat_par.txt");
Isat_ser = load("./lab6/exp2/Isat_ser.txt");
Vd_ohmic = load("./lab6/exp2/Vd_ohmic.txt");
Vd_sat = load("./lab6/exp2/Vd_sat.txt");
Vg = load("./lab6/exp2/Vg.txt");


figure()
semilogy(Vg, Iohmic, 'r',...
    Vg, Iohmic_par, 'g',...
    Vg, Iohmic_ser, 'b');
title("Channel Current for $V_{DS}=10mV$", "Interpreter", "Latex");
xlabel("Gate Voltage (V)", "Interpreter", "Latex");
ylabel("Channel Current(A)", "Interpreter", "Latex");
legend("Single nMOS", "Parallel Connection", "Series Connection", "Interpreter", "Latex");


figure()
semilogy(Vg, Isat, 'r',...
    Vg, Isat_par, 'g',...
    Vg, Isat_ser, 'b');
title("Channel Current for $V_{DS}=V_{dd}$", "Interpreter", "Latex");
xlabel("Gate Voltage (V)", "Interpreter", "Latex");
ylabel("Channel Current(A)", "Interpreter", "Latex");
legend("Single nMOS", "Parallel Connection", "Series Connection", "Interpreter", "Latex");

figure()
plot (Vg, Iohmic_par./Iohmic,...
    Vg, Isat_par./Isat);
title("Ratio between Parllel and Single", "Interpreter", "Latex");
xlabel("Gate Voltage (V)", "Interpreter", "Latex");
ylabel("Parallel:Single (unitless)", "Interpreter", "Latex");
legend("Ratio in Ohmic Region", "Ratio in Saturation Region", "Interpreter", "Latex");

figure()
plot (Vg, Iohmic./Iohmic_ser,...
    Vg, Isat./Isat_ser);
title("Ratio between Single and Serial", "Interpreter", "Latex");
xlabel("Gate Voltage (V)", "Interpreter", "Latex");
ylabel("Single:Serial (unitless)", "Interpreter", "Latex");
legend("Ratio in Ohmic Region", "Ratio in Saturation Region", "Interpreter", "Latex");