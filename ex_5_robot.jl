function go!(side::HorizonSide)
    while !isborder(r,side)
        move!(r,side)
    end
end

function back!(side,steps)
    for i in 1:steps
        move!(r,side)
    end
end

function inverse(side::HorizonSide)
    return HorizonSide(mod(Int(side)+2,4))

end

function move_and_count!(side::HorizonSide)
    c = 0
    while !isborder(r,side)
        move!(r,side)
        c += 1
    end
    side_steps = []
    push!(side_steps,side)
    push!(side_steps,c)
    push!(all_side_steps,side_steps)
end
all_side_steps = []
while !isborder(r,Sud) || !isborder(r,West)
    move_and_count!(Sud)
    move_and_count!(West)
end
 
sides = [Ost,Nord,West,Sud]
for i in 1:4
    putmarker!(r)
    go!(sides[i])
end

reverse!(all_side_steps)
for i in 1:length(all_side_steps)
    back!(inverse(all_side_steps[i][1]),all_side_steps[i][2])
end

