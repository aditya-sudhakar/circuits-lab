close all
clearvars
addpath(genpath("../../GlobalFunctions/"));
load("lab6/exp1");

Isat1 = load("./lab6/exp1/Isat1.txt");
Isat2 = load("./lab6/exp1/Isat2.txt");
Isat3 = load("./lab6/exp1/Isat3.txt");
Isat4 = load("./lab6/exp1/Isat4.txt");
Vd = load("./lab6/exp1/Vd.txt");
Vg = load("./lab6/exp1/Vg.txt");

[Is_1, V_T0_1, k1] = ekvfit(Vg, Isat1, 0.0001);
[Is_2, V_T0_2, k2] = ekvfit(Vg, Isat2, 0.0001);
[Is_3, V_T0_3, k3] = ekvfit(Vg, Isat3, 0.0001);
[Is_4, V_T0_4, k4] = ekvfit(Vg, Isat4, 0.0001);

% PART 1-------------------------------------------------- %
% Is_1
% Is_2
% Is_3
% Is_4

% V_T0_1
% V_T0_2
% V_T0_3
% V_T0_4

% k1
% k2
% k3
% k4

% PART 2-------------------------------------------------- %

figure()
semilogy(Vg, Isat1, 'r',...
         Vg, Isat2, 'g',...
         Vg, Isat3, 'b',...
         Vg, Isat4, 'c');
title("ALD1106 Current-Voltage Characteristics", "Interpreter", "Latex");
xlabel("Gate Voltage (V)", "Interpreter", "Latex");
ylabel("Channel Current(A)", "Interpreter", "Latex");
legend("Q1", "Q2", "Q3","Q4","Interpreter", "Latex");

% PART 3-------------------------------------------------- %

% Isatavg = (Isat1 + Isat2 + Isat3 + Isat4)./4;
% 
% pd1 = 100.*(Isat1-Isatavg)./Isatavg;
% pd2 = 100.*(Isat2-Isatavg)./Isatavg;
% pd3 = 100.*(Isat3-Isatavg)./Isatavg;
% pd4 = 100.*(Isat4-Isatavg)./Isatavg;
% 
% figure()
% semilogx(Isatavg, pd1, 'r.',...
%          Isatavg, pd2, 'g.',...
%          Isatavg, pd3, 'b.',...
%          Isatavg, pd4, 'c.');
% title("Percent Difference from Average Channel Current", "Interpreter", "Latex");
% xlabel("Average Channel Current (A)", "Interpreter", "Latex");
% ylabel("Percent Difference (\%)", "Interpreter", "Latex");
% legend("Q1", "Q2", "Q3","Q4","Interpreter", "Latex");


