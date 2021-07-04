% For details, refer to Shao et al. Psilocybin induces rapid and
% persistent growth of dendritic spines in frontal cortex in vivo. 
% Neuron (2021).
% https://doi.org/10.1016/j.neuron.2021.06.008
%
% Figure 1A-1B
% Psilocybin-induced head-twitch response
%
% Authors: Clara Liao & Alex Kwan

clear all;
close all;

%% set up plotting
set(groot, ...
    'DefaultFigureColor', 'w', ...
    'DefaultAxesLineWidth', 2, ...
    'DefaultAxesXColor', 'k', ...
    'DefaultAxesYColor', 'k', ...
    'DefaultAxesFontUnits', 'points', ...
    'DefaultAxesFontSize', 20, ...
    'DefaultAxesFontName', 'Helvetica', ...
    'DefaultLineLineWidth', 1, ...
    'DefaultTextFontUnits', 'Points', ...
    'DefaultTextFontSize', 20, ...
    'DefaultTextFontName', 'Helvetica', ...
    'DefaultAxesBox', 'off', ...
    'DefaultAxesTickLength', [0.02 0.025],...
    'DefaultLineLineWidth',3);

% set the tickdirs to go out - need to run these lines in this specific order
set(groot, 'DefaultAxesTickDir', 'out');
set(groot, 'DefaultAxesTickDirMode', 'manual');
set(0,'defaultfigureposition',[30 30 600 400]);

%% head-twitch response counted manually from videos
% 

% Cohort 1, 07-03-2020
% Computer was not ideal for the recordings, leading to frequent crashes in
% MATLAB and need to restart, therefore session may consist of multiple
% video clips

l = 1;
data.dose(l) = 0;   %saline
data.sex{l} = 'Female';
data.HTRtimes{l} = [4*60+38]; %HTR times are based on timestamps %HTR count = 1

l = l+1;
data.dose(l) = 0;
data.sex{l} = 'Female';
data.HTRtimes{l} = [];
data.HTRtimes{l} = [data.HTRtimes{l} 52 + [27 180+15 180+16 480+25]]; %HTR count = 4

l = l+1;
data.dose(l) = 2;   %2 mg/kg
data.sex{l} = 'Female';
data.HTRtimes{l} = [50];
data.HTRtimes{l} = [data.HTRtimes{l} 52 + [48 60+28 120+9 120+24 180+23 180+57 240+25 240+56 ...
    300+22 300+42 360+1 360+29 420+12 420+42 480+4 480+42 480+49]]; %HTR count = 18

l = l+1;
data.dose(l) = 0.25;
data.sex{l} = 'Female';
data.HTRtimes{l} = [39 60+17 120+56 180+19 240+10 420+6 420+13];

l = l+1;
data.dose(l) = 0;
data.sex{l} = 'Female';
data.HTRtimes{l} = [480+19];

l = l+1;
data.dose(l) = 1;
data.sex{l} = 'Male';
data.HTRtimes{l} = [180 240+6 300+22 300+48];

l = l+1;
data.dose(l) = 0;
data.sex{l} = 'Male';
data.HTRtimes{l} = [6 120+2];

l = l+1;
data.dose(l) = 0.5;
data.sex{l} = 'Female';
data.HTRtimes{l} = [60+38 60+43 120+4 120+36 180+10 180+32 300+24 360+36 420+27 540+29];

l = l+1;
data.dose(l) = 2;
data.sex{l} = 'Female';
data.HTRtimes{l} = [36 120+35 180+18 180+52 240+24 300+23 300+58 360+10 360+39 420+23 420+54 480+28 540+4 540+31];

l = l+1;
data.dose(l) = 0.25;
data.sex{l} = 'Female';
data.HTRtimes{l} = [120+48];

l = l+1;
data.dose(l) = 0.5;
data.sex{l} = 'Female';
data.HTRtimes{l} = [180+42];
data.HTRtimes{l} = [data.HTRtimes{l} 480+52 + [38]];

