close all
clearvars
addpath(genpath("../../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/nexp.raw");
raw_data.variable_name_list;
var = raw_data.variable_mat;

V1 = var(2,:,1);

V2_4 = var(9,:,1);
I1_4_w = var(20,:,1);
I2_4_w = var(19,:,1); 
V_4_w = var(3,:,1);

V2_43 = var(9,:,2);
I1_43_w = var(20,:,2);
I2_43_w = var(19,:,2); 
V_43_w = var(3,:,2);

V2_45 = var(9,:,3);
I1_45_w = var(20,:,3);
I2_45_w = var(19,:,3); 
V_45_w = var(3,:,3);


figure()
plot(V1-V2_4, I1_4_w, 'r.', ... 
    V1-V2_4, I2_4_w, 'r*', ...
    V1-V2_4, I1_4_w - I2_4_w, 'rp', ...
    V1-V2_4, I1_4_w + I2_4_w, 'r^', ...
    V1-V2_43, I1_43_w, 'g.', ... 
    V1-V2_43, I2_43_w, 'g*', ...
    V1-V2_43, I1_43_w - I2_43_w, 'gp', ...
    V1-V2_43, I1_43_w + I2_43_w, 'g^', ...
    V1-V2_45, I1_45_w, 'b.', ... 
    V1-V2_45, I2_45_w, 'b*', ...
    V1-V2_45, I1_45_w - I2_45_w, 'bp', ...
    V1-V2_45, I1_45_w + I2_45_w, 'b^');
xlim([-.15 .15]);
title("Combinations of Current in Weak Inversion", 'Interpreter', 'Latex');
xlabel("$V_{dm}$ (V)", 'Interpreter', 'Latex');
ylabel("Current (A)", 'Interpreter', 'Latex');
legend('$I_1$, $V_2$ at $4V$', '$I_2$, $V_2$ at $4V$', '$I_1-I_2$, $V_2$ at $4V$', '$I_1+I_2$, $V_2$ at $4V$', ...
    '$I_1$, $V_2$ at $4.3V$', '$I_2$, $V_2$ at $4.3V$', '$I_1-I_2$, $V_2$ at $4.3V$', '$I_1+I_2$, $V_2$ at $4.3V$', ...
    '$I_1$, $V_2$ at $4.5V$', '$I_2$, $V_2$ at $4.5V$', '$I_1-I_2$, $V_2$ at $4.5V$', '$I_1+I_2$, $V_2$ at $4.5V$', 'Interpreter', 'Latex');

figure()
plot(V1-V2_4, V_4_w, 'r.', ... 
    V1-V2_43, V_43_w, 'g.', ... 
    V1-V2_45, V_45_w, 'b.');
xlim([-.5 .5]);
title("Common-source node Voltage as a function of $V_{dm}$", 'Interpreter', 'Latex');
xlabel("$V_{dm}$ (V)", 'Interpreter', 'Latex');
ylabel("Common-source Voltage (V)", 'Interpreter', 'Latex');
legend('At $4V$', 'At $4.3V$', 'At $4.5V$', 'Interpreter', 'Latex');

% gdm_4ff_w = polyfit( V1(399:403)-V2_4(399:403), I1_4_w(399:403) - I2_4_w(399:403),1);
% gdm_4_w = gdm_4ff_w(1)
% 
% gdm_43ff_w = polyfit( V1(429:433)-V2_43(429:433), I1_43_w(429:433) - I2_43_w(429:433),1);
% gdm_43_w = gdm_43ff_w(1)
% 
% gdm_45ff_w = polyfit( V1(449:453)-V2_45(449:453), I1_45_w(449:453) - I2_45_w(449:453),1);
% gdm_45_w = gdm_45ff_w(1)


I1_4_s = var(20,:,4);
I2_4_s = var(19,:,4); 
V_4_s = var(3,:,4);

I1_43_s = var(20,:,5);
I2_43_s = var(19,:,5); 
V_43_s = var(3,:,5);

I1_45_s = var(20,:,6);
I2_45_s = var(19,:,6); 
V_45_s = var(3,:,6);

figure()
plot(V1-V2_4, I1_4_s, 'r.', ... 
    V1-V2_4, I2_4_s, 'r*', ...
    V1-V2_4, I1_4_s - I2_4_s, 'rp', ...
    V1-V2_4, I1_4_s + I2_4_s, 'r^', ...
    V1-V2_43, I1_43_s, 'g.', ... 
    V1-V2_43, I2_43_s, 'g*', ...
    V1-V2_43, I1_43_s - I2_43_s, 'gp', ...
    V1-V2_43, I1_43_s + I2_43_s, 'g^', ...
    V1-V2_45, I1_45_s, 'b.', ... 
    V1-V2_45, I2_45_s, 'b*', ...
    V1-V2_45, I1_45_s - I2_45_s, 'bp', ...
    V1-V2_45, I1_45_s + I2_45_s, 'b^');
xlim([-1 1]);
title("Combinations of Current in Strong Inversion", 'Interpreter', 'Latex');
xlabel("$V_{dm}$ (V)", 'Interpreter', 'Latex');
ylabel("Current (A)", 'Interpreter', 'Latex');
legend('$I_1$, $V_2$ at $4V$', '$I_2$, $V_2$ at $4V$', '$I_1-I_2$, $V_2$ at $4V$', '$I_1+I_2$, $V_2$ at $4V$', ...
    '$I_1$, $V_2$ at $4.3V$', '$I_2$, $V_2$ at $4.3V$', '$I_1-I_2$, $V_2$ at $4.3V$', '$I_1+I_2$, $V_2$ at $4.3V$', ...
    '$I_1$, $V_2$ at $4.5V$', '$I_2$, $V_2$ at $4.5V$', '$I_1-I_2$, $V_2$ at $4.5V$', '$I_1+I_2$, $V_2$ at $4.5V$', 'Interpreter', 'Latex');

figure()
plot(V1-V2_4, V_4_s, 'r.', ... 
    V1-V2_43, V_43_s, 'g.', ... 
    V1-V2_45, V_45_s, 'b.');
   
xlim([-1.5 .5]);
title("Common-source node Voltage as a function of $V_{dm}$", 'Interpreter', 'Latex');
xlabel("$V_{dm}$ (V)", 'Interpreter', 'Latex');
ylabel("Common-source Voltage (V)", 'Interpreter', 'Latex');
legend('At $4V$', 'At $4.3V$', 'At $4.5V$', 'Interpreter', 'Latex');
% 
% gdm_4ff_s = polyfit( V1(381:421)-V2_4(381:421), I1_4_s(381:421) - I2_4_s(381:421),1);
% gdm_4_s = gdm_4ff_s(1)
% 
% gdm_43ff_s = polyfit( V1(411:451)-V2_43(411:451), I1_43_s(411:451) - I2_43_s(411:451),1);
% gdm_43_s = gdm_43ff_s(1)
% 
% gdm_45ff_s = polyfit( V1(431:471)-V2_45(431:471), I1_45_s(431:471) - I2_45_s(431:471),1);
% gdm_45_s = gdm_45ff_s(1)
