using FdeSolver, MATLAB
using Plots, BenchmarkTools

# Benchmark with MATLAB
## inputs
tSpan = [0, 700] # time span

h = 0.01 # time step

N = 15 # number of species

β = ones(N) # order of derivatives

X0 = 1/15 .*ones(N) # initial abundances

## System definition

# parametrisation
par = [2,
      ones(N),
      ones(N),
      4*rand(N,N),
       N]

function F(t, x, par)
    l = par[1] # Hill coefficient
    b = par[2] # growth rates
    k = par[3] # death rates
    K = par[4] # inhibition matrix
    N = par[5] # number of species

# ODE
    Fun = zeros(N)
    for i in 1:N
    # inhibition functions
    f = prod(K[1:end .!= i, i] .^ l ./
             (K[1:end .!= i, i] .^ l .+ x[1:end .!= i] .^l))
    # System of equations
    Fun[i] = x[i] .* (b[i] .* f .- k[i] .* x[i])
    end

    return Fun

end

b = @benchmark FDEsolver(F, nothing, tSpan, X0, β, par)

histogram(b.times)
