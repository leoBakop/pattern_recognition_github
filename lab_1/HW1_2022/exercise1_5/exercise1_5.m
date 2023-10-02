close all;
clear;
clc;

data_file = './data/mnist.mat';

data = load(data_file);

% Read the train data
[train_C1_indices, train_C2_indices,train_C1_images,train_C2_images] = read_data(data.trainX,data.trainY.');

% Read the test data
[test_C1_indices, test_C2_indices,test_C1_images,test_C2_images] = read_data(data.testX,data.testY.');


%% Compute Aspect Ratio
[s_1, tmp1, tmp2]=size(train_C1_images);
[s_2, tmp1, tmp2]=size(train_C2_images);
aRations=ones(s_1+s_2, 1);
for i=1:s_1
    % i=1833
    [aRations(i),height, width, firstCol, firstRow] =computeAspectRatio(train_C1_images(i,:,:));
    if i==20
        plotImage(1, train_C1_images(i,:,:),height, width, firstCol, firstRow)
    end
end
for i=1:s_2
    [aRations(s_1+i),height, width, firstCol, firstRow]=computeAspectRatio(train_C2_images(i,:,:));
    if i==5
        plotImage(2, train_C2_images(i,:,:), height, width, firstCol, firstRow)
    end
end
% Compute the aspect ratios of all images and store the value of the i-th image in aRatios(i)


minAspectRatio = min(aRations);
maxAspectRatio = max(aRations);

i=3;
%% Bayesian Classifier


% Prior Probabilities

PC1 = s_1/(s_1+s_2)
PC2 = s_2/(s_1+s_2)

mu_1=mean(aRations(1:s_1));
mu_2=mean(aRations(s_1+1:end));
sigma_1=sqrt(mean((aRations(1:s_1)-mu_1).^2));
sigma_2=sqrt(mean((aRations(s_1+1:end)-mu_2).^2));
aRations=-10:.01:10;

% Likelihoods
PgivenC1 =normpdf(aRations, mu_1, sigma_1); 
PgivenC2 = normpdf(aRations, mu_2, sigma_2);
%teting figure for debugging reasons
figure(i)
plot(aRations, PgivenC1, aRations, PgivenC2)
i=i+1;
hold on;
border=findBorder(PgivenC1, PgivenC2, aRations, PC1, PC2);
plot([aRations(border), aRations(border)], [0, max(PgivenC2)],'k',  'LineWidth', 1)
grid on;
hold off;



% Posterior Probabilities
PC1givenL = PC1*PgivenC1;
PC2givenL = PC2*PgivenC2;

[test_s_1, tmp]=size(test_C1_images);
[test_s_2, tmp]=size(test_C2_images);

BayesClass= ones(test_s_1+test_s_2, 1);

border=aRations(border);
for i=1:test_s_1
    [current,tmp]=computeAspectRatio(test_C1_images(i,:,:));
    if current < border 
        BayesClass(i)=1;
    else 
        BayesClass(i)=2;
    end
end
for i=1:test_s_2
    [current,tmp]=computeAspectRatio(test_C2_images(i,:,:));
    if current < border   
        BayesClass(test_s_1+i)=1;
    else 
        BayesClass(test_s_1+i)=2;
    end
end
 
 predictionsForClass1 = BayesClass(1:size(test_C1_images,1));
 predictionsForClass2 = BayesClass(size(test_C1_images,1)+1:end);
 
 falsePredClass1 = sum(predictionsForClass1==2)
 falsePredClass2 = sum(predictionsForClass2==1)
  
 % Count misclassified digits
 count_errors = falsePredClass1 + falsePredClass2;
 
 % Total Classification Error (percentage)
 Error = 100*(count_errors/(test_s_1+test_s_2))