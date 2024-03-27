# This file was generated, do not modify it. # hide
using ControlSystems, Plots, LinearAlgebra
k=16
c=7
sys = tf([1], [1, c, k])  # Define the transfer function

t = 0:0.01:5  # Define the time vector
# u = ones(length(t))  # Define the input signal
# u(x,t)=[1]
# @show res = lsim(sys_d, u, t, x0=x0)  # Perform the simulation
@show res=impulse(sys,5)

# plot(res.t,res.y[:])  # Plot the output signal 2 12 1 222 12
@show plot(res)  # Plot the output signal 2 12 1 222 12

savefig(joinpath(@OUTPUT, "plot2.svg")) # hide