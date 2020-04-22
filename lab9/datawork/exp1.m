close all
clearvars
addpath(genpath("../../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/exp1.raw");
vnml=raw_data.variable_name_list;
var = raw_data.variable_mat;

V1 = var(2,:,1);
V2 = var(5,:,:); % 2.5, 3.5, 4.5
Vo_2 = var(21,:,1);
Vo_3 = var(21,:,2);
Vo_4 = var(21,:,3);

% Vo_2_w = var(19,:,1); % 2.488 <-> 2.504
% Vo_3_w = var(19,:,2); % 3.488 <-> 3.506
% Vo_4_w = var(19,:,3); % 4.491 <-> 4.505
% Vo_2_s = var(19,:,4); % 2.48 <-> 2.515
% Vo_3_s = var(19,:,5); % 3.48 <-> 3.52
% Vo_4_s = var(19,:,6); % 4.498 <-> 4.514
% 
% V1_2_w = [V1w(1:50:2489), V1w(2490:2504), V1w(2505:50:end)];
% Vo_2_w = [Vo_2_w(1:50:2489), Vo_2_w(2490:2504), Vo_2_w(2505:50:end)];
% 
% V1_3_w = [V1w(1:50:3489), V1w(3490:3506), V1w(3507:50:end)];
% Vo_3_w = [Vo_3_w(1:50:3489), Vo_3_w(3490:3506), Vo_3_w(3507:50:end)];
% 
% V1_4_w = [V1w(1:50:4492), V1w(4493:4505), V1w(4506:50:end)];
% Vo_4_w = [Vo_4_w(1:50:4492), Vo_4_w(4493:4505), Vo_4_w(4506:50:end)];
% 
% V1_2_s = [V1s(1:50:2481), V1s(2482:2515), V1s(2516:50:end)];
% Vo_2_s = [Vo_2_s(1:50:2481), Vo_2_s(2482:2515), Vo_2_s(2516:50:end)];
% 
% V1_3_s = [V1s(1:50:3481), V1s(3482:3520), V1s(3521:50:end)];
% Vo_3_s = [Vo_3_s(1:50:3481), Vo_3_s(3482:3520), Vo_3_s(3521:50:end)];
% 
% V1_4_s = [V1s(1:50:4499), V1s(4450:4514), V1s(4515:50:end)];
% Vo_4_s = [Vo_4_s(1:50:4499), Vo_4_s(4450:4514), Vo_4_s(4515:50:end)];
% 
figure(1)
plot(V1, Vo_2, 'r.', ...
     V1, Vo_3, 'b.', ...
     V1, Vo_4, 'g.');
title("VTC of $V_{out}$ vs. $V_1$: $V_b = 0.7V$", 'Interpreter', 'Latex');
xlabel("$V_1$ (V)", 'Interpreter', 'Latex');
ylabel("$V_{out}$ (V)", 'Interpreter', 'Latex');
legend('$V_{out}$, $V_2$ at $2.5V$',...
       '$V_{out}$, $V_2$ at $3.5V$',...
       '$V_{out}$, $V_2$ at $4.5V$', 'Interpreter', 'Latex');

% figure(2)
% plot(V1_2_s, Vo_2_s, 'r.', ...
%      V1_3_s, Vo_3_s, 'b.', ...
%      V1_4_s, Vo_4_s, 'g.');
% title("VTC of $V_{out}$ vs. $V_1$ in strong inversion: $V_b = 1.5V$", 'Interpreter', 'Latex');
% xlabel("$V_1$ (V)", 'Interpreter', 'Latex');
% ylabel("$V_{out}$ (V)", 'Interpreter', 'Latex');
% legend('$V_{out}$, $V_2$ at $2.5V$',...
%        '$V_{out}$, $V_2$ at $3.5V$',...
%        '$V_{out}$, $V_2$ at $4.5V$', 'Interpreter', 'Latex');