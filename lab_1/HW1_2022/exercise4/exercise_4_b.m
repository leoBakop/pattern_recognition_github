clear all
close all
DT=.01;
x1=0:DT:10;
x2=0:DT:10;
[X1,X2]=meshgrid(x1,x2);
figure(1)
mu_1=[3,3];
mu_2=[6,6];
SIGMA=[1.2 0.4;
        0.4 1.2]
hold on;
y1=mvnpdf([X1(:) X2(:)], mu_1, SIGMA);
y1r=reshape(y1, length(x2), length(x1));
contour(x1, x2, y1r)
plot([mu_1(1),mu_1(1)+2], [mu_1(2),mu_1(2)+2], '--')
plot([mu_2(1),mu_2(1)+3.5], [mu_2(2),mu_2(2)+3.5], '--')
grid on;




y1=mvnpdf([X1(:) X2(:)], mu_2, SIGMA);
y1r=reshape(y1, length(x2), length(x1));
contour(x1, x2, y1r, 'r')
grid on;


for P1 = [0.1, 0.25 ,0.5, 0.75, 0.9]
    P2 = 1 - P1;
    a=log(P1/P2);
    y = (1.86*x1-a)./(0.62*x1-1.86);
    plot(y,x1);
    axis([0 10 0 10]);
end
legend('\Sigma_1','~','~','\Sigma_2','P1 = 0.1','P1 = 0.25','P1 = 0.5','P1 = 0.75','P1 = 0.9');


hold off
