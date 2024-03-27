# This file was generated, do not modify it. # hide
using Plots

# Define the square wave function
function square_wave(t)
    return sign(sin(t))
end

# Fourier series approximation of the square wave
function fourier_series(t, n_terms)
    approximation = 0.0
    for n in 1:n_terms
        harmonic = 2n - 1 # Odd harmonics
        approximation += (sin(harmonic * t)) / harmonic
    end
    return (4 / π) * approximation
end

# Time domain for plotting
t = 0:0.01:4π

# Plot the original square wave
p = plot(t, square_wave.(t), label="Square Wave", linewidth=2)

# Add Fourier approximations with increasing number of terms
for n_terms in [1, 3, 5, 10, 50]
    approximation = fourier_series.(t, n_terms)
    plot!(p, t, approximation, label="n=$n_terms Terms", linewidth=2)
end

# Display the plot
display(p)
savefig(joinpath(@OUTPUT, "plot4.svg")) # hide