%% ROI of smart grid
%plot settings
set(0,'DefaultLineLineWidth', 1);
set(0,'defaulttextfontsize',16);
set(0,'defaultaxesfontsize',16);
set(0,'defaulttextinterpreter','latex'); 
set(0,'defaultAxesTickLabelInterpreter','latex');
set(0,'defaultLegendInterpreter','latex');

peak7=15.3; %peak economy 7 cheapest average price (p/kWh) 00:00-07:00
offp7=8.7; %off-peak economy 7 cheapest average price (p/kWh) 07:00-00:00
ch7=14; %economy 7 average standing charge (p/day)
stan=13.8; %cheapest normal rate (p/kWh)
ch_stan=9; %standard cheapest standing charge (p/day)
%data source: https://www.moneysavingexpert.com/utilities/economy-7/
PV_inst=25/4*6000; %average installation cost of PV for units larger than 4kWp (in £) (6000-8000) approx 175m2 of PV surface
fit=3.63; %feed-in tarrif of unused electricity fed back to grid up to 31/03/19 (p/kWh)
bat_inst1=5920/13.5*(500*230/1000); %battery installation price for 500Ah (in £)
bat_inst2=5920/13.5*(400*230/1000); %for 400Ah
bat_inst3=5920/13.5*(300*230/1000); %for 300Ah

%battery capacity only to 90%
%(https://www.greenmatch.co.uk/blog/2018/07/solar-battery-storage-system-cost)
clear tot_stan tot_7 tot_PV500 tot_PV400 tot_PV400fit tot_PV300 tot_PV300fit

for i=1:365*6;
tot_stan(i)=trapz(pload.data)/40/1000*stan/100*i+ch_stan/100*i;
tot_7(i)=(trapz(pload.data(1:435))/40/1000*offp7/100*i)+...
    (trapz(pload.data(435:end))/40/1000*peak7/100*i)+ch7/100*i;
end
tot_stan=[0 tot_stan];
tot_7=[0 tot_7];

tot_PV500(1)=PV_inst+bat_inst1;
tot_PV400(1)=PV_inst+bat_inst2;
tot_PV400fit(1)=PV_inst+bat_inst2;
tot_PV300(1)=PV_inst+bat_inst3;
tot_PV300fit(1)=PV_inst+bat_inst3;
for i=2:366*6-5;
    tot_PV500(i)=tot_PV500(i-1)+abs(-2.9809e+06)/40/1000*stan/100+ch_stan/100;
    tot_PV400(i)=tot_PV400(i-1)+abs(-3.7153e+06)/40/1000*stan/100+ch_stan/100;
    tot_PV400fit(i)=tot_PV400fit(i-1)+...
        abs(-3.7153e+06)/40/1000*stan/100+ch_stan/100-(7.8756e+05)/40/1000/100*fit;
    tot_PV300(i)=tot_PV300(i-1)+abs(-4.9825e+06)/40/1000*stan/100+ch_stan/100;
    tot_PV300fit(i)=tot_PV300fit(i-1)+...
        abs(-4.9825e+06)/40/1000*stan/100+ch_stan/100-(2.2102e+06)/40/1000/100*fit;
end

figure(1)
plot([0:365*6]/365,tot_stan,'color',[0.8500, 0.3250, 0.0980])
hold on
plot([0:365*6]/365,tot_7,'color',[0.9290, 0.6940, 0.1250])
plot([0:365*6]/365,tot_PV500,':','color',[0.6350, 0.0780, 0.1840])
plot([0:365*6]/365,tot_PV400,'-.','color',[0, 0.4470, 0.7410])
plot([0:365*6]/365,tot_PV400fit,'-.','color',[0.3010, 0.7450, 0.9330])
plot([0:365*6]/365,tot_PV300,'--','color',[0, 0.5, 0])
plot([0:365*6]/365,tot_PV300fit,'--','color',[0.75, 0.75, 0])
hold off
box on
grid minor
xlabel('Years')
ylabel('Electricity cost (pounds)')
legend('standard tarriff','economy 7 tarriff','500Ah battery','400Ah battery','400Ah battery with FIT','300Ah battery','300Ah battery with FIT','location','northwest')
set(gca,'XMinorTick','on','YMinorTick','on')


