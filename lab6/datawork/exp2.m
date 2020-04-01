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