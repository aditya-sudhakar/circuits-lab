close all
clearvars
load exp3small.txt
load exp3large.txt

% Small amplitude shift data
ts = exp3small(:,1); % 1-24, 25-end
Vins = exp3small(:,2);
Vouts = exp3small(:,3);

% Lare amplitude shift data
tl = exp3large(:,1);
Vinl = exp3large(:,2);
Voutl = exp3large(:,3);

% Small amplitude shift plot
figure(1)
plot(ts,Vins,'r.-',ts,Vouts,'b.-')
title("Comparison of $V_{in}$ and $V_{out}$ over time: Small Amplitude Change", 'Interpreter', 'Latex');
xlabel("Time (s)", 'Interpreter', 'Latex');
ylabel("Voltage (V)", 'Interpreter', 'Latex');
legend('$V_{in}$',...
       '$V_{out}$', 'Interpreter', 'Latex');

% Large amplitude shift plot
figure(2)
plot(tl,Vinl,'r.-',tl,Voutl,'b.-')
title("Comparison of $V_{in}$ and $V_{out}$ over time: Large Amplitude Change", 'Interpreter', 'Latex');
xlabel("Time (s)", 'Interpreter', 'Latex');
ylabel("Voltage (V)", 'Interpreter', 'Latex');
legend('$V_{in}$',...
       '$V_{out}$', 'Interpreter', 'Latex');

% Extract time constant - rising
Vins1 = Vins(3:23);
Vouts1 = Vouts(3:23);
ts1 = ts(3:23)-ts(3);
Vouts1 = Vouts1 - Vouts1(end);
VbC1 = Vouts1./Vouts1(1);
VbC1 = VbC1(1:end-1);
ts1 = ts1(1:end-1);
ff1=polyfit(ts1, VbC1, 1);
ftau1 = -1./ff1(1);

% Extract time constant - falling
Vins2 = Vins(25:43);
Vouts2 = Vouts(25:43);
ts2 = ts(25:43)-ts(25);
Vouts2 = Vouts2 - Vouts2(end);
VbC2 = Vouts2./Vouts2(1);
VbC2 = VbC2(1:end-1);
ts2 = ts2(1:end-1);
ff2=polyfit(ts2, VbC2, 1);
ftau2 = -1./ff2(1);

% Extract slew rate - rising
Vinl1 = Vinl(3:61);
Voutl1 = Voutl(3:61);
tl1 = tl(3:61)-tl(3);
ffl1 = polyfit(tl1, Voutl1, 1);
sr1 = ffl1(1); % extracted slew rate
Vofl1 = polyval(ffl1, tl1);
% figure()
% plot(tl1, Vinl1,'b.-',tl1, Voutl1,'r.-', tl1, Vofl1, 'g.-')

% Extract slew rate - falling
Vinl2 = Vinl(114:132);
Voutl2 = Voutl(114:132);
tl2 = tl(114:132)-tl(114);
ffl2 = polyfit(tl2, Voutl2, 1);
sr2 = ffl2(1); % extracted slew rate
Vofl2 = polyval(ffl2, tl2);
% figure()
% plot(tl2, Vinl2,'b.-',tl2, Voutl2,'r.-', tl2, Vofl2, 'g.-')