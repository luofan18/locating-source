function [ Q ] = Qjd( result,trueSeeds,finalInfectedList,adjacencyMatrix,step,simulationTimes,beta )
%Qjd calculate the Qjd for measure the performance using average jaccarb
%distance
%   Input       result:the seeds set find by the algorithm
%               trueSeeds: the actual seeds set
%               adjacencyMatrix
%               simulationTimes
if nargin==6
    beta=1;
end

assert(simulationTimes >=1, 'Qjd: simulationTimes: The simulation times should greater or equal than 1.');

QResult = 0;
QTrueSeeds = 0;
for i=1:simulationTimes
    QResult = QResult + jaccardDistance(finalInfectedList,reInfect(result,adjacencyMatrix,step,beta));
end
QResult = QResult/simulationTimes;
for i=1:simulationTimes
    QTrueSeeds = QTrueSeeds + jaccardDistance(finalInfectedList,reInfect(trueSeeds,adjacencyMatrix,step,beta));
end
QTrueSeeds = QTrueSeeds/simulationTimes;
Q = QResult/QTrueSeeds;
end

