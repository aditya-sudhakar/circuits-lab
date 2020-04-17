close all
clearvars
addpath(genpath("../../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/exp3.raw");
vnml=raw_data.variable_name_list;
var = raw_data.variable_mat;

Vin = var(2,:);
Vout = var(5,:);

ff = polyfit(Vin(100:200), Vout(100:200),1)
Vfit = polyval(ff, Vin);

figure(1)
plot(Vin, Vout,'r.',Vin, Vfit,'r')
legend('Data','Fit')
ylabel("$V_{out}$", 'Interpreter', 'Latex')
xlabel("$V_{in}$", 'Interpreter', 'Latex')
ylim([0 5])
title("VTC of the unity-gain follower", 'Interpreter', 'Latex')

figure(2)
plot(Vin, Vout-Vin, 'r.')
ylabel("$V_{out}-V_{in}$", 'Interpreter', 'Latex')
xlabel("$V_{in}$", 'Interpreter', 'Latex')
ylim([-0.05 0.05])
title("Comparison of $V_{in}$ vs. $V_{out}-V_{in}$ for the unity-gain follower", 'Interpreter', 'Latex')
% 
% V1 = var(2,:,1);
% 
% V2_4 = var(9,:,1);
% I1_4_w = var(20,:,1);
% I2_4_w = var(19,:,1); 
% V_4_w = var(3,:,1);
% 
% V2_43 = var(9,:,2);
% I1_43_w = var(20,:,2);
% I2_43_w = var(19,:,2); 
% V_43_w = var(3,:,2);
% 
% V2_45 = var(9,:,3);
% I1_45_w = var(20,:,3);
% I2_45_w = var(19,:,3); 
% V_45_w = var(3,:,3);
% 
% 
% figure()
% plot(V1-V2_4, I1_4_w, 'r.', ... 
%     V1-V2_4, I2_4_w, 'r*', ...
%     V1-V2_4, I1_4_w - I2_4_w, 'rp', ...
%     V1-V2_4, I1_4_w + I2_4_w, 'r^', ...
%     V1-V2_43, I1_43_w, 'g.', ... 
%     V1-V2_43, I2_43_w, 'g*', ...
%     V1-V2_43, I1_43_w - I2_43_w, 'gp', ...
%     V1-V2_43, I1_43_w + I2_43_w, 'g^', ...
%     V1-V2_45, I1_45_w, 'b.', ... 
%     V1-V2_45, I2_45_w, 'b*', ...
%     V1-V2_45, I1_45_w - I2_45_w, 'bp', ...
%     V1-V2_45, I1_45_w + I2_45_w, 'b^');
% xlim([-.15 .15]);
% title("Combinations of Current in Weak Inversion", 'Interpreter', 'Latex');
% xlabel("$V_{dm}$ (V)", 'Interpreter', 'Latex');
% ylabel("Current (A)", 'Interpreter', 'Latex');
% legend('$I_1$, $V_2$ at $4V$', '$I_2$, $V_2$ at $4V$', '$I_1-I_2$, $V_2$ at $4V$', '$I_1+I_2$, $V_2$ at $4V$', ...
%     '$I_1$, $V_2$ at $4.3V$', '$I_2$, $V_2$ at $4.3V$', '$I_1-I_2$, $V_2$ at $4.3V$', '$I_1+I_2$, $V_2$ at $4.3V$', ...
%     '$I_1$, $V_2$ at $4.5V$', '$I_2$, $V_2$ at $4.5V$', '$I_1-I_2$, $V_2$ at $4.5V$', '$I_1+I_2$, $V_2$ at $4.5V$', 'Interpreter', 'Latex');
% 
% figure()
% plot(V1-V2_4, V_4_w, 'r.', ... 
%     V1-V2_43, V_43_w, 'g.', ... 
%     V1-V2_45, V_45_w, 'b.');
% xlim([-.5 .5]);
% title("Common-source node Voltage as a function of $V_{dm}$", 'Interpreter', 'Latex');
% xlabel("$V_{dm}$ (V)", 'Interpreter', 'Latex');
% ylabel("Common-source Voltage (V)", 'Interpreter', 'Latex');
% legend('At $4V$', 'At $4.3V$', 'At $4.5V$', 'Interpreter', 'Latex');

% gdm_4ff_w = polyfit( V1(399:403)-V2_4(399:403), I1_4_w(399:403) - I2_4_w(399:403),1);
% gdm_4_w = gdm_4ff_w(1)
% 
% gdm_43ff_w = polyfit( V1(429:433)-V2_43(429:433), I1_43_w(429:433) - I2_43_w(429:433),1);
% gdm_43_w = gdm_43ff_w(1)
% 
% gdm_45ff_w = polyfit( V1(449:453)-V2_45(449:453), I1_45_w(449:453) - I2_45_w(449:453),1);
% gdm_45_w = gdm_45ff_w(1)