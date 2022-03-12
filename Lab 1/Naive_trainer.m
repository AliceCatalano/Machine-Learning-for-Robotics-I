function [prob_mtx, prob_target] = Naive_trainer(training, laplaceSmoothing)
   
   if (laplaceSmoothing) 
        pseudocount = 0.1;
        levelVector = training(1, :);
        training = training(2:end, :);
    else
        pseudocount = 0;
        levelVector = zeros(size(training,2));
    end

    % calculating all probabilities
    count_class = max(training(:, end));
    count_att = size(training, 2) - 1;
    prob_mtx = cell(count_class, count_att);

    % loop through classes
    for currClass = 1:count_class
        % class == currClass 
        class_instances = sum(training(:, end) == currClass);
        prob_target(currClass, 1) = class_instances/size(training,1);

        % getting subset of all rows with currClass
        sub_training = zeros(1, size(training,2));
        for i = 1:size(training,1) 
            if (training(i, end) == currClass)
                sub_training = [sub_training; training(i, :)];
            end
        end

        % deleting first row 
        sub_training = [sub_training(2:end, :)];
        
        % loop through columns
        for curr_clmn = 1:count_att
            % loop through all possible attribute values
            for curr_val = 1:max(training(:, curr_clmn))
                curr_val_instances = sum(sub_training(:, curr_clmn) == curr_val);
                
                condProbability = (curr_val_instances + pseudocount)/...
                    (class_instances + pseudocount*levelVector(curr_clmn));
                tempProbMatrix(curr_val) = condProbability;
            end
            prob_mtx{currClass, curr_clmn} = tempProbMatrix;
            clear tempProbMatrix;
        end
    end
end
