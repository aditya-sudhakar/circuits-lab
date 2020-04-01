close all
clearvars
addpath(genpath("../../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/lab5e1.raw");

var = raw_data.variable_mat;