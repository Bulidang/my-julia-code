# 多项式求解，page296
# 一般写法
function g(x, a...)
    p = zero(x)
    for i in 1:length(a)
        p = p + a[i]*x^(i-1)
    end
    return p
end

# 我的最初写法
function f(x, a...)
    b = zero(x)
    for i = reverse(a)  # reverse 减慢了计算的速率
        b = x * b + i
    end
    return b
end

# horner算法
function f_horner(x, a...)
    b = zero(x)
      for i in length(a):-1:1
          b = a[i] + b * x
      end
    return b
end

# horner+宏定义
macro horner(x, p...)
    ex = esc(p[end])
    for i = length(p)-1:-1:1
        ex = :(muladd(t, $ex, $(esc(p[i]))))
    end
    Expr(:block, :(t = $(esc(x))), ex)
end

@horner(3.5, 1,2,3,4,5)
