close all
clearvars
addpath(genpath("../../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/e3A.raw");

var = raw_data.variable_mat;

sweep_s = linspace(0.5,1.5,(1.5-0.5)/0.25+1);
Ia1 = var(23,:,:);
Ia1 = squeeze(Ia1);
Ia2 = var(22,:,:);
Ia2 = squeeze(Ia2);
IinA = var(19,:,:);
IinA = IinA(:,:,1)';

f1 = polyfit(IinA, Ia2(:,1),1);
fit1 = polyval(f1, IinA);
f2 = polyfit(IinA, Ia2(:,2),1);
fit2 = polyval(f2, IinA);
f3 = polyfit(IinA, Ia2(:,3),1);
fit3 = polyval(f3, IinA);
f4 = polyfit(IinA, Ia2(:,4),1);
fit4 = polyval(f4, IinA);
f5 = polyfit(IinA, Ia2(:,5),1);
fit5 = polyval(f5, IinA);

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

plot(IinA, Ia2(:,1),'r.',...
     IinA, Ia2(:,2),'g.',...
     IinA, Ia2(:,3),'b.',...
     IinA, Ia2(:,4),'c.',...
     IinA, Ia2(:,5),'m.',...
     IinA, fit1, 'r',...
     IinA, fit2, 'g',...
     IinA, fit3, 'b',...
     IinA, fit4, 'c',...
     IinA, fit5, 'm')
legend(dlbl1,dlbl2,dlbl3,dlbl4,dlbl5,...
       flbl1,flbl2,flbl3,flbl4,flbl5)
xlabel('I_{in} (A)')
ylabel('I_2 (A)')
ylim([0 6e-5])
title("Sweep of I_2's ITC for different values of s: Setup A")