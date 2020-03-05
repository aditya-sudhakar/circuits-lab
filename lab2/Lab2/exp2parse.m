clearvars
close all
load exp2.mat
load diodechars.mat

%Remove the part of data where current becomes negative
Vin30001 = Vin30001(1:33);
Vin3001 = Vin3001(1:33);
Vin301 = Vin301(1:33);

Vdiode30001 = Vdiode30001(1:33);
Vdiode3001 = Vdiode3001(1:33);
Vdiode301 = Vdiode301(1:33);

I30001 = I30001(1:33);
I3001 = I3001(1:33);
I301 = I301(1:33);

% Get theoretical fits
% For diode voltage
vd30001 = vdcalc(I30001, Is, uT);
vd3001 = vdcalc(I3001, Is, uT);
vd301 = vdcalc(I301, Is, uT);
Vinflip = fliplr(Vin30001);
Vinflip = Vinflip';
Vinflip = Vinflip(1:8);
Voutflip = fliplr(Vdiode30001);
Voutflip = Voutflip';
Voutflip = Voutflip(1:8);
ff = polyfit(Vinflip, Voutflip, 1);
Vdfit = ff(1)*Vin30001(20:end) + ff(2);

% For current (assuming current is due to voltage across diode)
Id30001 = idcalc(Vin30001, Is, uT);
Id3001 = idcalc(Vin3001, Is, uT);
Id301 = idcalc(Vin301, Is, uT);

% For current (assuming current is due to voltage across resistor)
% First calculate Ion, and then Von
Ion30001 = uT/30001;
Ion3001 = uT/3001;
Ion301 = uT/301;

Von30001 = uT*log(Ion30001/Is);
Von3001 = uT*log(Ion3001/Is);
Von301 = uT*log(Ion301/Is);

RvIonVon = [30001 Ion30001 Von30001;
            3001  Ion3001  Von3001;
            301   Ion301   Von301];

% Now find current fit
Ir30001 = ircalc(Vin30001, Von30001, 30001);
Ir3001 = ircalc(Vin3001, Von3001, 3001);
Ir301 = ircalc(Vin301, Von301, 301);

% Make plots
figure(1)
plot(Vin30001, Vdiode30001, 'r.', ...
     Vin3001, Vdiode3001, 'b.', ...
     Vin301, Vdiode301, 'g.', ...
     Vin30001(20:end), Vdfit)
legend('Data: R = 30001 \Omega', ...
       'Data: R = 3001 \Omega', ...
       'Data: R = 301 \Omega', ...
       'Linear fit: 0.8512*V_{in}+0.0631')
xlabel('V_{in} (V)')
ylabel('V_{diode} (V)')
title('Voltage across diode vs. Voltage input for all three resistances')

figure(2)
semilogy(Vin30001, I30001, 'r.', ...
         Vin3001, I3001, 'b.', ...
         Vin301, I301, 'g.', ...
         Vin30001, Id30001, ...
         Vin3001, Id3001, ...
         Vin301, Id301)
xlabel('V_{in} (V)')
ylabel('I_{in} (A)')
ylim([1e-10,1e-1])
legend('Data: R = 30001 \Omega', ...
       'Data: R = 3001 \Omega', ...
       'Data: R = 301 \Omega', ...
       'Fit: R = 30001 \Omega', ...
       'Fit: R = 3001 \Omega', ...
       'Fit: R = 301 \Omega')
 title('Semilog_y graph of Current vs. Voltage for all three resistors')

figure(3)
plot(Vin30001, I30001, 'r.', Vin30001, Ir30001,'b')
xlabel('V_{in} (V)')
ylabel('I_{in} (A)')
legend('Data','Fit')
title('Linear graph of Current vs. Voltage for R = 30001\Omega')

figure(4)
plot(Vin3001, I3001, 'r.', Vin3001, Ir3001,'b')
xlabel('V_{in} (V)')
ylabel('I_{in} (A)')
legend('Data','Fit')
title('Linear graph of Current vs. Voltage for R = 3001\Omega')

figure(5)
plot(Vin301, I301, 'r.', Vin301, Ir301,'b')
xlabel('V_{in} (V)')
ylabel('I_{in} (A)')
legend('Data','Fit')
title('Linear graph of Current vs. Voltage for R = 301\Omega')

figure(6)
loglog(RvIonVon(:,1), RvIonVon(:,2), 'rs-')
xlabel('Resistor Value (\Omega)')
ylabel('I_{on} value (A)')
legend('Measured I_{on} value')
title('I_{on} as a function of R')

figure(7)
semilogx(RvIonVon(:,1), RvIonVon(:,3), 'rs-')
xlabel('Resistor Value (\Omega)')
ylabel('V_{on} value (V)')
legend('Measured V_{on} value')
title('V_{on} as a function of R')

% Local functions made to make theoretical fit calculations easier.
function Vd = vdcalc(I, is, ut)
    Vd = ut * (log(I) - log(is));
end

function Id = idcalc(Vin, is, ut)
    Id = is*exp(Vin./ut);
end

function Ir = ircalc(Vin, Vdiode, R)
    Ir = (Vin-Vdiode)./R;
end