l = l+1;
data.dose(l) = 1;
data.sex{l} = 'Female';
data.HTRtimes{l} = [14 37];
data.HTRtimes{l} = [data.HTRtimes{l} 40 + [4 23 35 47 60+6 60+27 120+11 120+29 120+40]];
data.HTRtimes{l} = [data.HTRtimes{l} 40+(180+14) + [46 59 60+22 60+48]];
data.HTRtimes{l} = [data.HTRtimes{l} 40+(180+14)+(120+7) + [18]];
data.HTRtimes{l} = [data.HTRtimes{l} 40+(180+14)+(120+7)+(60+16) + [42 60+25]];

l = l+1;
data.dose(l) = 2;
data.sex{l} = 'Female';
data.HTRtimes{l} = [23];
data.HTRtimes{l} = [data.HTRtimes{l} 40 + [60+9 60+54 120+29 180+2]];
data.HTRtimes{l} = [data.HTRtimes{l} 40+(180+14) + [60+37]];
data.HTRtimes{l} = [data.HTRtimes{l} 40+(180+14)+(120+7) + [14]];
data.HTRtimes{l} = [data.HTRtimes{l} 40+(180+14)+(120+7)+(60+16) + [60+15]];

l = l+1;
data.dose(l) = 0.25;
data.sex{l} = 'Male';
data.HTRtimes{l} = [300+52 420+33 480+59];

l = l+1;
data.dose(l) = 2;
data.sex{l} = 'Male';
data.HTRtimes{l} = [60+12 120+36 180+57 300+2 360+9 420+4 420+43];

l = l+1;
data.dose(l) = 0.25;
data.sex{l} = 'Male';
data.HTRtimes{l} = [240+2 300+8];

l = l+1;
data.dose(l) = 0;
data.sex{l} = 'Male';
data.HTRtimes{l} = [49];

l = l+1;
data.dose(l) = 1;
data.sex{l} = 'Male';
data.HTRtimes{l} = [];
data.HTRtimes{l} = [data.HTRtimes{l} 18 + [60+28 180+41]];
data.HTRtimes{l} = [data.HTRtimes{l} 18+(240+7) + [19 33]];
data.HTRtimes{l} = [data.HTRtimes{l} 18+(240+7)+(55) + [15 46 60+24 120+23 180+15 180+50]];

l = l+1;
data.dose(l) = 2;
data.sex{l} = 'Male';
data.HTRtimes{l} = [];
data.HTRtimes{l} = [data.HTRtimes{l} 18 + [60+52 120+53 180+41]];
data.HTRtimes{l} = [data.HTRtimes{l} 18+(240+7) + [44]];
data.HTRtimes{l} = [data.HTRtimes{l} 18+(240+7)+(55) + [42 60+22 120+21 120+51 180+33 240+22]];

l = l+1;
data.dose(l) = 0.5;
data.sex{l} = 'Male';
data.HTRtimes{l} = [];
data.HTRtimes{l} = [data.HTRtimes{l} 28+(14) + [6 240+3]];
data.HTRtimes{l} = [data.HTRtimes{l} 28+(14)+(240+20) + [240+27 300+21]];

l = l+1;
data.dose(l) = 1;
data.sex{l} = 'Male';
data.HTRtimes{l} = [20];
data.HTRtimes{l} = [data.HTRtimes{l} 28+(14) + [44 120+20 180+10 180+26]];
data.HTRtimes{l} = [data.HTRtimes{l} 28+(14)+(240+20) + [0.28 0.23 300 300+48]]; %0.28?

l = l+1;
data.dose(l) = 0.5;
data.sex{l} = 'Male';
data.HTRtimes{l} = [0.48 300+2 540+6];

l = l+1;
data.dose(l) = 2;
data.sex{l} = 'Male';
data.HTRtimes{l} = [180+26 240+40 300+47 420+54 480+55];

l = l+1;
data.dose(l) = 0.25;
data.sex{l} = 'Female';
data.HTRtimes{l} = [60+55 540+15];

l = l+1;
data.dose(l) = 2;
data.sex{l} = 'Female';
data.HTRtimes{l} = [32 60+55 180+11 180+47 300+10 300+46 360+43 420+55 480+54];

