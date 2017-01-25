
%%
figure
QsdScoreRandom = [[resultRandomSummary{2,5:6}],[averageQsdRandom{2,1:4}]];
QsdScoreOriginal = [resultSummaryNseeds{2,5:10}];
QsdScoreTRBP = [resultSummaryTRBP{2,5:10}];
QsdScoreJordanCenter = [resultSummaryJordanCenter{2,5:10}];
QsdTick = [1 2 3 4 5 6];
axes('XTick',QsdTick);
hold
plot(QsdTick,QsdScoreRandom,'-+',QsdTick,QsdScoreOriginal,'-o',QsdTick,QsdScoreTRBP,'-x',QsdTick,QsdScoreJordanCenter,'-d')
legend('Randomly select a node as seed','Netsleuth','Modified TRBP','Jordan Center','Location','Southeast')
xlabel('Distance to true seeds')
ylabel('Percent of seeds within this distance')
%%
figure
seedsNum = 4;
QsdScoreRandom = [[resultRandomSummary{seedsNum+1,5:6}],[averageQsdRandom{seedsNum+1,1:4}]];
QsdScoreOriginal = [resultSummaryNseeds{seedsNum+1,5:10}];
QsdScoreJordanCenter = [resultSummaryJordanCenter{seedsNum+1,5:10}];
QsdTick = [1 2 3 4 5 6];
axes('XTick',QsdTick);
hold
plot(QsdTick,QsdScoreRandom,'-+',QsdTick,QsdScoreOriginal,'-o',QsdTick,QsdScoreJordanCenter,'-d')
legend('Randomly select a node as seed','Netsleuth','JSD + Jordan Center','Location','Southeast')
xlabel('Distance to true seeds')
ylabel('Percent of seeds within this distance')
%%
% for Qsd=1
figure
QsdScoreRandom = [resultRandomSummary{2:33,5}];
QsdScoreOriginal = [resultSummaryNseeds{2:33,5}];
QsdScoreJordanCenter = [resultSummaryJordanCenter{2:33,5}];
QsdTick = 1:32;
axes('XTick',QsdTick);
hold
plot(QsdTick,QsdScoreRandom,'-+',QsdTick,QsdScoreOriginal,'-o',QsdTick,QsdScoreJordanCenter,'-d')
legend('Randomly select a node as seed','Netsleuth','JSD + Jordan Center','Location','east')
xlabel('Number of seeds')
ylabel('Percent of seeds within 1 hop to true seeds');
%%
% for Qsd=2
figure
QsdScoreRandom = [resultRandomSummary{2:33,6}];
QsdScoreOriginal = [resultSummaryNseeds{2:33,6}];
QsdScoreJordanCenter = [resultSummaryJordanCenter{2:33,6}];
QsdTick = 1:32;
axes('XTick',QsdTick);
hold
plot(QsdTick,QsdScoreRandom,'-+',QsdTick,QsdScoreOriginal,'-o',QsdTick,QsdScoreJordanCenter,'-d')
legend('Randomly select a node as seed','Netsleuth','JSD + Jordan Center','Location','east')
xlabel('Number of seeds')
ylabel('Percent of seeds within 2 hop to true seeds');
%%
% for random Qmdl and Qjd
%%
figure
averageQjd = [resultRandomSummary{2:33,3}];
averageQjdNseeds = [resultSummaryNseeds{2:33,3}];
averageQjdJordanCenter = [resultSummaryJordanCenter{2:33,3}];
seedsNum = [resultRandomSummary{2:33,1}];
axes('XTick',seedsNum);
hold
plot(seedsNum,abs(averageQjd-1),'-+',seedsNum,abs(averageQjdNseeds-1),'-o',seedsNum,abs(averageQjdJordanCenter-1),'-d')
legend('Randomly select a node as seed','Netsleuth','JSD + Jordan Center','Location','East')
xlabel('Number of seeds')
ylabel('Average |Q_j_d-1|')
%% 
figure
averageQMdl = [resultRandomSummary{2:33,4}];
averageQMdlNseeds = [resultSummaryNseeds{2:33,4}];
averageQMdlJordanCenter = [resultSummaryJordanCenter{2:33,4}];
seedsNum = [resultRandomSummary{2:33,1}];
axes('XTick',seedsNum);
hold
plot(seedsNum,abs(averageQMdl-1),'-+',seedsNum,abs(averageQMdlNseeds-1),'-o',seedsNum,abs(averageQMdlJordanCenter-1),'-d')
legend('Randomly select a node as seed','Netsleuth','JSD + Jordan Center','Location','Northwest')
xlabel('Number of seeds')
ylabel('Average |Q_m_d_l-1|')
%% single seed box figure for Qjd
figure
boxplot([[resultRandom{2:501,5}]',[resultNSeedsOriginal{2:501,5}]',...
    [resultTRBP{2:501,5}]',[resultJordanCenter{2:501,5}]'],...
    'label',{'Randomly select','Netsleuth',...
    'Modified TRBP','Jordan Center'});
