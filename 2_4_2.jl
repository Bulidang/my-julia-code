# 上三角型矩阵； 回代法
function upper_triangular(A, b)
    x = zeros(length(b))
    for j in length(b):-1:1
        if A[j, j] == 0 break end
        x[j] = b[j] / A[j, j]
        for i = 1:j-1
            b[i] = b[i] - A[i, j] * x[j]
        end
    end
    return x
end

# 下三角型矩阵 lower_triangular
function lower_triangular(L, b)
    x = zeros(length(b))
    for j = 1:length(b)
        if L[j, j] == 0 break end
        x[j] = b[j] / L[j, j]
        for i = (j + 1) : length(b)
            b[i] = b[i] - L[i, j] * x[j]
        end
    end
    return x
end

# 例子
A = [1 2 2; 0 -4 -6; 0 0 -1]
b = [3, -6, 1]
# x = A\b
show(upper_triangular(A, b))

show(lower_triangular(A, b))

