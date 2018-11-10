# Laplace
Sample Julia code to generate a .gif showing heat dispersion in a single dimension

# Quickstart
1. Install `DifferentialEquations`, `Plots`, and `LinearAlgebra`
2. Open Julia and change to the appropriate directory
3. Run HeatEqn.jl

# Background
Temperature follows a famous partial differential equation called Laplace's Equation. Laplace's equation can be simulated using finite element modelling and linear algebra.

Julia's `DifferentialEquations` suite makes modelling finite elements very easy. This code helps visualize what happens to the temperature within an object as time passes.

The option of `wrp` in the script gives the option for the temperature dispersion to wrap along the x-axis. This prevents heat from leaving the system if the element's edges are touching (i.e. a thin ring)

This code was produced using open source software for educational purpose. Feel free to use and adapt this code as needed or submit changes.
