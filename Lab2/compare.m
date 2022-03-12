function compare(dataSet)

dimension = size(dataSet, 1);
rand_data = dataSet(randperm(dimension), :);
subsets = 9;
dim_subsets = floor(dimension / subsets);  

figure;
sgtitle(['Comparison of ', int2str(subsets ) ,' subset of the dataset']);
for i = 1:subsets
    dataSet = rand_data((dim_subsets*i+1-dim_subsets) : dim_subsets*i,:);
    
    slope = linearRegression(dataSet,0);
    subplot(3,3,i);
    
    plot (dataSet(:,1), dataSet(:,2), 'rx');         % plot points of dataset
    hold on;
    plot (dataSet(:,1), slope * dataSet(:,1), 'b-' , 'Linewidth', 2);   % plot line with computed slope 
    hold on;
    title(['Subset #',num2str(i),' - Slope =', num2str(slope) ]);
    
end

end