l = l+1;
data.dose(l) = 0.25;
data.sex{l} = 'Female';
data.HTRtimes{l} = [];
data.HTRtimes{l} = [data.HTRtimes{l} 60+59 + [60+30 240+49 300+40]];
data.HTRtimes{l} = [data.HTRtimes{l} 60+59+(360+28) + [42]];

l = l+1;
data.dose(l) = 0.5;
data.sex{l} = 'Female';
data.HTRtimes{l} = [];
data.HTRtimes{l} = [data.HTRtimes{l} 60+59+(360+28) + [47]];

l = l+1;  
data.dose(l) = 0.25;
data.sex{l} = 'Male';
data.HTRtimes{l} = [60+39 120+5 180+5 240+28 360+39];
data.HTRtimes{l} = [data.HTRtimes{l} 420+48 + [20]];

l = l+1;  
data.dose(l) = 0.5;
data.sex{l} = 'Male';
data.HTRtimes{l} = [300+12 300+13];

l = l+1;
data.dose(l) = 0.5;
data.sex{l} = 'Female';
data.HTRtimes{l} = [120+16 120+20 180+31 240+23 300+17 420+52 480+17 540+24];

l = l+1;
data.dose(l) = 1;
data.sex{l} = 'Female';
data.HTRtimes{l} = [180+23 240+51 420+2 420+3 420+37 480+34 540+30];

l = l+1;  
data.dose(l) = 1;
data.sex{l} = 'Female';
data.HTRtimes{l} = [120+1];
data.HTRtimes{l} = [data.HTRtimes{l} 120+37 + [21 49 60+28 60+44 120+6 180+25 180+43 240+9 240+40 ...
    300+3 300+28 360+6 420+1]];

l = l+1;  
data.dose(l) = 0;
data.sex{l} = 'Female';
data.HTRtimes{l} = []; 

l = l+1;  
data.dose(l) = 1;
data.sex{l} = 'Male';
data.HTRtimes{l} = [120+10 180+8 180+32 240 240+38 300+7 300+16];
data.HTRtimes{l} = [data.HTRtimes{l} 360+17 + [41 60+18 60+59 120+32 180+12]];

l = l+1;  
data.dose(l) = 0;
data.sex{l} = 'Male';
data.HTRtimes{l} = [60+3];

% Cohort 2, 01-02-2021
% new computer, video recorded at full length without crashing
%
% side 1 vs 2 - the open-field arena was divided into 2 sides, each with
% one mouse. See Supplementary Video.

%File 1, side 1
l = l+1;
data.dose(l) = 0.25;
data.sex{l} = 'Male';
data.HTRtimes{l} = [44 58 120+32 360+7 420+47 480+39];

%File 2, side 1
l = l+1;  
data.dose(l) = 1;
data.sex{l} = 'Male';
data.HTRtimes{l} = [57 120+29 120+41 180+13 180+34 240+16 240+29 240+46 300+2 300+13 300+35 360+5 360+18 360+36 360+46 420+12 420+25 420+55 420+59 480+39 540+13 540+19 540+32 540+47];

%File 3, side 1
l = l+1;
data.dose(l) = 0;
data.sex{l} = 'Female';
data.HTRtimes{l} = [60+40 350+9];

%File 4+5, side 1 
l = l+1;  
data.dose(l) = 1;
data.sex{l} = 'Female';
data.HTRtimes{l} = [240+57 300+6 300+24 5 60+51 180+7]; 

%File 6, side 1
l = l+1;
data.dose(l) = 0.5;
data.sex{l} = 'Female';
data.HTRtimes{l} = [120+37 240+2 360 540+15];

%File 7, side 1
l = l+1;  
data.dose(l) = 0;
data.sex{l} = 'Female';
data.HTRtimes{l} = [60+36 180+19 480+57];

%File 8, side 1
l = l+1;
data.dose(l) = 0.5;
data.sex{l} = 'Female';
data.HTRtimes{l} = [44 60+27 240+44 240+48 420+01 480+38 540+40];

