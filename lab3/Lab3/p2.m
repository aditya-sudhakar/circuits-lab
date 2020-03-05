close all
clearvars

load exp1for2.mat
load exp2data.mat
load params.mat

Ie30001 = -negIe30001(2:end);
Ie3001 = -negIe3001(2:end);
Ie301 = -negIe301(2:end);
Ve30100 = Ie30001*30100;
Ve3010 = Ie3001*3010;
Ve301 = Ie301*301;

Ib30001 = Ib30001(2:end);
Ib3001 = Ib3001(2:end);
Ib301 = Ib301(2:end);

Vb = Vb(2:end);

Ic30001 = Ib30001 + Ie30001;
Ic3001 = Ib3001 + Ie3001;
Ic301 = Ib301 + Ie301;
Ic30100ff = polyfit(Vb(50:end),Ic30001(50:end),1);
Ic30100fit = polyval(Ic30100ff, Vb);
Ic3010ff = polyfit(Vb(50:end),Ic3001(50:end),1);
Ic3010fit = polyval(Ic3010ff, Vb);
Ic301ff = polyfit(Vb(50:end),Ic301(50:end),1);
Ic301fit = polyval(Ic301ff, Vb);
Icideal = I_s*exp(Vb/U_T);

figure(1)
semilogy(Vb, Ic30001,'r.',...
         Vb, Ic3001,'b.',...
         Vb, Ic301,'g.',...
         Vbp1, Icp1, 'cs', ...
         Vb, Icideal,'c')
legend('Data: R=30100\Omega',...
       'Data: R=3010\Omega',...
       'Data: R=301\Omega',...
       'Fit from Exp. 1',...
       'Collector Characteristic')
xlabel('Base voltage (V)')
ylabel('Collector current (A)')
ylim([1e-9,1e-1])
title('I_c vs. V_b for three resistors: {30100\Omega, 3010\Omega, 301\Omega}')

figure(2)
plot(Vb, Ic30001, 'r.', Vb, Ic30100fit, 'r')
title('Collector current vs. Base voltage for R=30100 \Omega')
legend('Data', 'Fit: 1/Slope = 29867\Omega')
xlabel('Base voltage (V)')
ylabel('Collector current (A)')
figure(3)
plot(Vb, Ic3001, 'r.', Vb, Ic3010fit, 'r')
title('Collector current vs. Base voltage for R=3010 \Omega')
legend('Data', 'Fit: 1/Slope = 3026\Omega')
xlabel('Base voltage (V)')
ylabel('Collector current (A)')
figure(4)
plot(Vb, Ic301, 'r.', Vb, Ic301fit, 'r')
title('Collector current vs. Base voltage for R=301 \Omega')
legend('Data', 'Fit: 1/Slope = 300.7\Omega')
xlabel('Base voltage (V)')
ylabel('Collector current (A)')

% Interpolate out beta values based on Ib
beta30100 = interp1(Ib,beta,Ib30001,'spline');
beta3010 = interp1(Ib,beta,Ib3001,'spline');
beta301 = interp1(Ib,beta,Ib301,'spline');

% Grab Rb and Rbfit values
Rb30001 = diff(Vb)./diff(Ib30001);
Rb3001 = diff(Vb)./diff(Ib3001);
Rb301 = diff(Vb)./diff(Ib301);
Rbfit30100 = U_T./Ib30001+30100*(beta30100+1);
Rbfit3010 = U_T./Ib3001+3010*(beta3010+1);
Rbfit301 = U_T./Ib301+301*(beta301+1);

% Grab Gm and Gmfit values
Gm30001 = diff(Ic30001)./diff(Vb);
Gm3001 = diff(Ic3001)./diff(Vb);
Gm301 = diff(Ic301)./diff(Vb);
Gmfit30100 = beta30100./Rbfit30100;
Gmfit3010 = beta3010./Rbfit3010;
Gmfit301 = beta301./Rbfit301;

figure(5)
loglog(Ib30001(2:end), Rb30001,'r.',...
       Ib3001(2:end), Rb3001,'b.',...
       Ib301(2:end), Rb301,'g.',...
       Ib30001, Rbfit30100,'r',...
       Ib3001, Rbfit3010,'b',...
       Ib301, Rbfit301,'g')
xlabel('Base current (A)')
ylabel('Incremental Resistance (\Omega)')
legend('Data: R=30100\Omega',...
       'Data: R=3010\Omega',...
       'Data: R=301\Omega',...
       'Fit: R=30100\Omega',...
       'Fit: R=3010\Omega',...
       'Fit: R=301\Omega')
title('R_b vs. I_b')

figure(6)
loglog(Ib30001(2:end), Gm30001,'r.',...
       Ib3001(2:end), Gm3001,'b.',...
       Ib301(2:end), Gm301,'g.',...
       Ib30001, Gmfit30100,'r',...
       Ib3001, Gmfit3010,'b',...
       Ib301, Gmfit301,'g')
xlabel('Base current (A)')
ylabel('Incremental Transconductance (1/\Omega)')
legend('Data: R=30100\Omega',...
       'Data: R=3010\Omega',...
       'Data: R=301\Omega',...
       'Fit: R=30100\Omega',...
       'Fit: R=3010\Omega',...
       'Fit: R=301\Omega')
title('G_m vs. I_b')
