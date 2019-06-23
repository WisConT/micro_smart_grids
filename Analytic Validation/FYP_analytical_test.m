%% FYP Analytical Test
%
%by César Maklary.
%
%Script to verify analytically the results of the Simulink model
%power_microgrid_v3_analytic.slxc
%
%The simulink model needs to run before this script to output the scope
%data under the structure name Scope_analytical.

%clear house but not workspace variables
close all
clc

%plot settings
set(0,'DefaultLineLineWidth', 1);
set(0,'defaulttextfontsize',14);
set(0,'defaultaxesfontsize',14);
set(0,'defaulttextinterpreter','latex'); 
set(0,'defaultAxesTickLabelInterpreter','latex');
set(0,'defaultLegendInterpreter','latex');

%% Load Profiles
%24h period split in intervals of 600s (timescale in hours)
t=xlsread('Domestic_data_all_x3.xlsx',1,'B2:EQ2')/3600;
%Domestic load from All houses with 3 sizes (1.0-49m2, 2.50-99m2 3.
%100-149m2)
P_A=xlsread('Domestic_data_all_x3.xlsx',1,'B3:EQ5');
%Default PV load data
load('default_PV_data.mat');
%Select PV data every 600s (default in file in 60s)
for i=1:length(P_A(1,:));
    P_PV(i)=SPD_1min(1+10*(i-1))/3;
end

%% Secondary Power Calculations
Vsec=230; %secondary circuit voltage (V)
R=1e6; %resistance of loads to model ideal current sources (Ohms)
%convert power loads to RMS currents for controlled current source
%(P=I_rms*V_rms)
I_A=P_A/Vsec;
I_PVin=P_PV/Vsec;

%total RMS currents at node closest to + side of secondary transformer (A)
I_load=I_A(1,:)+I_A(2,:)+I_A(3,:)-3*Vsec/R; %total loads current
I_PVout=I_PVin-Vsec/R; %total PV current
I_sec=I_PVout-I_load; %summation of current

%calculate power from RMS current and transformer voltage (W)
P_load=I_load*Vsec; %power loads output
P_PVout=I_PVout*Vsec; %power PV output
P_sec=I_sec*Vsec; %power secondary circuit

%% Plots
%analytical plot
figure(1)
plot(t(1:end),P_sec(1:end))
hold on
plot(t(1:end),P_load(1:end))
plot(t(1:end),P_PVout(1:end))
hold off
box on
grid minor
%title('Power Analytical Calculations')
xlabel('Time (h)')
ylabel('Power (W)')
xlim([0 24])
xticks([0:3:24])
ylim([-2000 5100])
legend('secondary circuit power','domestic loads','PV generation')
set(gca,'XMinorTick','on','YMinorTick','on')

%simulation plot
figure(2)
plot(sec_p.time,sec_p.data)
hold off
box on
grid minor
%title('Power Simulink Model')
xlabel('Time [s]')
ylabel('Power [W]')
xlim([0 24])
xticks([0:3:24])
legend('secondary','loads','PV')
set(gca,'XMinorTick','on','YMinorTick','on')