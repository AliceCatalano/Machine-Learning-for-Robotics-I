function J_mse = MSE_mD(dataSet, w1, ~, doPlot)
% Given the parameter of the model, the function computes the MSE on the
% given dataset with the given model.
% Multidimensional problem with 3 observation vector (column 2,3,4)
% and 1 target vector (mpg in the case of motor trend data, column 1)

[dimension,~] = size(dataSet(:,1));

% Build observation vector
X = [ dataSet(:,2), dataSet(:,3), dataSet(:,4) ];
% y = multiDimensionalLinearRegression(dataSet, 0);   % old implementation
y = X* w1;


% J_mse = 0 ;
% for i = 1: dimension
%     J_mse = J_mse + (dataSet(i, 1) - y(i) ) ^2 ;  % Target is column 1 ->mpg
% end
% 
% J_mse = J_mse / dimension;


% the computation of the MSE can be either done with the above commented
% formula or by directly using the immse function
t = dataSet(:, 1);
J_mse = immse(t, y); 

if (doPlot)
    disp(['The one dimensional mse with a dataset of #', num2str(dimension),' samples is:',num2str(J_mse)]);
end

end