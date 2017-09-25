type Point
    x::Float64
    y::Float64
end

type Vector2D
    x::Float64
    y::Float64
end

p = Point(2, 5)
v = Vector2D(3, 2)

++(p::Point, v::Vector2D) = Point(p.x+v.x, p.y+v.y)

p++v

workspace()
function col_iter(x)
    s = zero(eltype(x))
    for i = 1:size(x,2)
        for j = 1:size(x,1)
            s = s + x[j, i]^2
        end
    end
    return s, x
end

col_iter([1 2.2;3 4])

f(x, p=0.0) = exp(p*x)*sin(x);
t = linspace(0.0,8pi);
w = zeros(t);
for i = 1:length(w) w[i] = f(t[i], 0.1) end;
using PyPlot
plot(t, w)
