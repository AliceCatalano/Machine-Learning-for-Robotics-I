function J_mse = MSE_1D(dataSet, w1, ~, doPlot)
% compute the MSE on the dataset with the given model.
[dim,~] = size(dataSet(:,1));
J_mse = 0 ;
%model
y = w1 * dataSet(:,1);

for i = 1: dim
    J_mse = J_mse + (dataSet(i, 2) - y(i) ) ^2 ;    % Target is column 1 
end

J_mse = J_mse / dim;

if (doPlot)
    disp(['The 1D mse with a dataset of #', num2str(dim),' samples is:',num2str(J_mse)]);
end

end