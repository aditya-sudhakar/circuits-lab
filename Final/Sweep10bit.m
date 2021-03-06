close all
clearvars
addpath(genpath("../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/10bit.raw");
vnml=raw_data.variable_name_list
data = raw_data.variable_mat;
% [status , pid] =system("sh -c 'echo -n $$; exec bash ltspiceStart'");
% pause(2);

%Doesnt work - Pushing anyways
% pid
% system("wineserver -k");

Vg = data(2,:);
Iin = data(94,:);
I1 = data(93,:);
I2 = data(86,:);
I3 = data(85,:);
I4 = data(82,:);
I5 = data(79,:);
I6 = data(76,:);
I7 = data(73,:);
I8 = data(70,:);
I9 = data(67,:);
I10 = data(64,:);
Iout= data(96,:);



plot(Vg, Iin, 'r.', ...
    Vg, I1, '.', ...
    Vg, I2, '.', ...
    Vg, I3, '.', ...
    Vg, I4, '.', ...
    Vg, I5, '.', ...
    Vg, I6, '.', ...
    Vg, I7, '.', ...
    Vg, I8, '.', ...
    Vg, I9, '.', ...
    Vg, I10, '.', ...
    Vg, Iout, 'b.');
title("Current Increments for 10 bit MOS-Only DAC", 'Interpreter', 'Latex');
xlabel("$V_g$ (V)", 'Interpreter', 'Latex');
ylabel("Current (A)", 'Interpreter', 'Latex');
legend('$I_{in}$',...
    '$I_{out}$ after $1^{st}$ bit',...
    '$I_{out}$ after $2^{nd}$ bit',...
    '$I_{out}$ after $3^{rd}$ bit',...
    '$I_{out}$ after $4^{th}$ bit',...
    '$I_{out}$ after $5^{th}$ bit',...
    '$I_{out}$ after $6^{th}$ bit',...
    '$I_{out}$ after $7^{th}$ bit',...
    '$I_{out}$ after $8^{th}$ bit',...
    '$I_{out}$ after $9^{th}$ bit',...
    '$I_{out}$ after $10^{th}$ bit',...
    '$I_{out}$', 'Interpreter', 'Latex');