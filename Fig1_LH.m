% For details, refer to Shao et al. Psilocybin induces rapid and
% persistent growth of dendritic spines in frontal cortex in vivo. 
% Neuron (2021).
% https://doi.org/10.1016/j.neuron.2021.06.008
%
% Figure 1C-1E
% Effects of psilocybin on learned helplessness
%
% Authors: Clara Liao & Alex Kwan

clear all;
close all;

%% Set up plotting parameters
set(groot, ...
    'DefaultFigureColor', 'w', ...
    'DefaultAxesLineWidth', 2, ...
    'DefaultAxesXColor', 'k', ...
    'DefaultAxesYColor', 'k', ...
    'DefaultAxesFontUnits', 'points', ...
    'DefaultAxesFontSize', 18, ...
    'DefaultAxesFontName', 'Helvetica', ...
    'DefaultLineLineWidth', 1, ...
    'DefaultTextFontUnits', 'Points', ...
    'DefaultTextFontSize', 18, ...
    'DefaultTextFontName', 'Helvetica', ...
    'DefaultAxesBox', 'off', ...
    'DefaultAxesTickLength', [0.02 0.025],...
    'DefaultLineLineWidth',3);

green = [0 200 0]./255;
grey = [169 169 169]./255;
red =  [255 0 0]./255;
yellow = [255 230 51]./255;
blue = [0 0 255]./255;
orange = [255 140 0]./255;

%% Organize data
% Number of escape failures and escape latency
% Test 3 occurred the day after Test 2, with intention to determine whether
% learned helplessness results are repeatable in the same mouse

%Saline pre (test1); saline post (test2); saline test 3
SalFail = [7 30 30 23 17 28 26 26 18 22 25 8 25 14 3 25 27 27 10 4 20 20; 0 28 29 27 8 25 26 30 12 19 17 24 28 15 0 21 30 28 9 10 7 24; 2 19 27 25 3 30 26 30 15 12 15 10 20 12 0 12 1 26 4 8 3 22];
SalFail = (SalFail/30)*100;  %convert # failures to probability of failure
SalFail1 = (SalFail(1,:)); %65.9
SalFail2 = (SalFail(2,:)); %63.2
SalFail3 = (SalFail(3,:)); %48.8

SalLat = [4.82 10 10 4.9 6.04 7.08 6.54 7.21 4.58 4.29 6.88 4.19 5.28 3.54 3.83 4.88 7.78 5.01 5.65 3.72 6.36 6.02; 3.12 6.41 8.07 7.16 3.94 5.28 5.1 10 4.25 4.52 7.13 3.57 6.64 3.9 3.61 5.28 10 6.85 5.78 5.64 4.24 6.3; 3.16 6.41 7.83 7.23 2.76 10 4.72 10 4.34 4.44 4.95 3.58 5.48 5.27 3.49 4.62 8.26 6.54 5.1 4.31 5.93 5.99];
SalLat1 = (SalLat(1,:)); %5.8455
SalLat2 = (SalLat(2,:)); %5.7632
SalLat3 = (SalLat(3,:)); %5.6550

SalSex = [zeros(1,9) ones(1,8) 0 1 0 0 1];  %12 M, 10 F

%Psilocybin pre (test1); Psilocybin post (test2); Psilocybin test 3
PsiFail = [13 24 21 25 24 11 21 23 0 21 2 23 13 20 6 29 12 29 28 16 29 30 30 27; 4 24 8 22 20 11 18 15 1 21 1 22 10 1 8 28 7 29 14 12 30 30 23 21; 16 25 13 8 30 6 9 14 0 22 1 26 8 2 7 2 7 29 19 11 30 26 21 17];
PsiFail = (PsiFail/30)*100;
PsiFail1 = (PsiFail(1,:)); %66.3
PsiFail2 = (PsiFail(2,:)); %52.8
PsiFail3 = (PsiFail(3,:)); %48.5

PsiLat = [4.51 5.81 5.82 5.97 5.32 5.07 5.32 5.91 1.95 4.08 4.13 2.8 5.28 7.65 6.77 6.88 6.49 5.53 6.68 5.28 4.06 10 10 7.41 ; 4.61 6.62 4.07 7.73 6.38 2.33 6.34 6.42 2.52 6.3 4.93 2.47 4.21 5.45 4.59 7.22 4.38 7.67 7.41 5.74 10 10 6.5 7.93; 4.98 7.01 5.31 5.72 10 3.19 4.9 5.6 2.46 6.92 3.59 3.16 5.05 5.19 4.59 6.93 5.29 7.89 5.8 4.92 10 4.15 5.93 6.86];
PsiLat1 = (PsiLat(1,:)); %5.7800
PsiLat2 = (PsiLat(2,:)); %5.9092
PsiLat3 = (PsiLat(3,:)); %5.6433

