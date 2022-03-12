function J_mse = MSE_offset_1D(dataSet, w1, w0, doPlot)
% Given the parameter of the model, the function computes the MSE on the
% given dataset with the given model.

[dim,~] = size(dataSet(:,1));

% y = linearRegressionWithOffset(dataSet, 0);
% y = w1 * x + w0
y = w1 * dataSet(:,4) + w0;

J_mse = 0 ;

for i = 1: dim
    J_mse = J_mse + (dataSet(i, 1) - y(i) ) ^2 ;  % Target is column 1 ->mpg
end

J_mse = J_mse / dim;


if (doPlot)
    disp(['The one dimensional mse with a dataset of #', num2str(dim),' samples is:',num2str(J_mse)]);
end

end