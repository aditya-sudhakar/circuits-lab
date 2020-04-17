close all
clearvars
addpath(genpath("../../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/exp3.raw");
raw_data.variable_name_list
var = raw_data.variable_mat;


Vin = var(2,:);
Vout = var(5,:);

VTCff = polyfit(Vin(50:450),Vout(50:450),1);
VTCfit = polyval(VTCff, Vin);

figure()
plot(Vin, Vout, 'r.', ...
    Vin, VTCfit, 'r');
VTCtitle = sprintf('Voltage Transfer Characteristic with Intrinsic Gain of = $%.8f UNITLESS$???', VTCff(1));
title(VTCtitle ,'Interpreter', 'Latex');
xlabel('$V_{in}$','Interpreter', 'Latex');
ylabel('$V_{out}$','Interpreter', 'Latex');
legend('VTC Data', 'VTC Fit','Interpreter', 'Latex');

figure()
plot(Vin, Vout - Vin, 'b.');
title('Offset Voltage','Interpreter', 'Latex');
xlabel('$V_{in}$','Interpreter', 'Latex');
ylabel('$V_{out} - V_{in}$','Interpreter', 'Latex');
legend('Offset Voltage','Interpreter', 'Latex');