clear all

%make toy example Ax=b with nice well conditioned A (diagonally dominant)
dim = 8
A=[]
for i=1:dim
    A = [A;1:dim]
end
%make invertible
for i=1:dim
    A(i,i) = 100
end

b = [1:dim]'
c_test = A\b;

c = conj_grad(A,b,1000,1e-6);

sprintf('relative error is %d',norm(c-c_test)/norm(c_test))