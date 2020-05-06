function x = conj_grad(A,b,k,err_tol)
    %make initial guess
    [m,n] = size(A);
    x = rand(m,1);
    %initial residual
    r = b - A*x;
    %initial search direction
    d = r;
    %iterate...
    for i=1:k
        alpha = (r'*r)/(d'*A*d);
        x = x + alpha*d;
        %store old r to calculate new beta
        r_old = r;
        r = r - alpha*A*d;
        %check for convergence given error tolerance e
        if norm(r)<err_tol
            sprintf('converged at iteration %d/%d',i,k)
            return 
        end
        beta = (r'*r)/(r_old'*r_old);
        d = r + beta*d;
    end
end
    