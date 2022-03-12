function [w, w0] = linearRegression(dataSet, doPlot)
% One-dimensional problem without intercept. Compute and returns the model

numerator = 0;
denominator = 0;
[dim,~] = size(dataSet(:,1));

for i= 1:dim
    numerator = numerator +  dataSet(i,1) * dataSet(i,2);
    denominator = denominator + (dataSet(i,1))^2;
end

w = numerator / denominator ;
w0 = 0;     % generic model for code reusability

if doPlot
    figure;
    plot (dataSet(:,1), dataSet(:,2), 'rx');        % plot points of dataset
    hold on;
    % plot line with computed slope 
    plot (dataSet(:,1), w * dataSet(:,1), 'b-' , 'Linewidth', 2);
    title('One-dimensional problem without intercept on the Turkish stock exchange data');
end

end