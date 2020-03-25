raw_data = LTspice2Matlab("./ltspice/lab5e1.raw");

var = raw_data.variable_mat;

var(1,:,:);