PsiSex = [zeros(1,8) ones(1,8) 0 0 1 1 0 0 1 1];  %12 M, 12 F

%Ketamine pre (test1) ; Ketamine post (test2); Ketamine test 3
KetFail = [17 27 30 29 24 3 22 30 16 29 13 28 1 13 25 16 10 27 29 20 4 20; 10 21 29 27 30 3 12 28 17 28 5 24 2 1 27 7 1 29 30 22 12 14; 9 27 27 30 29 9 24 22 14 16 8 25 1 3 9 4 5 30 22 15 4 14];
KetFail = KetFail/30*100;
KetFail1 = (KetFail(1,:)); %65.6
KetFail2 = (KetFail(2,:)); %57.4
KetFail3 = (KetFail(3,:)); %52.6

%Ket latency pre (test1); test 2; test 3
KetLat = [6.52 5.25 10 8.99 6.49 4.4 8.56 10 5.13 4.85 3.22 6.64 3.34 6.52 4.93 5.9 5.13 8 4.5 6.82 4.29 7.44; 6.21 7.65 8.7 4.86 10 3.48 7.66 7.16 5.76 7.58 2.86 5.92 3.81 4.52 6.24 5.1 3.82 7.73 10 6.79 5.5 6.97; 2.84 8.37 9.03 10 5.75 4.42 8.61 6.26 4.35 4.97 3.21 3.37 3.15 4.07 5.91 4.23 5.04 10 7 6.66 5.5 5.23];
KetLat1 = (KetLat(1,:)); %6.2236
KetLat2 = (KetLat(2,:)); %6.2873
KetLat3 = (KetLat(3,:)); %5.8168

KetSex = [zeros(1,7) ones(1,8) 0 1 0 0 1 1 1];  %10 M, 12 F

%% K-means clustering to classify resilient vs susceptible animals

%Failure to escape and latency
t1fail= [SalFail1 PsiFail1 KetFail1]';
t1lat = [SalLat1 PsiLat1 KetLat1]';
t1 = [t1fail t1lat];

%Kmeans - run many replicates to make sure we get the optimal clustering
[idx, C, ~, ~] = kmeans(t1, 2,'MaxIter',100,'Replicates',1000);

%Make sure index=1 is susceptible, with centroid on the high failure side
if C(2,1)>C(1,1)
    idxNew(idx==1) = 2;
    idxNew(idx==2) = 1;
    idx = idxNew;
end

%Plot clustering results
figure; hold on;
plot(t1(idx==1,1),t1(idx==1,2),'o', 'MarkerEdgeColor', [0 0 0], 'MarkerSize',14,'LineWidth',2);
plot(t1(idx==2,1),t1(idx==2,2),'x','MarkerFaceColor',[0 0 0], 'MarkerEdgeColor', [0 0 0], 'MarkerSize',14,'LineWidth',2);
plot(C(:,1),C(:,2),'*','MarkerFaceColor',green, 'MarkerEdgeColor', green, 'MarkerSize',14,'LineWidth',2);
legend('Susceptible','Resilient','Centroids',...
       'Location','NW')
xlabel 'Escape failure (%)';
ylabel 'Escape latency (s)'; 
xlim([0 100]);
ylim([0 10]);
axis square;

set(gcf,'position',[10,10,400 400]);
saveas(gcf,'FigS1A.png');
saveas(gcf,'FigS1A.fig');
print -depsc2 -painters FigS1A.eps

% Separate the classification to the different treatments
SalIdx = idx(1:numel(SalFail1));
PsiIdx = idx(numel(SalFail1)+1:numel(SalFail1)+numel(PsiFail1));
KetIdx = idx(numel(SalFail1)+numel(PsiFail1)+1:end);

%% Paired T-test: Are Test 1 & Test 2  different within respective drug treatment groups? (before and after drug)

% Escape failures
[~,p] = ttest(SalFail1, SalFail2) %p = 0.5391
[~,p] = ttest(PsiFail1, PsiFail2) %p = 0.0012
[~,p] = ttest(KetFail1, KetFail2) %p = 0.0429

% Same but susceptible animals only
[~,p] = ttest(SalFail1(SalIdx==1), SalFail2(SalIdx==1)) %p = 0.2936
[~,p] = ttest(PsiFail1(PsiIdx==1), PsiFail2(PsiIdx==1)) %p = 0.0051
[~,p] = ttest(KetFail1(KetIdx==1), KetFail2(KetIdx==1)) %p = 0.2412

%% ANOVA: Is there difference across treatment conditions?

% Susceptible animals only
data = [SalFail2(SalIdx==1)-SalFail1(SalIdx==1) PsiFail2(PsiIdx==1)-PsiFail1(PsiIdx==1) KetFail2(KetIdx==1)-KetFail1(KetIdx==1)]; 

