close all
clearvars
addpath(genpath("../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/3bit.raw");
vnml=raw_data.variable_name_list
data = raw_data.variable_mat;
% [status , pid] =system("sh -c 'echo -n $$; exec bash ltspiceStart'");
% pause(2);

%Doesnt work - Pushing anyways
% pid
% system("wineserver -k");

Vg = data(2,:);
Iin = data(38,:);
Iout= data(40,:);
Iout_ = data(39,:);

I1 = data(37,:);
I1_ = data(36,:);

I2 = data(32,:);
I2_ = data(31,:);

I3 = data(29,:);
I3_ = data(28,:);



plot(Vg, Iin, 'r.', ...
     Vg, Iout, 'b.', ...
     Vg, Iout_, 'g.');
title("MOS-Only Current Divider", 'Interpreter', 'Latex');
xlabel("$V_g$ (V)", 'Interpreter', 'Latex');
ylabel("$Current$ (A)", 'Interpreter', 'Latex');
legend('$I_in$',...
       '$1_{out}$',...
       '$\neg I_{out}$', 'Interpreter', 'Latex');
  
figure();
plot(Vg, Iin./Iin, 'r.', ...
     Vg, Iout./Iin, 'b.', ...
     Vg, Iout_./Iin, 'g.', ...
     Vg, Vg*0 + 6/8, 'b',...
     Vg, Vg*0 + 2/8, 'g');
title("MOS-Only Current Divider Ratios for 101", 'Interpreter', 'Latex');
xlabel("$V_g$ (V)", 'Interpreter', 'Latex');
ylabel("Current (A)", 'Interpreter', 'Latex');
legend('$I_{in} / I_{in}$',...
       '$I_{out} / I_{in}$',...
       '$\overline I_{out} / I_{in}$', ...
       'Expected $I_{out}$: $6/8$', ...
       'Expected $\overline I_{out}$: $2/8$','Interpreter', 'Latex');