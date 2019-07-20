%plot settings
set(0,'DefaultLineLineWidth', 1);
set(0,'defaulttextfontsize',16);
set(0,'defaultaxesfontsize',16);
set(0,'defaulttextinterpreter','latex'); 
set(0,'defaultAxesTickLabelInterpreter','latex');
set(0,'defaultLegendInterpreter','latex');

%% Plots of secondary power consumption vs life cycles
%500Ah capacity
%[-100;100] A discharge current

cyc=[0 250 500 750 1000 1250 1500 1750 2000 2250 2500 2750 3000 3250 3500 3750 4000 4250 4500 4750 5000 5250 5500 5750 6000]/2;
soc1=[100 95 92.5 91 89.5 88 87 86 85 84 83 82 81 80.1 79.3 78.5 77.7 76.9 76 75 73 70 66 61 55.5];
p_sec50=[1.8841e+04 2.1227e+04 2.2478e+04 2.3277e+04 2.4126e+04 2.5266e+04 2.5601e+04 2.6038e+04 2.6192e+04 2.6988e+04 2.7600e+04 2.8033e+04 2.8700e+04 2.9638e+04 3.0081e+04 2.9928e+04 3.0458e+04 3.0856e+04 3.1322e+04 3.2678e+04 3.2657e+04 3.3811e+04 3.5604e+04 3.7982e+04 4.1022e+04];
p_sec0=[2.8419e+04 3.0449e+04 3.1699e+04 3.2498e+04 3.3740e+04 3.4186e+04 3.5119e+04 3.6021e+04 3.5828e+04 3.6631e+04 3.7319e+04 3.7255e+04 3.7796e+04 3.8251e+04 3.9830e+04 3.9410e+04 3.9711e+04 4.0260e+04 4.1182e+04 4.1899e+04 4.1517e+04 4.3416e+04 4.4825e+04 4.7200e+04 5.0166e+04];
p_sec100=[1.3940e+04 1.4555e+04 1.5649e+04 1.6582e+04 1.7179e+04 1.7601e+04 1.7635e+04 1.8408e+04 1.8232e+04 1.9323e+04 1.9642e+04 1.9813e+04 2.1138e+04 2.0295e+04 2.1688e+04 2.1093e+04 2.1081e+04 2.1909e+04 2.2846e+04 2.3840e+04 2.3290e+04 2.5252e+04 2.6613e+04 2.9588e+04 3.1344e+04];


%450Ah
%[-100;100] A discharge current
p_sec100v2=[9.3700e+03 1.1118e+04 1.3035e+04 1.3001e+04 1.3515e+04 1.4502e+04 1.5593e+04 1.5422e+04 1.6873e+04 1.6548e+04 1.7206e+04 1.7663e+04 1.8275e+04 1.8902e+04 1.9661e+04 2.0149e+04 2.0464e+04 2.1747e+04 2.1429e+04 2.2851e+04 2.3070e+04 2.5249e+04 2.6218e+04 2.8871e+04 3.2791e+04];
p_sec50v2=[1.5384e+04 1.5384e+04 1.5384e+04 1.5439e+04 1.6011e+04 1.7280e+04 1.8084e+04 1.8070e+04 1.9027e+04 1.9338e+04 1.9768e+04 2.0338e+04 2.0967e+04 2.1613e+04 2.2047e+04 2.2427e+04 2.2995e+04 2.4546e+04 2.3867e+04 2.4792e+04 2.5536e+04 2.7845e+04 2.9248e+04 3.0895e+04 3.4029e+04];
p_sec0v2=[2.6403e+04 2.6403e+04 2.6403e+04 2.6970e+04 2.7742e+04 2.8739e+04 2.9910e+04 3.0270e+04 3.0877e+04 3.1873e+04 3.2150e+04 3.1838e+04 3.2830e+04 3.3484e+04 3.3491e+04 3.4211e+04 3.4440e+04 3.6022e+04 3.5311e+04 3.6591e+04 3.6981e+04 3.9286e+04 4.0813e+04 4.2396e+04 4.5774e+04];

figure(1)
plot(cyc,p_sec0v2)
hold on
plot(cyc,p_sec50v2)
plot(cyc,p_sec100v2)
hold off
box on
grid minor
%title('Power Simulink Model')
xlabel('Battery cycles')
ylabel('Secondary power consumption (Wh)')
legend('0\% initial SOC','50\% initial SOC','100\% initial SOC','location','northwest')
set(gca,'XMinorTick','on','YMinorTick','on')

%% Plots of secondary power consumption vs capacity
%[-100;100] A discharge current
cap=[100:25:800];
p100=[6.2175e+04 6.0954e+04 5.3462e+04 4.9702e+04 4.5417e+04 4.0749e+04 3.7084e+04 3.3263e+04 2.8305e+04 2.4098e+04 1.9881e+04 1.6963e+04 1.6079e+04 1.4603e+04 1.3386e+04 1.2937e+04 1.2114e+04 1.1824e+04 1.1135e+04 1.0697e+04 9.4536e+03 8.9397e+03 8.1675e+03 7.8788e+03 7.0788e+03 6.1397e+03 4.5954e+03 3.8875e+03 3.1296e+03];
p50=[6.5743e+04 6.3476e+04 5.9229e+04 5.4876e+04 5.2252e+04 4.7510e+04 4.5919e+04 4.2221e+04 3.7630e+04 3.5412e+04 3.1551e+04 2.7427e+04 2.3837e+04 1.9668e+04 1.5900e+04 1.4906e+04 1.4078e+04 1.3872e+04 1.2232e+04 1.1180e+04 1.0923e+04 1.0356e+04 8.9391e+03 8.0525e+03 7.4788e+03 6.8394e+03 4.9342e+03 4.1375e+03 3.4301e+03];
p0=[6.5398e+04 6.5010e+04 6.0081e+04 5.7557e+04 5.4972e+04 5.2123e+04 5.0630e+04 4.7566e+04 4.4756e+04 4.1751e+04 3.8998e+04 3.5771e+04 3.3431e+04 3.0474e+04 2.7487e+04 2.6403e+04 2.6403e+04 2.6403e+04 2.6403e+04 2.6403e+04 2.6403e+04 2.6403e+04 2.6403e+04 2.6403e+04 2.6403e+04 2.6403e+04 2.6403e+04 2.6403e+04 2.6403e+04]; 

