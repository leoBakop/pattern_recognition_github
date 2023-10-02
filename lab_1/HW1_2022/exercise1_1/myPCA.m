function [U, S] = myPCA(A)
    %PCA Run principal component analysis on the dataset X
    %   [U, S, X] = myPCA(X) computes eigenvectors of the covariance matrix of X
    %   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
    %

    % Useful values
    [m, n] = size(A);

    % You need to return the following variables correctly.
    U = zeros(n);
    S = zeros(n);
    % ====================== YOUR CODE GOES HERE ======================
    % Apply PCA by computing the eigenvectors and eigenvalues of the covariance matrix. 
    cov=(1/m)*(A'*A);
    [U,S]=eig(cov); %eigen vectors in a [vector1, vector2]
                    %                      ...     ....
                    %                      ...     ...
    eigenval=diag(S);
    [eigenval,ind]=sort(eigenval,1,'descend'); %sortinh the eigenvalues
    eigenvec=U(:,ind); %kind of sort the eigenvectores in the order
                       %of eigenvalues so the first vector is the one with the
                        %biggest eigenvalue
     U=eigenvec; %return the "sorted"
     S=S(ind,ind); %sorted s
     s=diag(S);
     %computing the perecnrage variation that each Pc counts forr
     s_total=sum(s);
     s_1=s(1)/s_total
     s_2=s(2)/s_total
     figure(5)
     pie([s_1 s_2]);
     legend('\sigma_1', '\sigma_2')
     
    % =========================================================================
end
