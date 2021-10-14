using FdeSolver
using Plots

# inputs
tSpan = [0, 5]     # [intial time, final time]
y0 = 1             # intial value
β = 0.6            # order of the derivative
par = -10          # lambda

F(t, y, par) = par * y

# Numerical solution
@time t, y = FDEsolver(F, tSpan, y0, β, par)

plot(t, y) # This is not nice that we have to say y[1,:] instead of y, in a 1D example.
# Juno.@enter FDEsolver(F, tSpan, y0, β, par)
