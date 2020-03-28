close all
clearvars
addpath(genpath("../../GlobalFunctions"));
raw_datan = LTspice2Matlab("./ltspice/lab5e3n.raw");

data =raw_datan.variable_mat;
raw_datan.variable_name_list;
figure();
Vin = data(9,:,1);

Id6n = data(14,:,1);
Id7n = data(14,:,2);
Id5n = data(14,:,3);


[~, ~, r0inv6n, Isat6n, ~] = linefit(Vin(101:end), log(Id6n(101:end)), 0.001);
r06n = 1/r0inv6n;

semilogy(Vin(101:end), Id6n(101:end), 'r',...
    Vin(101:end), Id7n(101:end), 'g',...
    Vin(101:end), Id5n(101:end), 'b');
title("nMOS Drain Characteristics", "Interpreter", "Latex");
legend("6","7","5");

figure(2);
raw_data = LTspice2Matlab("./ltspice/lab5e3p.raw");

data = raw_data.variable_mat;

raw_data.variable_name_list;

Vin = data(9,:,1);

Id8p = data(13,:,1);
Id7p = data(13,:,2);
Id0p = data(13,:,3);

semilogy(Vin, Id8p, 'r',...
    Vin, Id7p, 'g',...
    Vin, Id0p, 'b');



