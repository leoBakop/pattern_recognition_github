function border=findBorder(a, b, x, PC1, PC2)
if size(a,2)~=size(b,2)
    return 
end

size_a=size(a, 2);
size_b= size(b, 2);
for i=1:size_a
    for j=1:size_b
        tmp_a=PC1*a(i);
        tmp_b=PC2*b(j);
        if abs(tmp_a-tmp_b)<0.01 && abs(x(i)-x(j))<0.01 && tmp_a>0.1
            border=i;
            return ;
        end
    end
end

end