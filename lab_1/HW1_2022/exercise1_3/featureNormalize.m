function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

%%initiallizations

[nSamples, nFeat]=size(X); %nSample is the number of the lines and nFeatures is the number of the columns


mu = zeros(1,nFeat);% mean of each column (feature)
sigma =zeros(1,nFeat); % standart deviation of each column
X_norm = zeros(nSamples,nFeat);% normalize each column independently

for j=1:nFeat
    mu(j)=mean(X(:,j));
    sigma(j)=std(X(:,j));
    X_norm(:,j)=(X(:,j)-mu(j))/sigma(j);
end
    
    
% ============================================================

end
