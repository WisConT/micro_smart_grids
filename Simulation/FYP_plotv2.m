clc
clear

cyc=[0 250 500 750 1000 1250 1500 1750 2000 2250 2500 2750 3000 3250 3500 3750 4000 4250 4500 4750 5000 5250 5500 5750 6000]/2;
soc1=[100 95 92.5 91 89.5 88 87 86 85 84 83 82 81 80.1 79.3 78.5 77.7 76.9 76 75 73 70 66 61 55.5];

set(0,'DefaultLineLineWidth', 1);
set(0,'defaulttextfontsize',16);
set(0,'defaultaxesfontsize',16);
set(0,'defaulttextinterpreter','latex'); 
set(0,'defaultAxesTickLabelInterpreter','latex');
set(0,'defaultLegendInterpreter','latex');

figure(1)
plot(cyc,soc1)
box on
grid minor
%title('Power Simulink Model')
xlabel('Battery cycles')
ylabel('Battery capacity (\% of maximum)')
set(gca,'XMinorTick','on','YMinorTick','on')