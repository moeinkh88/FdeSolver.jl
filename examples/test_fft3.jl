using FdeSolver
using Plots

# inputs
tSpan = [0, 50] # time span

h = 0.1 # time step

N = 10 # number of species

β = ones(N) # order of derivatives

X0 = 2*rand(N) # initial abundances

# System definition

# parametrisation
par = [2, 2 * rand(N), rand(N), 4 * rand(N,N), N]

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

t, Yapp = FDEsolver(F, tSpan, X0, β, par, nc = 1)
plot(t, Yapp)
