function [ result ] = mainBodyOriginal( G, seedsNum, bins, binSize, binNum,beta, repetitionTimes,QjdTimes,minInfected,maxInfected )
trials = 0;
i = 0;
succeed = 0;
resultCursor = 0;
result = [];
while i < repetitionTimes
    seeds = generateSeeds(G, seedsNum, bins, binSize, binNum);
    %     fprintf('the seeds generated are:\n');
    %     disp(seeds);
    [I, step] = infect(G, seeds, beta, minInfected);
    if sum(I) <= maxInfected
        GI = G(I==1,I==1);
        [S, C] = conncomp(GI);
        if S==1
            %           fprintf('get good infected graph, %i infected', sum(I));
            i = i + 1;
            SS = completeN(G, beta, I, seedsNum);
            seeds01 = zeros(1,numel(I));
            seeds01(seeds) = 1;
            QjdScore = Qjd( find(SS),seeds,find(I),G,step,QjdTimes,beta );
            QmdlScore = MDL(G, I, SS, beta)/MDL(G,I,seeds01,beta);
            QsdScore1 = 0;
            QsdScore2 = 0;
            isCorrectSeedsNumber = 0;
            %                 if all(SS == seeds01)
            if numel(find(SS)) == seedsNum
                succeed = succeed + 1;
                QsdScore1 = 0;
                QsdScore2 = 0;
                %                     fprintf('succeed + 1\n');
                isCorrectSeedsNumber = 1;
            end
            newResult = {(minInfected + maxInfected)/2,seeds,find(SS),isCorrectSeedsNumber, QjdScore, QmdlScore, QsdScore1, QsdScore2};
            result = vertcat(result,newResult);
            resultCursor = resultCursor + 1;
        end
    end
    trials = trials + 1;
end

end