%File 9, side 1
l = l+1;  
data.dose(l) = 1;
data.sex{l} = 'Female';
data.HTRtimes{l} = [60+26 60+51 120+38 180+11 240+07 240+23 300+09 300+39 360+46 420+48 480+17 480+39 540+14 540+48];

%File 10, side 1
l = l+1;
data.dose(l) = 0.5;
data.sex{l} = 'Male';
data.HTRtimes{l} = [];

%File 11, side 1
l = l+1;  
data.dose(l) = 0;
data.sex{l} = 'Male';
data.HTRtimes{l} = [];

%File 1, side 2
l = l+1;
data.dose(l) = 0;
data.sex{l} = 'Male';
data.HTRtimes{l} = [];

%File 2, side 2
l = l+1;  
data.dose(l) = 2;
data.sex{l} = 'Male';
data.HTRtimes{l} = [180+11 360+22 360+47 420+12 480+49 540+34]; 

%File 3, side 2
l = l+1;
data.dose(l) = 0.25;
data.sex{l} = 'Female';
data.HTRtimes{l} = [60+08 480+17];

%File 4 + 5, side 2 
l = l+1;  
data.dose(l) = 2;
data.sex{l} = 'Female';
data.HTRtimes{l} = [8 24 120+12 120+49 240+02 240+36 300+31 300+47 60+06 180+04]; 

%File 6, side 2
l = l+1;  
data.dose(l) = 0.5;
data.sex{l} = 'Male';
data.HTRtimes{l} = [120+14 300+59 420+07 480+48]; 

%File 7, side 2
l = l+1;
data.dose(l) = 0.25;
data.sex{l} = 'Female';
data.HTRtimes{l} = [240+07 260+49];

%File 8, side 2
l = l+1;  
data.dose(l) = 2;
data.sex{l} = 'Female';
data.HTRtimes{l} = [120+04 120+51 300+05 300+27 300+45 360+35 360+42 420+28 420+41 480+34 480+52 540+17 540+34 600]; 

%File 9, side 2
l = l+1;
data.dose(l) = 1;
data.sex{l} = 'Male';
data.HTRtimes{l} = [180+26 240+02 240+32 300+02 360+01 360+31 360+40 420+03 420+47 540+31];

%File 10, side 2
l = l+1;  
data.dose(l) = 2;
data.sex{l} = 'Male';
data.HTRtimes{l} = [53 180+25 240+09 240+20 300+07 300+34 360+05 360+17 360+53 420+24 480+18 540+26 540+46, 600]; %no HTR counts

%File 11, side 2
l = l+1;
data.dose(l) = 0.25;
data.sex{l} = 'Male';
data.HTRtimes{l} = [];

%File 12, side 1
l = l+1;  
data.dose(l) = 0;
data.sex{l} = 'Female';
data.HTRtimes{l} = [16 60+24 300+23];

%File 13, side 1
l = l+1;
data.dose(l) = 0;
data.sex{l} = 'Female';
data.HTRtimes{l} = [52 540+25];

%File 14, side 1 
l = l+1;  
data.dose(l) = 0.5;
data.sex{l} = 'Female';
data.HTRtimes{l} = [2 120+38 240+19 300+18 540+24]; 

%File 15, side 1
l = l+1;
data.dose(l) = 2;
data.sex{l} = 'Male';
data.HTRtimes{l} = [18 120+15 120+30 120+40 240+47 300+11 300+23 300+45 300+48 360+27 420+17 420+40 480+43 540 540+22 540+45];

%File 16, side 1
l = l+1;  
data.dose(l) = 0;
data.sex{l} = 'Male';
data.HTRtimes{l} = [120+48];

%File 17, side 1
l = l+1;  
data.dose(l) = 0.25;
data.sex{l} = 'Female';
data.HTRtimes{l} = [60+38 300+21];

%File 18, side 1
l = l+1;
data.dose(l) = 1;
data.sex{l} = 'Male';
data.HTRtimes{l} = [120+15 120+59 240+32 240+33 300+16 360+29 360+46 420+23 480+13 480+29 540+8 540+29 540+42];

