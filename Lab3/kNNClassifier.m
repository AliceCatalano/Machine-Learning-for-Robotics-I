% Lab Assignment 3 - kNN Classifier 
clear; 
clc;
close all; 

% Task 1: Obtain a data set with loadMNIST.m function

[training, targets] = loadMNIST(0); 
[test, trurh_lables] = loadMNIST(1); 

k = [1,2,3,4,5,10,15,20,30,40,50];
dim_k = max(size(k)); 

% Task 2: Build a kNN classifier

for i = 1:dim_k
    
    [classification, error_rate(i, 1)] = kNN([training(1:6000,:) targets(1:6000,:)], test(1:1000,:), k(i), trurh_lables(1:1000,:));

end

error_rate_k = [k' error_rate];

%plot the error rate 
figure 
bar(error_rate_k(:,1), error_rate_k(:,2), 'BarWidth', 1);
xlabel('k'); 
ylabel('error'); 
title('Error rate in task 2'); 

%Task 3 : Test the kNN classifier
%Compute the accurancy on the test set on 10 tasks: each digit vs the
%remaining 9, and for several values of k 

 k_test = [1,2,3,4,5,10,15,20,40,50, 100]; %new k values 
 
 digits = [1,2,3,4,5,6,7,8,9,10]; %digits

 %Computing the classification and the error for each digit = [1:1:10
for j =1:max(size(digits))
 %in this case, considering just a single digit, the classification can be
 %just 0 or 1. 
     for i = 1: max(size(k_test)) 
        [classification2, error_rate_kap(i, 1)] = kNN([training(1:6000,:), targets(1:6000,:) == j], test(1:1000,:), k_test(i), trurh_lables(1:1000,:) == j);
        
     end
     %Fill in a matrix the error of each digit 
     classification_2(:,j) = classification2;
     error_rate_k_test(:,j) = error_rate_kap; 
    
end

% Compute and plot accurancy
accuracy = zeros(size(error_rate_k_test)); 
for i = 1:max(size(k_test)) 
    for j = 1:max(size(digits))
        accuracy(i,j) = (1 - error_rate_k_test(i,j))*100; 
    end
end 

%Plot avarage accuracy 
mean_accuracy = zeros(max(size(k_test)),1); 
%for each k
for i = 1:max(size(k_test))  
    mean_accuracy(i,1) = sum(accuracy(i,:)); 
end 

mean_accuracy = mean_accuracy/max(size(k_test)); 
    
%plot the average of the accuracy with respect to k 
figure 
plot(k_test, mean_accuracy); 
xlabel('k values');
ylabel('average accuracy'); 
title('Average accuracy with respect to k'); 

%Plot the accuracy of the digits w.r.t. k 
figure; hold on;
for i = 1:size(accuracy, 2)
    plot(k_test, accuracy(:,i)); 
    xlabel('k_test values'); 
    ylabel('accuracy'); 
    legend('Digit 1','Digit 2','Digit 3', 'Digit 4', 'Digit 5', 'Digit 6','Digit 7','Digit 8','Digit 9','Digit 10' ); 
end 

% bar graph of the accuracy w.r.t. K %%%%%%%%%%%%%
for i = 1: size(accuracy,2) 
    figure; 
    bar(k_test, accuracy(:,i), 'BarWidth', 1); 
    xlabel('k_test value'); 
    ylabel('accuracy digit ' + string(i)); 
end 

