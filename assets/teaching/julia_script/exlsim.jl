# This file was generated, do not modify it. # hide
using ControlSystems, Plots, LinearAlgebra
k=16
c=7
sys = tf([1], [1, c, k])  # Define the transfer function
Ts = 0.01  # Sampling time
sys_d = c2d(sys, Ts)  # Convert to discrete system

t = 0:0.01:5  # Define the time vector
# u = ones(length(t))  # Define the input signal
# u(x,t)=[1]
u=zeros(1,length(t))
u[1]=1
x0=[0.0,0]
@show res = lsim(sys_d, u, t, x0=x0)  # Perform the simulation

# plot(t, y[:], xlabel="Time", ylabel="Output", label="Output")  # Plot the output signal
# plot(res.t,res.x[1,:])  # Plot the output signal
# plot!(t, u, label="Input")  # Plot the input signal

# plot(res.t,res.y[:])  # Plot the output signal 2 12 1 222 12
@show plot(res)  # Plot the output signal 2 12 1 222 12
@show res.y

savefig(joinpath(@OUTPUT, "plot1.svg")) # hide