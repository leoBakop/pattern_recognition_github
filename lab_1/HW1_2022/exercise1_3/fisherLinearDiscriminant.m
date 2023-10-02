function v = fisherLinearDiscriminant(X1, X2)

    m1 = size(X1, 1);
    m2 = size(X2, 1);

    mu1 = mean(X1)% mean value of X1
    mu2 = mean (X2)% mean value of X2

    %covar matrix based on the previous ex definition
    S1 = (1/m1).*(transpose(X1) * X1); % scatter matrix of X1


    S2 = (1/m2).*(transpose(X2) * X2); % scatter matrix of X2
    
    p1=m1/(m1+m2); %apriori propabilities
    p2=m2/(m1+m2);
    
    Sw = p1*S1+p2*S2% Within class scatter matrix

    v = inv(Sw)*transpose(mu1-mu2)% optimal direction for maximum class separation w=

    v = v/norm(v)% return a vector of unit norm
