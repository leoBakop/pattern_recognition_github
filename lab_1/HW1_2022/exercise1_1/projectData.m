function Z = projectData(X, U, K)
    %PROJECTDATA Computes the reduced data representation when projecting only 
    %on to the top k eigenvectors
    %   Z = projectData(X, U, K) computes the projection of 
    %   the input samples X into the reduced dimensional space spanned by
    %   the first K columns of U. It returns the projected examples in Z.
    %

    % You need to return the following variables correctly.
    Z = zeros(size(X, 1), K);

    eigenvectors=zeros(size(U, 1), K);
    m=size(X);
    y=zeros(1, m(1)); %becase i want to project all the samples 

    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the projection of the data using only the top K 
    %               eigenvectors in U (first K columns). 
    %
   eigenvectors=U(:,1:K); %eigenvectors are the first k significant vectors
   Z=X*eigenvectors; % projet every sample in every significant eigenvector
    



    % =============================================================

end
