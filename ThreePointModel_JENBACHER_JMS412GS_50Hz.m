%% Initialization
clear all, clc, close all, format short e;
%% Manufacturer data
JENBACHER_JMS412GS_50Hz=struct('PM_100', 928, 'PE_100', 901, 'GNL_100', 2251, 'RE_100', 40, 'FGE_100', 4863, 'T_100', 403, 'PHT_100', 524,...
    'PM_75', 696, 'PE_75', 675, 'GNL_75', 1735, 'RE_75', 38.9, 'FGE_75', 3571, 'T_75', 436, 'PHT_75', 393,...
    'PM_50', 464, 'PE_50', 448, 'GNL_50', 1217, 'RE_50', 36.8, 'FGE_50', 2428, 'T_50', 471, 'PHT_50', 274,...
    'PM_EU', 'kWm', 'PE_EU', 'kWe', 'GNL_EU', 'kWpci', 'RE_EU', '%', 'FGE_EU', 'kg/h', 'T_EU', 'ºC', 'PHT_EU', 'kWt');
%% Tables
input_data=[100 75 50];
PM_output_data=[JENBACHER_JMS412GS_50Hz.PM_100 JENBACHER_JMS412GS_50Hz.PM_75 JENBACHER_JMS412GS_50Hz.PM_50];
PE_output_data=[JENBACHER_JMS412GS_50Hz.PE_100 JENBACHER_JMS412GS_50Hz.PE_75 JENBACHER_JMS412GS_50Hz.PE_50];
GNL_output_data=[JENBACHER_JMS412GS_50Hz.GNL_100 JENBACHER_JMS412GS_50Hz.GNL_75 JENBACHER_JMS412GS_50Hz.GNL_50];
RE_output_data=[JENBACHER_JMS412GS_50Hz.RE_100 JENBACHER_JMS412GS_50Hz.RE_75 JENBACHER_JMS412GS_50Hz.RE_50];
FGE_output_data=[JENBACHER_JMS412GS_50Hz.FGE_100 JENBACHER_JMS412GS_50Hz.FGE_75 JENBACHER_JMS412GS_50Hz.FGE_50];
T_output_data=[JENBACHER_JMS412GS_50Hz.T_100 JENBACHER_JMS412GS_50Hz.T_75 JENBACHER_JMS412GS_50Hz.T_50];
PHT_output_data=[JENBACHER_JMS412GS_50Hz.PHT_100 JENBACHER_JMS412GS_50Hz.PHT_75 JENBACHER_JMS412GS_50Hz.PHT_50];

