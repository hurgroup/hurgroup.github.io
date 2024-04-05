# This file was generated, do not modify it. # hide
using JuMP, LinearAlgebra, ControlSystems
# using SCS
# using ProxSDP
using Clarabel
A=[
    0.0  1.0    0.0
    0.0  0.0    1.0
    1.0  -2.0  -3.0
]
B=[
    0.0
    0.0
    1.0
]

n1,=size(A);
Q=Matrix(1.0I,n1,n1)
model = Model(Clarabel.Optimizer)
@variable(model,Xi[1:n1,1:n1],PSD)
@variable(model,L[1,1:n1])
# @objective(model, Max, 0)
@objective(model, Max, tr(Xi))
# @constraint(model, Xi.==Xi')
# @constraint(model, Xi in PSDCone())
@constraint(model, -[Xi*A'+L'*B'+A*Xi+B*L Xi;Xi -inv(Q)] in PSDCone())
# @constraint(model, -(Xi*A'+L'*B'+A*Xi+B*L+Q) in PSDCone())
# @constraint(model, -[Xi*A'+L'*B'+A*Xi+B*L Xi*Q;Xi*Q -I] in PSDCone())
# JuMP.optimize!(model)
optimize!(model)
Pi=value.(Xi)
LL=Array(value.(L))
K=LL*inv(Pi)