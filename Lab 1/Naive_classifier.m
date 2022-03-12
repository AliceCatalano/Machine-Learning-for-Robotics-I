function [setClassified, errorRate] = Naive_classifier(test, ...
    prob_mtx, probTarget, flag_target)

if (size(probTarget, 2) > 1) 
    error("Target probabilities vector should be a nx1 column vector!")
end

row_num = size(test,1);
clmn_num = size(test,2) - flag_target;
numTargets = max(test(:, end));
pM = prob_mtx;
gx_v = 0;
gx_Counter = 1;

% loops through all rows
for curr_row = 1:row_num
    for i = 1:size(probTarget,1)
        gx(i) = probTarget(i);
    end

    % consider all possible target values
    for curr_target = 1:numTargets
        for curr_clmn = 1:clmn_num
            
            if (test(curr_row, curr_clmn) > size(pM{curr_target, curr_clmn}, 2))
                disp(" missing information");
                break;
            end

            gx(curr_target) = gx(curr_target)*...
                pM{curr_target, curr_clmn}(test(curr_row, curr_clmn));
        end
    end

    % check which gx is higher and store each decision in a vector
    [maxVal, maxIdx] = max(gx);
    gx_v(gx_Counter, 1) = maxIdx;
    gx_Counter = gx_Counter + 1;
end

setClassified = [test gx_v];

% compute the error rate if a target column is present
if (flag_target)
    errorMatrix = setClassified(:, end-1) ~= setClassified(:, end);
    numErrors = sum(errorMatrix);
    errorRate = numErrors/size(setClassified,1);
else 
    errorRate = nan;
end
end