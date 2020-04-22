close all
clearvars
load exp3small.txt
load exp3large.txt

ts = exp3small(:,1); % 1-24, 25-end
Vins = exp3small(:,2);
Vouts = exp3small(:,3);

tl = exp3large(:,1);
Vinl = exp3large(:,2);
Voutl = exp3large(:,3);

figure()
plot(ts,Vins,'r.-',ts,Vouts,'b.-')
title("Comparison of $V_{in}$ and $V_{out}$ over time: Small Amplitude Change", 'Interpreter', 'Latex');
xlabel("Time (s)", 'Interpreter', 'Latex');
ylabel("Voltage (V)", 'Interpreter', 'Latex');
legend('$V_{in}$',...
       '$V_{out}$', 'Interpreter', 'Latex');

figure()
plot(tl,Vinl,'r.-',tl,Voutl,'b.-')
title("Comparison of $V_{in}$ and $V_{out}$ over time: Large Amplitude Change", 'Interpreter', 'Latex');
xlabel("Time (s)", 'Interpreter', 'Latex');
ylabel("Voltage (V)", 'Interpreter', 'Latex');
legend('$V_{in}$',...
       '$V_{out}$', 'Interpreter', 'Latex');

Vins1 = Vins(1:24);
Vouts1 = Vouts(1:24);
ts1 = ts(1:24);
ff1=polyfit(ts1,log(Vins1-Vouts1),1);
tau1=-1/ff1(1);

Vins2 = Vins(25:38);
Vouts2 = Vouts(25:38);
V02 = Vouts(25);
ts2 = ts(25:38);
ff2=polyfit(ts2,log((Vouts2-Vins2)./(V02-Vins2)),1);
tau2=-1/ff2(1);

Vins2 = Vins(39:end);
Vouts2 = Vouts(39:end);
V02 = Vouts(39);
ts2 = ts(39:end);
ff2=polyfit(ts2,log((Vouts2-Vins2)./(V02-Vins2)),1);
tau3=1/ff2(1);
tau22 = (tau2+tau3)/2;