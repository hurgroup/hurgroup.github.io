# This file was generated, do not modify it. # hide
using OrdinaryDiffEq, Plots, LinearAlgebra
k=16
c=7

#Define the problem
function msd!(dx, x, p, t)
	function f(t)
		return 10*(t>=0 && t<0.1)
	end
    x1 = x[1]
    x2 = x[2]
    k=p[1]
    c=p[2]
    dx[1] = x2
    dx[2] = -k*x1-c*x2+f(t)
end

p=[k,c]
x0=[0.0,0.0]
tspan = (0, 5.0)  # Define the time vector

prob = ODEProblem(msd!, x0, tspan, p)
sol = solve(prob, Tsit5())

@show plot(sol,vars=(0,1))  # Plot the output signal 2 12 1 222 12

savefig(joinpath(@OUTPUT, "plot3.svg")) # hide