drug = [zeros(size(SalFail1(SalIdx==1))) ones(size(PsiFail1(PsiIdx==1))) 2*ones(size(KetFail1(KetIdx==1)))];
sex = [SalSex(SalIdx==1) PsiSex(PsiIdx==1) KetSex(KetIdx==1)];

p = anovan(data(:), {drug(:) sex(:)},'model','interaction','varnames',{'drug', 'sex'});
% drug, p = 0.0946
% sex, p = 0.5847
% drug*sex, p = 0.4772

%% Plot - all animals

clear h;
figure; hold on;

for j=1:3
    switch j
        case 1
            data = SalFail;
            dataIdx = SalIdx;
            dataSex = SalSex;
            x = [1 2]; col=grey;
        case 2
            data = PsiFail;
            dataIdx = PsiIdx;
            dataSex = PsiSex;
            x = [3 4]; col=red;
        case 3
            data = KetFail;
            dataIdx = KetIdx;
            dataSex = KetSex;
            x = [5 6]; col=yellow;
    end
    
    bar(x(1),mean(data(1,:)),'FaceColor',col);
    bar(x(2),mean(data(2,:)),'FaceColor',col);
    for k=1:size(data,2)
        if dataSex(k) == 0 && dataIdx(k) == 1   %male, susceptible
            h(1)=plot(x,data(1:2,k),'k-', 'MarkerSize', 12, 'LineWidth', 1.5, 'Color', blue);
        elseif dataSex(k) == 1 && dataIdx(k) == 1   %female, susceptible
            h(2)=plot(x,data(1:2,k),'k-', 'MarkerSize', 12, 'LineWidth', 1.5, 'Color', orange);
        elseif dataSex(k) == 0 && dataIdx(k) == 2   %male, resilient
            h(3)=plot(x,data(1:2,k),'k--', 'MarkerSize', 12, 'LineWidth', 1.5, 'Color', blue);
        elseif dataSex(k) == 1 && dataIdx(k) == 2   %female, resilient
            h(4)=plot(x,data(1:2,k),'k--', 'MarkerSize', 12, 'LineWidth', 1.5, 'Color', orange);
        end
    end
end
    
ylabel('Escape failure (%)');
xticks([1 2 3 4 5 6]); %tick mark position
labels = {'Test 1','Test 2','Test 1','Test 2','Test 1','Test 2'};
xticklabels(labels);
xlim([0 7]);

if numel(h)==4
    legend(h,{['Susceptible ' char(9794)],['Susceptible ' char(9792)],['Resilient ' char(9794)],['Resilient ' char(9792)]}, 'FontSize', 18, 'Location','NortheastOutside');
elseif numel(h)==2
    legend(h,{['Susceptible ' char(9794)],['Susceptible ' char(9792)]}, 'FontSize', 18, 'Location','NortheastOutside');
end
legend boxoff;

set(gcf,'position',[10,10,700,400]);
saveas(gcf,'Fig1D.png');
saveas(gcf,'Fig1D.fig');
print -depsc2 -painters Fig1D.eps

%% Plot difference - susceptible animals only

clear h;
figure; hold on;

for j=1:3
    switch j
        case 1
            data = SalFail(:,SalIdx==1);
            dataSex = SalSex(SalIdx==1);
            x = 1; col=grey;
        case 2
            data = PsiFail(:,PsiIdx==1);
            dataSex = PsiSex(PsiIdx==1);
            x = 2.5; col=red;
        case 3
            data = KetFail(:,KetIdx==1);
            dataSex = KetSex(KetIdx==1);
            x = 4; col=yellow;
    end
    
    bar(x,mean(data(2,:)-data(1,:)),'FaceColor',col);
    for k=1:size(data,2)
        if dataSex(k) == 0      %male, susceptible
            h(1)=plot(x+0.5*rand-0.25,data(2,k)-data(1,k),'ko', 'MarkerSize', 12, 'LineWidth', 1.5, 'Color', blue);
        elseif dataSex(k) == 1  %female, susceptible
            h(2)=plot(x+0.5*rand-0.25,data(2,k)-data(1,k),'ko', 'MarkerSize', 12, 'LineWidth', 1.5, 'Color', orange);
        end
    end
end
    
ylabel('Change in escape failure (%)');
xticks([1 2.5 4]); %tick mark position
labels = {'Saline','Psilocybin','Ketamine'};
xticklabels(labels);
xlim([0 5]);

legend(h,{['Susceptible ' char(9794)],['Susceptible ' char(9792)]}, 'FontSize', 18, 'Location','NortheastOutside');
legend boxoff;

set(gcf,'position',[10,10,700,400]);
saveas(gcf,'Fig1E.png');
saveas(gcf,'Fig1E.fig');
print -depsc2 -painters Fig1E.eps

