# This file was generated, do not modify it. # hide
using SCS, JuMP, LinearAlgebra, ControlSystems
A=[
    0.0  1.0    0.0
    0.0  0.0    1.0
    -1.0  -2.0  -3.0
]
Q=Matrix(1.0I,3,3)
n1,=size(A);

model = Model(SCS.Optimizer)
@variable(model,X[1:n1,1:n1],PSD)
@objective(model, Min, tr(X))
@constraint(model, -(A'*X+X*A+Q) in PSDCone())
optimize!(model)

@show P=value.(X)

@show eigvals(A'*P+P*A)

@show lyap(A',Q)