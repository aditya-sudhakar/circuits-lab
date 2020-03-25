raw_data = LTspice2Matlab("./ltspice/lab5e1.raw");

var = raw_data.variable_mat;

Ip = var(12,:);
In = var(13,:);
Vin = var(2,:);

semilogy(Vin, Ip, Vin, In)
