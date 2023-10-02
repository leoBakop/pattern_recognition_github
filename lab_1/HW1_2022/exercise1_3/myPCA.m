function [U, S] = myPCA(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = principalComponentAnalysis(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
%

% Useful values
[m, n] = size(X);

% You need to return the following variables correctly.
U = zeros(n);
S = zeros(n);

% ====================== YOUR CODE GOES HERE ======================
    % Apply PCA by computing the eigenvectors and eigenvalues of the covariance matrix. 
    %
    cov=(1/m)*(X'*X);
    [U,S]=eig(cov); %eigen vectors in a [vector1, vector2]
                    %                      ...     ....
                    %                      ...     ...
    eigenval=diag(S);
    [eigenval,ind]=sort(eigenval,1,'descend'); %sortinh the eigenvalues
    eigenvec=U(:,ind); %kind of sort the eigenvectores in the order
                       %of eigenvalues so the first vector is the one with the
                        %biggest eigenvalue
     U=eigenvec; %return the "sorted"



    % =========================================================================

end
