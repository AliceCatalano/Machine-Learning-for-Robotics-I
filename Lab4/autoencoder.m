clear all; 
close all; 
clc; 

% extract only 2 classes, for istance 1 and 2 digits 
[trainer, target] = loadMNIST(0,3); 
[trainer1, target1] = loadMNIST(0,8); 

%Extract  a limited number of classes 
data_c1 = [trainer, target]; 
data_c2 = [trainer1, target1]; 
[n,m] = size(data_c1); 
[q,r] = size(data_c2); 

randIndex_c1 = randperm(n); 
randIndex_c2 = randperm(q); 

subSet = data_c1(randIndex_c1(1:500), :); 
subSet1 = data_c2(randIndex_c2(1:500), :); 

%Create training_set set 
training_set = [subSet(:,1:end-1)', subSet1(:,1:end-1)']; 
labels_set = [subSet(:,end)', subSet1(:,end)']; 

% Train the autoencoder on the reduced training_set set
%set size (num of units) in the hidden layer 
hidden_layer = 2; 
myAutoencoder = trainAutoencoder(training_set, hidden_layer); 

%Encode the different classes using the encoder obtained
myEncodedData = encode(myAutoencoder, training_set);

% Plot the data using the given function "plotcl" to plot data 
plotcl(myEncodedData', labels_set');



