clearvars
close all

load exp1data.mat
% Q1ff = polyfit(Vb(73:128),log(-negIeQ1(73:128)), 1);
% Q1fit = polyval(Q1ff, Vb);
% Q2ff = polyfit(Vb(73:128),log(-negIeQ2(73:128)), 1);
% Q2fit = polyval(Q2ff, Vb);
% Q3ff = polyfit(Vb(73:128),log(-negIeQ3(73:128)), 1);
% Q3fit = polyval(Q3ff, Vb);
% Q4ff = polyfit(Vb(73:128),log(-negIeQ4(73:128)), 1);
% Q4fit = polyval(Q4ff, Vb);
% 
% figure(1)
% semilogy(Vb, -negIeQ1, 'r.', ...
%      Vb, IbQ1, 'rs',...
%      Vb, exp(Q1fit), 'r', ...
%      Vb, -negIeQ2, 'g.', ...
%      Vb, IbQ2, 'gs',...
%      Vb, exp(Q2fit), 'g', ...
%      Vb, -negIeQ3, 'b.', ...
%      Vb, IbQ3, 'bs',...
%      Vb, exp(Q3fit), 'b', ...
%      Vb, -negIeQ4, 'c.', ...
%      Vb, IbQ4, 'cs',...
%      Vb, exp(Q4fit), 'c');
% 
% title('$V_{b}$ vs. $I_{b}$ and $I_{c}$ along with a theoretical fit', 'Interpreter', 'Latex')
% xlabel('Voltage (V)', 'Interpreter', 'Latex')
% ylabel('Current (A)', 'Interpreter', 'Latex')
% legend('Q1 $I_{C}$', 'Q1 $I_{B}$', 'Q1 Theoretical Fit',...
%     'Q2 $I_{C}$', 'Q2 $I_{B}$',  'Q2 Theoretical Fit',...
%     'Q3 $I_{C}$', 'Q3 $I_{B}$',  'Q3 Theoretical Fit',...
%     'Q4 $I_{C}$', 'Q4 $I_{B}$',  'Q4 Theoretical Fit','Interpreter', 'Latex');
% ylim([1e-10 1e-1]);
% % 
% figure(2);
% ax = axes;
% IcAvg = (-negIeQ1 + -negIeQ2 + -negIeQ3 + -negIeQ4)/4;
% plot(Vb, (-negIeQ1 -IcAvg)./IcAvg, 'r.', ...
%     Vb, (-negIeQ2 -IcAvg)./IcAvg, 'b.', ...
%     Vb, (-negIeQ3 -IcAvg)./IcAvg, 'g.', ...
%     Vb, (-negIeQ4 -IcAvg)./IcAvg, 'c.');
% ylim([-.1 .1]);
% xlim([0 1.2]);
% title('Percentage Difference $I_{ci}$ and $\bar{I_{c}}$', 'Interpreter', 'Latex')
% xlabel('Mean Collector Current (A)', 'Interpreter', 'Latex')
% ylabel('Percentage Difference', 'Interpreter', 'Latex')
% % ytickformat(ax, '%g%%');
% legend('Q1 $I_{C}$',...
%     'Q2 $I_{C}$', ...
%     'Q3 $I_{C}$', ...
%     'Q4 $I_{C}$', 'Interpreter', 'Latex');
% 


figure(3);
B1 = -negIeQ1(2:end - 2)./IbQ1(2:end - 2);
B2 = -negIeQ2(2:end - 2)./IbQ2(2:end - 2);
B3 = -negIeQ3(2:end - 2)./IbQ3(2:end - 2);
B4 = -negIeQ4(2:end - 2)./IbQ4(2:end - 2);

semilogx(IbQ1(2:end - 2), B1,'r.', ...
    IbQ2(2:end - 2), B2,'b.', ...
    IbQ3(2:end - 2), B3,'g.', ...
    IbQ4(2:end - 2), B4,'c.');
ylim([ 60 200]);
xlim([5e-8 5e-4]);
title("$\beta$ as a function of Base Current", 'Interpreter', 'Latex');
legend("$\beta$ Q1",...
    "$\beta$ Q2",...
    "$\beta$ Q3",...
    "$\beta$ Q4",'Interpreter', 'Latex');
xlabel('Base Current (A)', 'Interpreter', 'Latex')
ylabel('$\beta$', 'Interpreter', 'Latex')

% f = figure(4);
mean(B1)
mean(B2)
mean(B3)
mean(B4)

exp(Q1ff(2))
exp(Q2ff(2))
exp(Q3ff(2))
exp(Q4ff(2))





% 
% 
% figure(5);
% plot(Vb(2:end), B1, ...
%     Vb(2:end), B2, ...
%     Vb(2:end), B3, ...
%     Vb(2:end), B4);


