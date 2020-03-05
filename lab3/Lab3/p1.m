clearvars
close all

load p1.mat

Ib = Ib(1:81);
negIe = negIe(1:81);
Vb = Vb(1:81);
Vbbounds = [Vb(1), Vb(end)];

Ic = Ib - negIe;
Icff = polyfit(Vb, log(Ic), 1);
Icfit = exp(polyval(Icff, Vb));
Ibff = polyfit(Vb(1:65), log(Ib(1:65)), 1);
Ibfit = exp(polyval(Ibff, Vb));
U_T = 1/Icff(1);
I_s = exp(Icff(2));
figure(1)
semilogy(Vb, Ic, 'r.', Vb, Icfit, 'r', ...
         Vb, Ib, 'b.', Vb, Ibfit, 'b')
legend('Data: I_c', 'Fit: I_c', 'Data: I_b', 'Fit: I_b')
ylabel('Current (A)')
xlabel('Voltage (V)')
ylim([1e-10,5*1e-2])
xlim([0.43,0.75])
title('I_c & I_b vs. V_b: Fit values: U_T = 25.5mV, I_s=2.6fA')

beta = Ic./Ib;
figure(2)
semilogx(Ib,beta,'r.')
xlim([1e-10,1e-4])
ylabel('\beta (dim.-less)')
xlabel('Current (A)')
title('Semilog plot of \beta as a function of base current')

r_b = diff(Vb)./diff(Ib);
r_bfit = U_T./Ib;
g_m = diff(Ic)./diff(Vb);
g_mfit = Ic./U_T;
figure(3)
loglog(Ib(2:end), r_b,'r.', Ib, r_bfit,'r')
title('r_b vs. I_b, along with a theoretical fit')
ylim([3*1e2,1e8])
xlabel('Current (A)')
ylabel('Incremental Resistance (\Omega)')
legend('Data','Fit')

figure(4)
loglog(Ic(2:end), g_m,'r.', Ic, g_mfit, 'r')
title('g_m vs. I_c, along with a theoretical fit')
xlabel('Current (A)')
xlim([1e-7,1.5*1e-2])
ylabel('Incremental transconductance (1/\Omega)')
legend('Data','Fit')