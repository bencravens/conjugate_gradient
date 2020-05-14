function x = conj_grad(A,b,k,err_tol)
    %make initial guess
    [m,n] = size(A);
    x = zeros(m,1);
    %initial residual
    r = b - A*x;
    %initial search direction
    p = r;
    %normalizing constant
    d = p'*A*p
    %iterate...
    for i=1:k
        gamma = (r'*r)/d;
        x = x + gamma*p;
        %store old r to calculate new beta
        r_old = r;
        r = r - gamma*A*p;
        beta = -(r'*r)/(r_old'*r_old);
        p = r - beta*p;
        d = p'*A*p;
        %check for convergence
        if norm(r)<err_tol
            sprintf('converged at iteration %d/%d',i,k)
            return 
        end
    end
end
    