ylabel('Q_j_d')
refline([0 1]);
refline([0 0.9]);
refline([0 1.1]);
%% single seed box figure for Qmdl
figure
boxplot([[resultRandom{2:501,6}]',[resultNSeedsOriginal{2:501,6}]',...
    [resultTRBP{2:501,6}]',[resultJordanCenter{2:501,6}]'],...
    'label',{'Randomly select','Netsleuth',...
    'Modified TRBP','Jordan Center'});
ylabel('Q_m_d_l')
refline([0 1]);
%% Qjd
figure
QsdScoreRandom = [resultSummaryRandomInfectedNum{2:9,3}];
QsdScoreOriginal = [resultSummaryOriginalInfectedNum{2:9,3}];
QsdScoreTRBP = [resultSummaryTRBPInfectedNum{2:9,3}];
QsdScoreJordanCenter = [resultSummaryJordanCenterInfectedNum{2:9,3}];
QsdTick = 400:400:3200;
axes('XTick',QsdTick);
hold
plot(QsdTick,QsdScoreRandom,'-+',QsdTick,QsdScoreOriginal,'-o',QsdTick,QsdScoreTRBP,'-x',QsdTick,QsdScoreJordanCenter,'-d')
legend('Randomly select a node as seed','Netsleuth','Modified TRBP','Jordan Center','Location','east')
xlabel('Number of infected nodes')
ylabel('Q_j_d');
%% Qmdl
figure
QsdScoreRandom = [resultSummaryRandomInfectedNum{2:9,4}];
QsdScoreOriginal = [resultSummaryOriginalInfectedNum{2:9,4}];
QsdScoreTRBP = [resultSummaryTRBPInfectedNum{2:9,4}];
QsdScoreJordanCenter = [resultSummaryJordanCenterInfectedNum{2:9,4}];
QsdTick = 400:400:3200;
axes('XTick',QsdTick);
hold
plot(QsdTick,QsdScoreRandom,'-+',QsdTick,QsdScoreOriginal,'-o',QsdTick,QsdScoreTRBP,'-x',QsdTick,QsdScoreJordanCenter,'-d')
legend('Randomly select a node as seed','Netsleuth','Modified TRBP','Jordan Center','Location','east')
xlabel('Number of infected nodes')
ylabel('Q_m_d_l');
%% Qsd = 1
figure
QsdScoreRandom = [resultSummaryRandomInfectedNum{2:9,5}];
QsdScoreOriginal = [resultSummaryOriginalInfectedNum{2:9,5}];
QsdScoreTRBP = [resultSummaryTRBPInfectedNum{2:9,5}];
QsdScoreJordanCenter = [resultSummaryJordanCenterInfectedNum{2:9,5}];
QsdTick = 400:400:3200;
axes('XTick',QsdTick);
hold
plot(QsdTick,QsdScoreRandom,'-+',QsdTick,QsdScoreOriginal,'-o',QsdTick,QsdScoreTRBP,'-x',QsdTick,QsdScoreJordanCenter,'-d')
legend('Randomly select a node as seed','Netsleuth','Modified TRBP','Jordan Center','Location','east')
xlabel('Number of infected nodes')
ylabel('Percent of seeds within 1 hop to true seeds');
%% Qsd = 2
figure
QsdScoreRandom = [resultSummaryRandomInfectedNum{2:9,6}];
QsdScoreOriginal = [resultSummaryOriginalInfectedNum{2:9,6}];
QsdScoreTRBP = [resultSummaryTRBPInfectedNum{2:9,6}];
QsdScoreJordanCenter = [resultSummaryJordanCenterInfectedNum{2:9,6}];
QsdTick = 400:400:3200;
axes('XTick',QsdTick);
hold
plot(QsdTick,QsdScoreRandom,'-+',QsdTick,QsdScoreOriginal,'-o',QsdTick,QsdScoreTRBP,'-x',QsdTick,QsdScoreJordanCenter,'-d')
legend('Randomly select a node as seed','Netsleuth','Modified TRBP','Jordan Center','Location','east')
xlabel('Number of infected nodes')
ylabel('Percent of seeds within 2 hop to true seeds');
%% Qsd = 3
figure
QsdScoreRandom = [resultSummaryRandomInfectedNum{2:9,7}];
QsdScoreOriginal = [resultSummaryOriginalInfectedNum{2:9,7}];
QsdScoreTRBP = [resultSummaryTRBPInfectedNum{2:9,7}];
QsdScoreJordanCenter = [resultSummaryJordanCenterInfectedNum{2:9,7}];
QsdTick = 400:400:3200;
axes('XTick',QsdTick);
hold
plot(QsdTick,QsdScoreRandom,'-+',QsdTick,QsdScoreOriginal,'-o',QsdTick,QsdScoreTRBP,'-x',QsdTick,QsdScoreJordanCenter,'-d')
legend('Randomly select a node as seed','Netsleuth','Modified TRBP','Jordan Center','Location','east')
xlabel('Number of infected nodes')
ylabel('Percent of seeds within 3 hop to true seeds');