%File 19, side 1
l = l+1;  
data.dose(l) = 2;
data.sex{l} = 'Male';
data.HTRtimes{l} = [60+17 180+15 300+57 360+7 360+50 420+25 480+8 480+30 540 540+36 600]

%File 20, side 1
l = l+1;
data.dose(l) = 0.25;
data.sex{l} = 'Male';
data.HTRtimes{l} = [24 180+47 360+35 420+40 540+17];

%File 21, side 1
l = l+1;  
data.dose(l) = 0.25;
data.sex{l} = 'Male';
data.HTRtimes{l} = [1+06 120+52 180+14 240+43 300+40 480+24 480+56];

%File 22, side 1
l = l+1;  
data.dose(l) = 1;
data.sex{l} = 'Male';
data.HTRtimes{l} = [40 120+38 120+57 180+35 240+7 240+49 300+34 360+7 360+14 360+32 360+49 360+56 420+25 420+47 480+10 480+35 540+3 540+33];

%File 23, side 1
l = l+1;  
data.dose(l) = 1;
data.sex{l} = 'Female';
data.HTRtimes{l} = [60+52 180+9 240+8 240+45 300+13 300+50 360+42 420+14 480+29 480+44];

%File 24, side 1
l = l+1;  
data.dose(l) = 0;
data.sex{l} = 'Male';
data.HTRtimes{l} = [60+13 540+14 540+56];

%File 25, side 1
l = l+1;  
data.dose(l) = 1;
data.sex{l} = 'Female';
data.HTRtimes{l} = [25 60+55 300+7 360+44 480];

%File 12, side 2
l = l+1;  
data.dose(l) = 0.25;
data.sex{l} = 'Female';
data.HTRtimes{l} = [60+22 180+53 300+56 360+14 360+44 480+10 480+50 540+23];

%File 13, side 2
l = l+1;
data.dose(l) = 0.25;
data.sex{l} = 'Female';
data.HTRtimes{l} = [60+50 360+47 540+21];

%File 14, side 2
l = l+1;  
data.dose(l) = 0.5;
data.sex{l} = 'Male';
data.HTRtimes{l} = [1+25, 180+5 480+30 540+49]; 

%File 15, side 2
l = l+1;
data.dose(l) = 2;
data.sex{l} = 'Male';
data.HTRtimes{l} = [35 120+43 240+40 300+2 300+31 300+54 360+30 420+21 420+53 540+7 540+35 ];

%File 16, side 2
l = l+1;  
data.dose(l) = 0;
data.sex{l} = 'Male';
data.HTRtimes{l} = [360+50 420+6 540+33];

%File 17, side 2
l = l+1;  
data.dose(l) = 0.25;
data.sex{l} = 'Female';
data.HTRtimes{l} = [300+6 360+42 540+2];

%File 18, side 2
l = l+1;
data.dose(l) = 0.5;
data.sex{l} = 'Male';
data.HTRtimes{l} = [120+36 300+14 360+33 480+36 540+37];

%File 19, side 2
l = l+1;  
data.dose(l) = 0.5;
data.sex{l} = 'Male';
data.HTRtimes{l} = [60+46 180+3 300+6 360+20 480+5 540+43];

%File 20, side 2
l = l+1;
data.dose(l) = 0.5;
data.sex{l} = 'Female';
data.HTRtimes{l} = [420+26 480+43 540+49];

%File 21, side 2
l = l+1;  
data.dose(l) = 0.25;
data.sex{l} = 'Male';
data.HTRtimes{l} = [120+26 240+6 360+59 420+36 480+39];

%File 22, side 2
l = l+1;  
data.dose(l) = 1;
data.sex{l} = 'Male';
data.HTRtimes{l} = [180+18 240+43 240+59 300+50 360+7 360+58 420+53 480+36 540+17 540+56];

%File 23, side 2
l = l+1;  
data.dose(l) = 1;
data.sex{l} = 'Female';
data.HTRtimes{l} = [60+51 120+45 180+39 180+54 240+3 240+17];

%no side 2 in file 24

