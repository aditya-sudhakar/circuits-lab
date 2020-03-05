V25 = Vin(51);
V5 = Vin(101);
Rtrue = Ravg/2;

I125 = I1(51);
I15 = I1(101);
I225 = I2(51);
I25 = I2(101);
I325 = I3(51);
I35 = I3(101);
I425 = I4(51);
I45 = I4(101);

eI = [1 I125 I15;
      2 I225 I25;
      3 I325 I35;
      4 I425 I45];

tI = [1 aj(1,V25,Rtrue) aj(1,V5,Rtrue);
      2 aj(2,V25,Rtrue) aj(2,V5,Rtrue);
      3 aj(3,V25,Rtrue) aj(3,V5,Rtrue);
      4 aj(4,V25,Rtrue) aj(4,V5,Rtrue)];

figure(1)
semilogy(eI(:,1), -eI(:,2), 'rs', eI(:,1), -eI(:,3), 'bs', ...
         tI(:,1),  tI(:,2), 'r*', tI(:,1),  tI(:,3), 'b*')
xlabel('Branch number')
ylabel('Branch Current (A)')
title('Semilog graph of Current flowing through branches')
legend('Experimental: V = 2.5V','Experimental: V = 5V',...
       'Theoretical: V = 2.5V','Theoretical: V = 5V')