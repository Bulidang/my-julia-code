#输入 (xᵢ, yᵢ), i = 0, 1, 2, ..., n
#输出 y = y(x)

# lagrange插值
input_x = Array(0.32:0.02:0.36)
input_y = sin.(0.32:0.02:0.36)

function lagrange(x::Array, y::Array, px)
    py = 0.
    for i in 1:length(x)
        λ = 1.
        for j in 1:length(x)
            if j == i
                continue
            end
            λ = λ * (px - x[j]) / (x[i] - x[j])
        end
        py = py + y[i] * λ
    end
    return py
end


# 牛顿插值
function newton(x::Array, y::Array, px)
    py = 0.
    n = length(x)
    #求均差矩阵
    FN = zeros(n, n)
    FN[:, 1] = y
    for j = 2:n, i = j:n
            FN[i, j] = (FN[i, j-1] - FN[i-1, j-1]) / (x[i] - x[i-j+1])
    end

    for k = 2:n
        t = 1.
        for i = 1:(k-1)
            t = t * (px - x[i])
        end
        py = py + t * FN[k, k]
    end
    py = py + FN[1, 1]
    return py
end

println(lagrange(input_x, input_y, 0.3367))
println(newton(input_x, input_y, 0.3367))
println(sin(0.3367))

# using PyPlot
# xx = linspace(0.3, 0.4)
# yy = sin(xx)
# plot(xx, yy)