%% PM Fit
figure(1);
[FirstOrderPoly_PM_Fit, FirstOrderPoly_PM_Fit_Gof] = create_FirstOrderPoly_PM_Fit_JENBACHER_JMS412GS_50Hz(input_data, PM_output_data);
xlabel('% Load'); 
sAux='Mechanical Power ['; sAux=strcat(sAux, JENBACHER_JMS412GS_50Hz.PM_EU); sAux=strcat(sAux, ']'); ylabel(sAux); 
sAux='Mechanical Power(% Load)='; sAux=strcat(sAux, num2str(FirstOrderPoly_PM_Fit.p1)); sAux=strcat(sAux, '*% Load'); sAux=strcat(sAux, '+'); sAux=strcat(sAux, num2str(FirstOrderPoly_PM_Fit.p2)); title(sAux); 
%% PE Fit
figure(2);
[FirstOrderPoly_PE_Fit, FirstOrderPoly_PE_Fit_Gof] = create_FirstOrderPoly_PE_Fit_JENBACHER_JMS412GS_50Hz(input_data, PE_output_data);
xlabel('% Load'); 
sAux='Electrical Power ['; sAux=strcat(sAux, JENBACHER_JMS412GS_50Hz.PE_EU); sAux=strcat(sAux, ']'); ylabel(sAux); 
sAux='Electrical Power(% Load)='; sAux=strcat(sAux, num2str(FirstOrderPoly_PE_Fit.p1)); sAux=strcat(sAux, '*% Load'); sAux=strcat(sAux, '+'); sAux=strcat(sAux, num2str(FirstOrderPoly_PE_Fit.p2)); title(sAux); 
%% GNL Fit
figure(3);
[FirstOrderPoly_GNL_Fit, FirstOrderPoly_GNL_Fit_Gof] = create_FirstOrderPoly_GNL_Fit_JENBACHER_JMS412GS_50Hz(input_data, GNL_output_data);
xlabel('% Load'); 
sAux='Liqued Natural Gas ['; sAux=strcat(sAux, JENBACHER_JMS412GS_50Hz.GNL_EU); sAux=strcat(sAux, ']'); ylabel(sAux); 
sAux='Liqued Natural Gas(% Load)='; sAux=strcat(sAux, num2str(FirstOrderPoly_GNL_Fit.p1)); sAux=strcat(sAux, '*% Load'); sAux=strcat(sAux, '+'); sAux=strcat(sAux, num2str(FirstOrderPoly_GNL_Fit.p2)); title(sAux); 
%% RE Fit
figure(4);
[FirstOrderPoly_RE_Fit, FirstOrderPoly_RE_Fit_Gof] = create_FirstOrderPoly_RE_Fit_JENBACHER_JMS412GS_50Hz(input_data, RE_output_data);
xlabel('% Load'); 
sAux='Performance ['; sAux=strcat(sAux, JENBACHER_JMS412GS_50Hz.RE_EU); sAux=strcat(sAux, ']'); ylabel(sAux); 
sAux='Performance(% Load)='; sAux=strcat(sAux, num2str(FirstOrderPoly_RE_Fit.p1)); sAux=strcat(sAux, '*% Load'); sAux=strcat(sAux, '+'); sAux=strcat(sAux, num2str(FirstOrderPoly_RE_Fit.p2)); title(sAux); 
%% FGE Fit
figure(5);
[FirstOrderPoly_FGE_Fit, FirstOrderPoly_FGE_Fit_Gof] = create_FirstOrderPoly_FGE_Fit_JENBACHER_JMS412GS_50Hz(input_data, FGE_output_data);
xlabel('% Load'); 
sAux='Flow GE ['; sAux=strcat(sAux, JENBACHER_JMS412GS_50Hz.FGE_EU); sAux=strcat(sAux, ']'); ylabel(sAux); 
sAux='Flow GE(% Load)='; sAux=strcat(sAux, num2str(FirstOrderPoly_FGE_Fit.p1)); sAux=strcat(sAux, '*% Load'); sAux=strcat(sAux, '+'); sAux=strcat(sAux, num2str(FirstOrderPoly_FGE_Fit.p2)); title(sAux); 
%% T Fit
figure(6);
[FirstOrderPoly_T_Fit, FirstOrderPoly_T_Fit_Gof] = create_FirstOrderPoly_T_Fit_JENBACHER_JMS412GS_50Hz(input_data, T_output_data);
xlabel('% Load'); 
sAux='Engine Temperature['; sAux=strcat(sAux, JENBACHER_JMS412GS_50Hz.T_EU); sAux=strcat(sAux, ']'); ylabel(sAux); 
sAux='Engine Temperature(% Load)='; sAux=strcat(sAux, num2str(FirstOrderPoly_T_Fit.p1)); sAux=strcat(sAux, '*% Load'); sAux=strcat(sAux, '+'); sAux=strcat(sAux, num2str(FirstOrderPoly_T_Fit.p2)); title(sAux); 
%% PHT Fit
figure(7);
[FirstOrderPoly_PHT_Fit, FirstOrderPoly_PHT_Fit_Gof] = create_FirstOrderPoly_PHT_Fit_JENBACHER_JMS412GS_50Hz(input_data, PHT_output_data);
xlabel('% Load'); 
sAux='HT Power['; sAux=strcat(sAux, JENBACHER_JMS412GS_50Hz.PHT_EU); sAux=strcat(sAux, ']'); ylabel(sAux); 
sAux='HT Power(% Load)='; sAux=strcat(sAux, num2str(FirstOrderPoly_PHT_Fit.p1)); sAux=strcat(sAux, '*% Load'); sAux=strcat(sAux, '+'); sAux=strcat(sAux, num2str(FirstOrderPoly_PHT_Fit.p2)); title(sAux); 
%% User Interface:
disp('Interpolated 1st Order Polynomial Three-Point Model for JENBACHER - JMS412GS - 50Hz Gas Engine'),
usrBtn = 1;
while usrBtn
usrLoad=input('Enter the % Load= ');
usrPM=polyval([FirstOrderPoly_PM_Fit.p1 FirstOrderPoly_PM_Fit.p2], usrLoad);
sAux='Mechanical Power ('; 
sAux=strcat(sAux, num2str(usrLoad)); 
sAux=strcat(sAux, '% Load)= ');
sAux=strcat(sAux, num2str(usrPM));
sAux=strcat(sAux, ' [');
sAux=strcat(sAux, JENBACHER_JMS412GS_50Hz.PM_EU);
sAux=strcat(sAux, ']');
disp(sAux);
usrPE=polyval([FirstOrderPoly_PE_Fit.p1 FirstOrderPoly_PE_Fit.p2], usrLoad);
sAux='Electrical Power ('; 
sAux=strcat(sAux, num2str(usrLoad)); 
sAux=strcat(sAux, '% Load)= ');
sAux=strcat(sAux, num2str(usrPE));
sAux=strcat(sAux, ' [');
sAux=strcat(sAux, JENBACHER_JMS412GS_50Hz.PE_EU);
sAux=strcat(sAux, ']');
disp(sAux);
usrGNL=polyval([FirstOrderPoly_GNL_Fit.p1 FirstOrderPoly_GNL_Fit.p2], usrLoad);
sAux='Liqued Natural Gas ('; 
sAux=strcat(sAux, num2str(usrLoad)); 
sAux=strcat(sAux, '% Load)= ');
sAux=strcat(sAux, num2str(usrGNL));
sAux=strcat(sAux, ' [');
sAux=strcat(sAux, JENBACHER_JMS412GS_50Hz.GNL_EU);
sAux=strcat(sAux, ']');
disp(sAux);
usrRE=polyval([FirstOrderPoly_RE_Fit.p1 FirstOrderPoly_RE_Fit.p2], usrLoad);
sAux='Performance ('; 
sAux=strcat(sAux, num2str(usrLoad)); 
sAux=strcat(sAux, '% Load)= ');
sAux=strcat(sAux, num2str(usrRE));
sAux=strcat(sAux, ' [');
sAux=strcat(sAux, JENBACHER_JMS412GS_50Hz.RE_EU);
sAux=strcat(sAux, ']');
disp(sAux);
usrFGE=polyval([FirstOrderPoly_FGE_Fit.p1 FirstOrderPoly_FGE_Fit.p2], usrLoad);
sAux='Flow GE ('; 
sAux=strcat(sAux, num2str(usrLoad)); 
sAux=strcat(sAux, '% Load)= ');
sAux=strcat(sAux, num2str(usrFGE));
sAux=strcat(sAux, ' [');
sAux=strcat(sAux, JENBACHER_JMS412GS_50Hz.FGE_EU);
sAux=strcat(sAux, ']');
disp(sAux);
usrT=polyval([FirstOrderPoly_T_Fit.p1 FirstOrderPoly_T_Fit.p2], usrLoad);
sAux='Engine Temperature ('; 
sAux=strcat(sAux, num2str(usrLoad)); 
sAux=strcat(sAux, '% Load)= ');
sAux=strcat(sAux, num2str(usrT));
sAux=strcat(sAux, ' [');
sAux=strcat(sAux, JENBACHER_JMS412GS_50Hz.T_EU);
sAux=strcat(sAux, ']');
disp(sAux);
usrPHT=polyval([FirstOrderPoly_PHT_Fit.p1 FirstOrderPoly_PHT_Fit.p2], usrLoad);
sAux='Engine Temperature ('; 
sAux=strcat(sAux, num2str(usrLoad)); 
sAux=strcat(sAux, '% Load)= ');
sAux=strcat(sAux, num2str(usrPHT));
sAux=strcat(sAux, ' [');
sAux=strcat(sAux, JENBACHER_JMS412GS_50Hz.PHT_EU);
sAux=strcat(sAux, ']');
disp(sAux);
usrBtn=input('Continue? Press [Y/n + Enter]... ', 's'); 
if usrBtn ~= 'Y'
    break
end
end,
%%
return
