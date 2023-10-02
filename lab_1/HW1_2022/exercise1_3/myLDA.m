function A = myLDA(Samples, Labels, NewDim)
% Input:    
%   Samples: The Data Samples 
%   Labels: The labels that correspond to the Samples
%   NewDim: The New Dimension of the Feature Vector after applying LDA
    [NumSamples NumFeatures] = size(Samples);
	A=zeros(NumFeatures,NewDim);
    
	
    NumLabels = length(Labels);
    if(NumSamples ~= NumLabels) then
        fprintf('\nNumber of Samples are not the same with the Number of Labels.\n\n');
        exit
    end
    Classes = unique(Labels);
    NumClasses = length(Classes)  %The number of classes
    Sw=zeros(NumFeatures);
    Sb=zeros(NumFeatures);
    %For each class i
	%Find the necessary statistics
    
    for i=1:NumClasses
        i=Classes(i);
        %Calculate the Class Prior Probability
        P(i+1)=sum(Labels==i)/NumLabels;
        %Calculate the Class Mean 
        tmp=Samples((Labels==i),:);
        mu(i+1,:)=mean(tmp,1);
        %Calculate the Within Class Scatter Matrix
       %just for debugging reasons
        X=Samples(Labels==i, :);
        S=(transpose(X) * X);
        tmp=P(i+1)*(1/sum(Labels==i)).*S; %in order to "weight" every class of samples
        Sw=Sw+tmp;
    end
     
    %Calculate the Global Mean
	m0=mean(mu);

  
    %Calculate the Between Class Scatter Matrix
    for i=1:NumClasses
        i=Classes(i);
        tmp=mu(i+1,:)-m0;
        Sb=Sb+P(i+1).*(transpose(tmp)*tmp); 
    end
    %Eigen matrix EigMat=inv(Sw)*Sb
    EigMat = inv(Sw)*Sb;
    [U,S]=eig(EigMat); %U: eigenvectors, %S: eigenvalues as a matrix
    eigenval=diag(S);
    [eigenval,ind]=sort(eigenval,1,'descend'); %sortinh the eigenvalues
    eigenvec=U(:,ind);
    
   
    
    %Perform Eigendecomposition

    
    %Select the NewDim eigenvectors corresponding to the top NewDim
    %eigenvalues (Assuming they are NewDim<=NumClasses-1)
	%% You need to return the following variable correctly.
	A=zeros(NumFeatures,NewDim);  % Return the LDA projection vectors
    A=eigenvec(:,1:NewDim);
end
