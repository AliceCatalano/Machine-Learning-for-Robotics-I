clear; %close all; clc;

%Get the data
mtcars_set = readmatrix('mtcarsdata-4features.csv', 'Range', 'B:end');
mtcars_set = [mtcars_set(2:end, :)]; %removing the first row

turkish_set = readmatrix("turkish-se-SP500vsMSCI.csv");

% Fit a linear regression model

% One-dimensional problem without intercept on the Turkish stock exchange data
linearRegression(turkish_set,1);

% Compare graphically the solution obtained on different random subsets (10% or less) of the whole data set.
compare(turkish_set);

% One-dimensional problem with intercept on the Motor Trends car data,
linearReg_offset(mtcars_set, 1);

%  Multi-dimensional problem on the complete MTcars data, using all four columns
linearReg_mD(mtcars_set,1);

% Test regression model
iteration = 10;
perc_1 = 0.05; perc_2 = 0.95; 
% Compute MSE for one-dimensional problem without intercept on the Turkish stock exchange data
[mse_5pc, mse_95pc] = MSE_calc(iteration, turkish_set, @MSE_1D,@linearRegression, perc_1, perc_2);
disp('MSE for 1D without intercept, on the Turkish stock exchange data, with a train set of 5% of the samples');
disp(['The 1D MSE computed on the train set, averaged over #',num2str(iteration ),' iterations  is:',num2str(mse_5pc)]);
disp(['The 1D MSE computed on the test set made of the remaining data, averaged over #',num2str(iteration ),' iterations is:',num2str(mse_95pc)]);

% Compute MSE for one-dimensional problem with intercept on the Motor Trends car data, using columns mpg and weight
[mse_5pc, mse_95pc] = MSE_calc(iteration, mtcars_set, @MSE_offset_1D,@linearReg_offset, perc_1, perc_2);
disp('MSE for 1D problem with intercept on the Motor Trends car data with a train set of 5% of the samples');
disp(['The 1D MSE computed on the train set, averaged over #',num2str(iteration ),' iterations  is:',num2str(mse_5pc)]);
disp(['The 1D MSE computed on the test set made up of the remaining data, averaged over #',num2str(iteration ),' iterations is:',num2str(mse_95pc)]);

% Compute MSE for Multi-dimensional problem on the complete MTcars data
[mse_5pc, mse_95pc] = MSE_calc(iteration, mtcars_set, @MSE_mD,@linearReg_mD, perc_1, perc_2);
disp('MSE for Multi-dimensional problem on the complete MTcars data with a train set of 5% of the samples');
disp(['The multi dimensional MSE computed on the train set, averaged over #',num2str(iteration ),' iterations is:',num2str(mse_5pc)]);
disp(['The multi dimensional MSE computed on the test set made up of the remaining data, averaged over #',num2str(iteration ),' iterations is:',num2str(mse_95pc)]);

