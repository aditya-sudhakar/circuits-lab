close all
clearvars
addpath("../../GlobalFunctions");
raw_datan = LTspice2Matlab("./ltspice/lab5e3n.raw");

data =raw_datan.variable_mat;
raw_datan.variable_name_list
figure();
Vin = data(9,:,1);

Id6n = data(14,:,1);
Id7n = data(14,:,2);
Id5n = data(14,:,3);


[~, ~, , ~, ~] = linefit(Vs, log(nIsat), 0.001);


figure();
Vin = data(9,:,1);

Id6n = data(14,:,1);
Id7n = data(14,:,2);
Id5n = data(14,:,3);

semilogy(Vin, Id6n, 'r',...
    Vin, Id7n, 'g',...
    Vin, Id5n, 'b');
title("nMOS Drain Characteristics", "Interpreter", "Latex");


figure(2);
raw_data = LTspice2Matlab("./ltspice/lab5e3p.raw");

data = raw_data.variable_mat;

raw_data.variable_name_list

Vin = data(9,:,1);

Id8p = data(13,:,1);
Id7p = data(13,:,2);
Id0p = data(13,:,3);

semilogy(Vin, Id8p, 'r',...
    Vin, Id7p, 'g',...
    Vin, Id0p, 'b');



