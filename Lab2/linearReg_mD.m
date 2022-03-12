function [w, w0] = linearReg_mD(dataSet, doPlot)
% Multidimensional problem with 3 observation vector (column 2,3,4)
% and 1 target vector (mpg in the case of motor trend data, column 1)
% Compute and returns the model

% [dimension,~] = size(dataSet(:,1));

% Build observation vector
X = [ dataSet(:,2), dataSet(:,3), dataSet(:,4) ];

% Build target vector -> mpg column 1
t = dataSet(:,1);

% Compute slope
w = pinv(X' * X) * X' * t;
w0 = 0; % generic model for code reusability 

% Plot the table representing the estimate of the target
prediction = X*w ;

if doPlot
    f = figure;
    data = [X t prediction];
    clmn = {'disp', 'hp', 'weight', 'dataset mpg', 'Predicted mpg' };
    uitable(f, 'Data', data, 'ColumnName', clmn, 'Position', [0 0 440 420]);
end

end