figure(2)
plot(cap,p0)
hold on
plot(cap,p50)
plot(cap,p100)
hold off
box on
grid minor
xlabel('Battery capacity (Ah)')
ylabel('Secondary power consumption (Wh)')
legend('0\% initial SOC','50\% initial SOC','100\% initial SOC','location','northeast')
set(gca,'XMinorTick','on','YMinorTick','on')

%% Plots of secondary power consumption vs max charge and discharge battery currents
%450Ah
cur=[0:5:100];
pc100=[5.0675e+04 4.5762e+04 4.2148e+04 3.6597e+04 3.1899e+04  2.7176e+04 2.2571e+04 1.8586e+04 1.5542e+04 1.2151e+04 9.0943e+03 7.0487e+03 7.1004e+03 7.8518e+03 7.3276e+03 7.3129e+03 7.3233e+03 7.3264e+03 7.4653e+03 7.3622e+03 7.3700e+03];
pc50=[6.4398e+04 5.9184e+04 5.4521e+04 4.9894e+04 4.9894e+04 4.0670e+04 3.6681e+04 3.2372e+04 3.1003e+04 2.5805e+04 2.3587e+04 2.1397e+04 1.9208e+04 1.7449e+04 1.5925e+04 1.5203e+04 1.5020e+04 1.5384e+04 1.5384e+04 1.5384e+04 1.5384e+04];
pc0=[7.6218e+04 7.0567e+04 6.5904e+04 6.1277e+04 5.6583e+04 5.2052e+04 4.8061e+04 4.3755e+04 4.0932e+04 3.7185e+04 3.4970e+04 3.2779e+04 3.0591e+04 2.8831e+04 2.7307e+04 2.6585e+04 2.6403e+04 2.6403e+04 2.6403e+04 2.6403e+04 2.6403e+04];

figure(3)
plot(cur,pc0)
hold on
plot(cur,pc50)
plot(cur,pc100)
hold off
box on
grid minor
xlabel('Maximum charge current (A)')
ylabel('Secondary power consumption (Wh)')
legend('0\% initial SOC','50\% initial SOC','100\% initial SOC','location','northeast')
set(gca,'XMinorTick','on','YMinorTick','on')

cur2=[100:-5:0];
pdc0=[5.0108e+04 4.8424e+04 4.6560e+04 4.4724e+04 4.3146e+04 4.1181e+04 3.9773e+04 3.8335e+04 3.6723e+04 3.4908e+04 3.2884e+04 3.1309e+04 2.9867e+04 2.8272e+04 2.6936e+04 2.5774e+04 2.5916e+04 2.5642e+04 2.5866e+04 2.6397e+04 2.6403e+04];
pdc50=[6.2465e+04 5.5920e+04 5.0089e+04 4.3319e+04 3.6994e+04 3.0841e+04 2.7452e+04 2.6373e+04 2.4404e+04 2.3098e+04 2.1732e+04 2.0584e+04 1.8182e+04 1.7369e+04 1.5438e+04 1.4443e+04 1.4472e+04 1.4021e+04 1.4358e+04 1.4026e+04 1.4384e+04];
pdc100=[7.4951e+04 7.0410e+04 6.2997e+04 5.6141e+04 5.0559e+04 4.4988e+04 4.0098e+04 3.6168e+04 2.9819e+04 2.5678e+04 2.1581e+04 1.7817e+04 1.5528e+04 1.3544e+04 1.1778e+04 1.0313e+04 9.1732e+03 8.0543e+03 7.6108e+03 7.4203e+03 7.3700e+03];

figure(4)
plot(cur2,pdc0(end:-1:1))
hold on
plot(cur2,pdc50(end:-1:1))
plot(cur2,pdc100(end:-1:1))
hold off
box on
grid minor
xlabel('Maximum discharge current (A)')
ylabel('Secondary power consumption (Wh)')
legend('0\% initial SOC','50\% initial SOC','100\% initial SOC','location','northeast')
set(gca,'XMinorTick','on','YMinorTick','on')

%% Plots of secondary power consumption vs initial battery SOC
%450Ah 
%[-100;100] A discharge current
soc=[0:5:100];
p_soc=[2.9403e+04 2.8984e+04 2.7633e+04 2.4893e+04 2.3842e+04 2.1790e+04 2.1994e+04 2.0455e+04 1.8645e+04 1.6299e+04 1.5384e+04 1.4238e+04 1.3023e+04 1.0853e+04 9.7808e+03 8.0525e+03 6.5518e+03 4.4392e+03 4.3238e+03 6.4914e+03 7.3700e+03];
    
figure(5)
plot(soc,p_soc)
box on
grid minor
xlabel('Initial SOC (\%)')
ylabel('Secondary power consumption (Wh)')
set(gca,'XMinorTick','on','YMinorTick','on')