%File 25, side 2
l = l+1;  
data.dose(l) = 2;
data.sex{l} = 'Female';
data.HTRtimes{l} = [18 60+10 60+26 120+30 120+31 180+26 240+11 240+49 300+44 360+3 360+30 420+20 420+34 420+51 480 480+14 540+12 540+29 540+48];

%% Convert the head-twitch times to counts
numAnimal = numel(data.HTRtimes);

for l = 1:numAnimal
    data.HTRcount(l) = numel(data.HTRtimes{l});
end

%% Dose-response curve

doseRange = unique(data.dose);
for k = 1:numel(doseRange)
    index = (data.dose==doseRange(k) & ismember(data.sex,'Male'));
    
    dat(1).count{k} = data.HTRcount(index);
    datMean(k,1) = nanmean(dat(1).count{k});
    datSEM(k,1) = nanstd(dat(1).count{k})./sqrt(numel(dat(1).count{k}));

    index = (data.dose==doseRange(k) & ismember(data.sex,'Female'));
    
    dat(2).count{k} = data.HTRcount(index);
    datMean(k,2) = nanmean(dat(2).count{k});
    datSEM(k,2) = nanstd(dat(2).count{k})./sqrt(numel(dat(2).count{k}));
end

figure; hold on;
% male
shift=-0.03;
for k = 1:numel(doseRange)
    for kk = 1:numel(dat(1).count{k})
        plot(doseRange(k)+shift+0.1*rand-0.05,dat(1).count{k}(kk),'+','Color',[0 0 1],'LineWidth',2,'MarkerSize',12);
    end
    plot((doseRange(k)+shift)*[1 1],datMean(k,1)+datSEM(k,1)*[-1 1],'Color',[0 0 1],'LineWidth',3); %sem
end
h(1)=plot(doseRange+shift,datMean(:,1),'.-','Color',[0 0 1],'LineWidth',3,'MarkerSize',50); %mean
% female
shift=0.03;
for k = 1:numel(doseRange)
    for kk = 1:numel(dat(2).count{k})
        plot(doseRange(k)+shift+0.1*rand-0.05,dat(2).count{k}(kk),'^','Color',[1 0.5 0],'LineWidth',2,'MarkerSize',12);
    end
    plot((doseRange(k)+shift)*[1 1],datMean(k,2)+datSEM(k,2)*[-1 1],'Color',[1 0.5 0],'LineWidth',3); %sem
end
h(2)=plot(doseRange+shift,datMean(:,2),'.-','Color',[1 0.5 0],'LineWidth',3,'MarkerSize',50); %mean

xlabel('Dose (mg/kg)');
ylabel({'Head-twitch responses';'in 10 minutes'});
xticks(doseRange);
xlim([-0.1 2.1]);
ylim([0 20]);

legend(h,{'Male','Female'},'Location','Northwest');
legend boxoff;

saveas(gcf,'Fig1a.png');
saveas(gcf,'Fig1a.fig');
print -depsc2 -painters Fig1a.eps

%% ANOVA, two-factor

sexFactor = ismember(data.sex,'Female');  %0 if male, 1 if female

[p,t,stats,terms]=anovan(data.HTRcount,[data.dose' sexFactor'],'model','interaction','varnames',{'dose','sex'});

%% Numbers

disp(['Number of male mice: ' int2str(sum(ismember(data.sex,'Male')))]); %41
disp(['Number of female mice: ' int2str(sum(ismember(data.sex,'Female')))]); %41
 
disp(['p-value for dose: ' num2str(p(1))]);

%% Head-twich time course
load('HTR_timecourse.mat');

x=T(:,1);
y=T(:,2);

figure; hold on;
plot(x,y,'o','Color',[0.7 0.7 0.7],'LineWidth',2,'MarkerSize',12);
plot(x,smooth(y,5),'Color','k','LineWidth',3);
ylabel('Head-twitch responses (min^{-1})');
xlabel('Time (min)');

saveas(gcf,'Fig1b.png');
saveas(gcf,'Fig1b.fig');
print -depsc2 -painters Fig1b.eps