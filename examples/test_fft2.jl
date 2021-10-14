using FdeSolver
using Plots

# Let's try FFT for a system
tSpan = [0, 50]
h = 2^(-5)
y0 = [1.2, 2.8]
β = [0.8, 0.7]
A = 1
B = 3
par = [A, B]

# Definition of the System
function F(t, y, par)

    F1 = par[1] .- (par[2] + 1) .* y[1] .+ y[1].^2 .* y[2]
    F2 = par[2] .* y[1] .- y[1].^2 .* y[2]

    return [F1, F2]

end

@time t, Yapp = FDEsolver(F, tSpan, y0, β, par)
# Juno.@enter FDEsolver(F, tSpan, y0, β, 1,  nothing, par)
plot(t, Yapp)
