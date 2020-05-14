clear all

%make toy example Ax=b with nice well conditioned A (diagonally dominant)
dim = 30

A = smallcond(dim)

b = [1:dim]'
c_test = A\b;

samples=[]
for i=1:5000
    [c,sample] = conj_grad(A,b,dim,eps);
    sprintf('relative error is %d',norm(c-c_test)/norm(c_test))
    samples = [samples;sample'];
end

emp_cov=cov(samples)
real_cov=inv(A)
norm(emp_cov-real_cov)/norm(real_cov)

%now we want to plot eigenvalue structure...
emp_eigs = eigs(inv(emp_cov),dim)
real_eigs = eigs(A,dim)
max_eig = max([max(emp_eigs),max(real_eigs)]) 
%add custom 1d axis
hAxes = axes('NextPlot','add',...           %# Add subsequent plots to the axes,
             'DataAspectRatio',[1 1 1],...  %#   match the scaling of each axis,
             'XLim',[0 max_eig],...               %#   set the x axis limit,
             'YLim',[0 eps],...             %#   set the y axis limit (tiny!),
             'Color','none')...               %#   and don't use a background color
;
plot(emp_eigs,0,'x','Color','r','MarkerSize',10)
hold on
plot(real_eigs,0,'o','Color','b','MarkerSize',10)