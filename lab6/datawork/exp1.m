close all
clearvars
addpath(genpath("../../GlobalFunctions/"));

Isat1 = load("./lab6/exp1/Isat1.txt");
Isat2 = load("./lab6/exp1/Isat2.txt");
Isat3 = load("./lab6/exp1/Isat3.txt");
Isat4 = load("./lab6/exp1/Isat4.txt");
Vd = load("./lab6/exp1/Vd.txt");
Vg = load("./lab6/exp1/Vg.txt");

% raw_data = LTspice2Matlab("./ltspice/lab5e1.raw");

% var = raw_data.variable_mat;