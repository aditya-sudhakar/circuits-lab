close all
clearvars
addpath(genpath("../../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/e3B.raw");

var = raw_data.variable_mat;

sweep_s = linspace(0.5,1.5,(1.5-0.5)/0.25+1);
Ib1 = var(21,:,:);
Ib1 = squeeze(Ib1);
Ib2 = var(20,:,:);
Ib2 = squeeze(Ib2);
IinB = var(18,:,:);
IinB = IinB(:,:,1)';

f1 = polyfit(IinB, Ib2(:,1),1);
fit1 = polyval(f1, IinB);
f2 = polyfit(IinB, Ib2(:,2),1);
fit2 = polyval(f2, IinB);
f3 = polyfit(IinB, Ib2(:,3),1);
fit3 = polyval(f3, IinB);
f4 = polyfit(IinB, Ib2(:,4),1);
fit4 = polyval(f4, IinB);
f5 = polyfit(IinB, Ib2(:,5),1);
fit5 = polyval(f5, IinB);

div_ratios = [f1(1) f2(1) f3(1) f4(1) f5(1)];

dlbl1 = sprintf("Data: s_2 = %.2f*S", sweep_s(1));
dlbl2 = sprintf("Data: s_2 = %.2f*S", sweep_s(2));
dlbl3 = sprintf("Data: s_2 = %.2f*S", sweep_s(3));
dlbl4 = sprintf("Data: s_2 = %.2f*S", sweep_s(4));
dlbl5 = sprintf("Data: s_2 = %.2f*S", sweep_s(5));

flbl1 = sprintf("Fit: s_2 = %.2f*S, Ratio = %.2f",...
                sweep_s(1), div_ratios(1));
flbl2 = sprintf("Fit: s_2 = %.2f*S, Ratio = %.2f",...
                sweep_s(2), div_ratios(2));
flbl3 = sprintf("Fit: s_2 = %.2f*S, Ratio = %.2f",...
                sweep_s(3), div_ratios(3));
flbl4 = sprintf("Fit: s_2 = %.2f*S, Ratio = %.2f",...
                sweep_s(4), div_ratios(4));
flbl5 = sprintf("Fit: s_2 = %.2f*S, Ratio = %.2f",...
                sweep_s(5), div_ratios(5));

plot(IinB, Ib2(:,1),'r.',...
     IinB, Ib2(:,2),'g.',...
     IinB, Ib2(:,3),'b.',...
     IinB, Ib2(:,4),'c.',...
     IinB, Ib2(:,5),'m.',...
     IinB, fit1, 'r',...
     IinB, fit2, 'g',...
     IinB, fit3, 'b',...
     IinB, fit4, 'c',...
     IinB, fit5, 'm')
legend(dlbl1,dlbl2,dlbl3,dlbl4,dlbl5,...
       flbl1,flbl2,flbl3,flbl4,flbl5)
xlabel('I_{in} (A)')
ylabel('I_2 (A)')
title("Sweep of I_2's ITC for different values of s: Setup B")