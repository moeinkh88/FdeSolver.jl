using FdeSolver, MATLAB
using BenchmarkTools, Plots

mat"""
    alpha = 0.6; lambda = -10;
    f_fun = @(t,y,lam) lam * y;
    J_fun = @(t,y,lam) lam;
    param = lambda;
    t0 = 0; T = 5; y0 = 1; h = 2^(-5);
    tic
    [$M_t, $M_y] = mt_fde_pi12_pc(alpha, f_fun, t0, T, y0, h, param);
    toc
    """

mat"""
    alpha = 0.6; lambda = -10;
    f_fun = @(t,y,lam) lam * y;
    J_fun = @(t,y,lam) lam;
    param = lambda;
    t0 = 0; T = 5; y0 = 1; h = 2^(-5);
    tic
    [$M_t, $M_y] = fde_pi1_ex(alpha, f_fun, t0, T, y0, h, param);
    toc
    """

alpha = 0.6
lambda = -10
f_fun = (t, y, lam) -> lam * y
param = lambda
tSpan = [0, 5]
y0 = 1
h = 2^(-5)

J_t, J_y = FDEsolver(f_fun, tSpan, y0, alpha, param, h = h)

plot(J_t, J_y)
plot!(M_t, M_y)
