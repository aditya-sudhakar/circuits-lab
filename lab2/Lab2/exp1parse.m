clearvars
close all
load exp1.mat
Iout = Iout(1:90);
Vin = Vin(1:90);
ff = polyfit(Vin, log(Iout), 1);
uT = 1/ff(1);
Is = exp(ff(2));

figure(1)
semilogy(Vin, Iout, 'r.', ...
         Vin, Is*exp(Vin/uT), 'b', ...
         Vout(1:90), Iin(1:90), 'g.')
legend('I-V Characteristic', 'Theoretical Fit', 'V-I Characteristic')
xlabel('Voltage (V)')
ylabel('Current (A)')
title('I-V/V-I Characteristic Data vs. Theoretical Fit')

rdE = diff(Vout)./diff(Iin);
rdT = uT./Iin;
figure(2)
loglog(Iin(2:end), rdE, 'r.', Iin, rdT, 'b')
legend('Measured', 'Theoretical')
xlabel('Current (A)')
ylabel('r_d (\Omega)')
title('r_d vs. I, Measured and Theoretical')
