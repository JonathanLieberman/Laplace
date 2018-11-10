# Load Libraries
using DifferentialEquations
using Plots
using LinearAlgebra

# Helper function
makeMatrix = function(n::Int, wrp::Bool)
    mid = -2.0 .* ones(n)
    off = ones(n-1)
    grd = SymTridiagonal(mid, off)
    if wrp
        grd = Array(grd)
        grd[1, n] = 1.0
        grd[n, 1] = 1.0
    end
    return(grd)
end

# Should the ODE have wrapping boundary conditions?
wrp = false
if wrp
    titl = "Wrapping"
else
    titl = "Nonwrapping"
end

# Build discrete scale
n = 64
x = -Int(round(n/2)):1:Int(round(n/2))

# Parameters
tmax = 200.0
tstep = 1
u0 = Float64.(x.^2)
tspan = (0, tmax)
tsteps = (0:tstep:tmax)
nsteps = length(tsteps)

# Create differential equation
A = makeMatrix(n + 1, wrp)
f(u, p, t) = A*u
prob = ODEProblem(f, u0, tspan)
sol = solve(prob)
plot(sol)

# Create animation
anim = @animate for i=1:nsteps
    plot(x,sol(tsteps[i]), ylim = [minimum(u0), maximum(u0)], legend = false)
    title!(titl)
end

# Write .gif
gifpath = join([titl, ".gif"])
gif(anim, gifpath, fps = 30)
