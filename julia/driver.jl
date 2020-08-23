include("modules/roots.jl")
include("modules/interpolate.jl")

using .Root
using .Interpolate


function main()

    # f(x) = x - (x^3 + 4*x^2 - 10) / (3*x^2 + 8*x)
    # zero = Root.bisection_method(f, -2, -3)
    # sol = Root.fixed_point(f, 1.5)
    # println(sol)

    # x = 1940:10:1990
    # q = [132165, 151326, 179323, 203302, 226542, 249633]
    # println(Interpolate.nevilles_method(2000, 5, x, q))

    # x = [8.1, 8.3, 8.6, 8.7]
    # y = [16.9446, 17.56492, 18.50515, 18.82091]
    # println(Interpolate.newtons_difference(x, y))

    x = [1.3, 1.6, 1.9]
    f = [0.6200860, 0.4554022, 0.2818186]
    fprime = [-0.5220232, -0.5698959, -0.5811571]
    Interpolate.hermites_method(x, f, fprime)

end

main()
