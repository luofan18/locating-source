tic
minInfected = 2000;
maxInfected = 4000;

poolNum = 16;

beta = 0.1;

binNum = 40;
[bins, binSize] = putTheNodeInBins(G,binNum);

repetitionTimes = 2000;
QjdTimes = 100;

maxSeedsNum = 1;
% batchNum better be something can divide repetitionTimes
batchNum = 8;

result2 = {'medianInfected','seeds', 'findSeeds', 'isCorrectSeedsNumber', 'QjdScore', 'QmdlScore', 'QsdScore1', 'QsdScore2'};
resultCursor = 2;
resultSummary2 = {'medianInfected', 'isCorrectSeedsNumberRate', 'averageQjd','averageQmdl', 'Qsd1Rate', 'Qsd2Rate'};
succeed = zeros(1,maxSeedsNum);
trials = zeros(1,maxSeedsNum);

seedsNum = 1;
maxSeedsNum = 3200/400;

% parfor j = 1:poolNum
for seedsNum = 1:maxSeedsNum
    % divide the repitition into different part, be something can be
    % diveded by repetition times
    minInfected = seedsNum * 400 - 200;
    maxInfected = seedsNum * 400 + 200;
    for i =1:batchNum
        j((seedsNum-1)*batchNum+i) = batch(@mainBodyTRBP,1,{G, 1, bins, binSize, binNum, beta,repetitionTimes/batchNum,QjdTimes,minInfected,maxInfected,allShortestPaths});
    end
end


for seedsNum = 1:maxSeedsNum
    for i =1:batchNum
        wait(j((seedsNum-1)*batchNum+i))
        newResult = fetchOutputs(j((seedsNum-1)*batchNum+i));
        result2 = vertcat(result2,newResult{:,:});
        delete(j((seedsNum-1)*batchNum+i));
    end
    isCorrectSeedsNumberRate = sum([result2{((seedsNum-1)*repetitionTimes+2):(seedsNum*repetitionTimes+1),4}])/repetitionTimes;
    averageQjd = sum([result2{((seedsNum-1)*repetitionTimes+2):(seedsNum*repetitionTimes+1),5}])/repetitionTimes;
    averageQmdl = sum([result2{((seedsNum-1)*repetitionTimes+2):(seedsNum*repetitionTimes+1),6}])/repetitionTimes;
    Qsd1Rate = sum([result2{((seedsNum-1)*repetitionTimes+2):(seedsNum*repetitionTimes+1),7}])/repetitionTimes;
    Qsd2Rate = sum([result2{((seedsNum-1)*repetitionTimes+2):(seedsNum*repetitionTimes+1),8}])/repetitionTimes;
    newResultSummary = {seedsNum, isCorrectSeedsNumberRate, averageQjd,averageQmdl, Qsd1Rate, Qsd2Rate};
    resultSummary2 = vertcat(resultSummary2, newResultSummary);
    fprintf('seeds number %i finished\n', seedsNum);
    toc
    %     result(j).seedsNum = seedsNum;
    %     result(j).succeed = succeed;
    % end
end
% calculateQsd;
tic
%%
QsdScore34562 = cell(1+repetitionTimes*seedsNum,4);
QsdScore34562(1,:) = {'QsdScore3','QsdScore4','QsdScore5','QsdScore6'};
cursor = 2;
averageQsd = {'averageQsd3','averageQsd4','averageQsd5','averegeQsd6'};
averageCursor = 2;
allShortestPaths = graphallshortestpaths(G,'directed',0);

for i = 2:1+repetitionTimes*seedsNum
    QsdScore34562(i,:) = {0,0,0,0};
    result2{i,4} = 0;
    if numel([result2{i,3}])==numel([result2{i,2}])
        result2{i,7} = Qsd([result2{i,3}], [result2{i,2}], 1, allShortestPaths);
        result2{i,8} = Qsd([result2{i,3}], [result2{i,2}], 2, allShortestPaths);
        QsdScore3 = Qsd([result2{i,3}], [result2{i,2}], 3, allShortestPaths);
        QsdScore4 = Qsd([result2{i,3}], [result2{i,2}], 4, allShortestPaths);
        QsdScore5 = Qsd([result2{i,3}], [result2{i,2}], 5, allShortestPaths);
        QsdScore6 = Qsd([result2{i,3}], [result2{i,2}], 6, allShortestPaths);
        QsdScore34562(i,:) = {QsdScore3,QsdScore4,QsdScore5,QsdScore6};
        result2{i,4} = 1;
    end
    if mod(i-1,repetitionTimes)==0
        averageQsd1 = sum([result2{i-repetitionTimes+1:i,7}])/repetitionTimes;
        averageQsd2 = sum([result2{i-repetitionTimes+1:i,8}])/repetitionTimes;
        averageQsd3 = sum([QsdScore34562{i-repetitionTimes+1:i,1}])/repetitionTimes;
        averageQsd4 = sum([QsdScore34562{i-repetitionTimes+1:i,2}])/repetitionTimes;
        averageQsd5 = sum([QsdScore34562{i-repetitionTimes+1:i,3}])/repetitionTimes;
        averageQsd6 = sum([QsdScore34562{i-repetitionTimes+1:i,4}])/repetitionTimes;
        newAverageQsd = {averageQsd3,averageQsd4,averageQsd5,averageQsd6};
        averageQsd = vertcat(averageQsd,newAverageQsd);
        resultSummary2{(i-1)/repetitionTimes+1,2} = sum([result2{i-repetitionTimes+1:i,4}])/repetitionTimes;
        resultSummary2{(i-1)/repetitionTimes+1,5} = averageQsd1;
        resultSummary2{(i-1)/repetitionTimes+1,6} = averageQsd2;
    end
end
resultTRBPInfectedNum = [result2,QsdScore34562];
resultSummaryTRBPInfectedNum = [resultSummary2,averageQsd];
toc
toc

