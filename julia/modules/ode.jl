module ODE

function eulers_method(f::Function, α::Real, a::Real, b::Real, N::Int64)

    n1 = N + 1
    u = zeros(n1,2)

    h = (b - a) / N
    u[1,1] = a
    u[1,2] = α

    for i in 2:n1
        u[i,2] = u[i-1,2] + h * f(u[i-1,1], u[i-1,2])
        u[i,1] = a + (i - 1) * h
    end

    return u
end

function rk4_method(f::Function, α::Real, a::Real, b::Real, N::Int64)

    n1 = N + 1
    u = zeros(n1,2)

    h = (b - a) / N
    u[1,1] = a
    u[1,2] = α

    for i in 2:n1
        t = u[i-1,1]
        w = u[i-1,2]

        k1 = h * f(t, w)
        k2 = h * f(t + h / 2, w + k1 / 2)
        k3 = h * f(t + h / 2, w + k2 / 2)
        k4 = h * f(t + h, w + k3)

        u[i,2] = w + (k1 + 2 * k2 + 2 * k3 + k4) / 6
        u[i,1] = a + (i - 1) * h
    end

    return u
end

function rk4_system(f::AbstractArray, α::AbstractArray, a::Real, b::Real, N::Int64)

    n1 = N + 1
    m = size(f)[1]

    u = zeros(n1, m + 1)

    h = (b - a) / N
    u[1,1] = a
    u[1,2:end] = α

    v = zeros(m)
    for i in 2:n1
        t = u[1,i-1]

        for j in 1:m
            wj = u[i-1,j+1]

            k1 = h * f(t, wj)
            k2 = h * f(t + h / 2, wj + k1 / 2)
            k3 = h * f(t + h / 2, wj + k2 / 2)
            k4 = h * f(t + h, wj + k3)

            u[i,j+1] = wj + (k1 + 2 * k2 + 2 * k3 + k4) / 6
        end

        u[i,1] = a + (i - 1) * h
    end

    return u
end


end # end of module
