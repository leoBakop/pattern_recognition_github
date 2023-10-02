function perVar=calculatePerVar(S, K)
%secondary method just for calculations
% and report use

s=diag(S);
num=sum(s(1:K));
denum=sum(s)
perVar=num/denum;
end