function [output, error_rate] = kNN(training, test, k, trurh_lables)
%Check that the number of arguments received (nargin)
if nargin <= 2 
    disp('Error:the number of arguments received must be equals at least the number of mandatory arguments'); 
end
%Check that the number of columns of the second matrix equals the number of columns of the first matrix
[n, d] = size(training); 
[m, c] = size(test); 

if d ~= c+1  
    disp('Error, wrong Matrices dimensions'); 
end

%Check that matrix_k>0 and matrix_k<=cardinality of the training set (number of rows, above referred to as n)

if (k <= 0 || k > d) 
    disp('Error, wrong matrix_k'); 
end

%Classify the test set
% compute the euclidian distance
[D, I] = pdist2(training(:,1:c), test, 'euclidean', 'Smallest', k); 

class = zeros(k, m); 
for i = 1:k 
    for j = 1:m
        class (i,j) = training(I(i,j), end); 
    end 
end 
%Compute output 
output = zeros(m, 1); 
for i=1:m 
    output(i,1) = mode(class(:,i)); 
end
%Compute error_rate if we have also the truth_labless for comparison 
if nargin > 3 
    error_rate = (sum(output ~= trurh_lables))/m;
end 

   


end

