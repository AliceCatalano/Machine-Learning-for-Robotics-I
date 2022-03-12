function [w1, w0] = linearReg_offset(dataSet, doPlot)
% One-dimensional problem with intercept. Compute and returns the model

numerator = 0;
denominator = 0;
x_bar = 0;
t_bar = 0;
[dim,~] = size(dataSet(:,1));

for i= 1:dim
    x_bar = x_bar + dataSet(i,4);     % Observed feature is weight -> colum 4
    t_bar = t_bar + dataSet(i,1);     % Target is mpg -> column 1
end

% Multiply by 1/N ( N: dimension of dataset)
x_bar = x_bar/dim;
t_bar = t_bar/dim;

for i = 1:dim
    numerator = numerator +  (dataSet(i,4) - x_bar) * (dataSet(i,1) - t_bar);
    denominator = denominator + (dataSet(i,4) - x_bar)^2;
end

w1 = numerator / denominator ;  % slope (gain)

w0 = t_bar - w1 * x_bar ;   % intercept / offset (bias)

% y = w1 * x + w0
y = w1 * dataSet(:,4) + w0;

if(doPlot)
    figure;
    plot (dataSet(:,4), dataSet(:,1), 'rx');        % plot points of dataset
    hold on;
    % plot line with computed slope
    plot (dataSet(:,4), y , 'b-' , 'Linewidth', 2);
    %maybe put title in script?
    title('One-dimensional with intercept on the Motor Trends car data');
end

end