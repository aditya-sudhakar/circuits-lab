close all
clearvars
addpath(genpath("../../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/exp1.raw");
vnml=raw_data.variable_name_list;
var = raw_data.variable_mat;

V1w = var(2,:,1);
V1s = var(2,:,4);
V2w = var(5,:,1:3); % 2.5, 3.5, 4.5

Vo_2_w = var(19,:,1);
Vo_3_w = var(19,:,2);
Vo_4_w = var(19,:,3);
Vo_2_s = var(19,:,4);
Vo_3_s = var(19,:,5);
Vo_4_s = var(19,:,6);

figure(1)
plot(V1w, Vo_2_w, 'r.', ...
     V1w, Vo_3_w, 'b.', ...
     V1w, Vo_4_w, 'g.');
title("VTC of $V_{out}$ vs. $V_1$ in weak inversion: $V_b = 0.5V$", 'Interpreter', 'Latex');
xlabel("$V_1$ (V)", 'Interpreter', 'Latex');
ylabel("$V_{out}$ (V)", 'Interpreter', 'Latex');
legend('$V_{out}$, $V_2$ at $2.5V$',...
       '$V_{out}$, $V_2$ at $3.5V$',...
       '$V_{out}$, $V_2$ at $4.5V$', 'Interpreter', 'Latex');
   
figure(2)
plot(V1s, Vo_2_s, 'r.', ...
     V1s, Vo_3_s, 'b.', ...
     V1s, Vo_4_s, 'g.');
title("VTC of $V_{out}$ vs. $V_1$ in strong inversion: $V_b = 1.5V$", 'Interpreter', 'Latex');
xlabel("$V_1$ (V)", 'Interpreter', 'Latex');
ylabel("$V_{out}$ (V)", 'Interpreter', 'Latex');
legend('$V_{out}$, $V_2$ at $2.5V$',...
       '$V_{out}$, $V_2$ at $3.5V$',...
       '$V_{out}$, $V_2$ at $4.5V$', 'Interpreter', 'Latex');