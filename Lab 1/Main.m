% config values
inputData = readmatrix('DataSet.txt');
numColmn = size(inputData, 2);
testSet_rows = 4;
trainSet_rows = 10;
flag_target = 1;

errorRate_avg = 0;
loops = 100;

for i = 1:loops
    % create training and test sets
    rows_count = size(inputData, 1);
    randSel_row = randperm(rows_count, rows_count);
    randInput = inputData(randperm(size(inputData, 1)), :);
    training = randInput((1:trainSet_rows), :);
    test = randInput(((trainSet_rows+1):rows_count), :);
    
    %  implement laplace smoothing
    levelVector = [3, 3, 2, 2, nan];
    training = [levelVector; training];
    
    % call classifier
    [prob_mtx, probTarget] = Naive_trainer(training, 1);
    [result, errorRate] = Naive_classifier(test, prob_mtx, ...
        probTarget, flag_target);

    errorRate_avg = errorRate_avg + errorRate;

    disp("Error rate = ");
    disp(errorRate);
    
end

errorRate_avg = errorRate_avg / loops;
disp("Average error rate: ");
disp(errorRate_avg);