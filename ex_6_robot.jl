function back!(side,steps)
    for i in 1:steps
        move!(r,side)
    end
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





function go_sud_west_and_count!()
    while !isborder(r,Sud) || !isborder(r,West)
        move_and_count!(Sud)
        move_and_count!(West)
    end
end

function move_and_search!()
    while !isborder(r,Nord)
        move!(r,Nord)
        if isborder(r,Ost)
            return Nord
        end
    end
    move!(r,Ost)
    while !isborder(r,Sud)
        move!(r,Sud)
        if isborder(r,Ost)
            return Sud
        end
    end
    move!(r,Ost)
end
function go!(side::HorizonSide)
    while !isborder(r,side)
        move!(r,side)
    end
end
function mark_rect()
    k = move_and_search!()
    if k == Nord
        for i in [Nord,Ost,Sud,West]
            while isborder(r,HorizonSide(mod(Int(i)+3,4)))
                putmarker!(r)
                move!(r,i)
            end
            putmarker!(r)
            move!(r,HorizonSide(mod(Int(i)+3,4)))
        end
    else
        for i in [Sud,Ost,Nord,West]
            while isborder(r,HorizonSide(mod(Int(i)+1,4)))
                putmarker!(r)
                move!(r,i)
            end
            putmarker!(r)
            move!(r,HorizonSide(mod(Int(i)+1,4)))
        end
    end
end

go_sud_west_and_count!()
mark_rect()
go!(Sud)
go!(West)
reverse!(all_side_steps)
for i in 1:length(all_side_steps)
    back!(HorizonSide(mod(Int(all_side_steps[i][1])+2,4)),all_side_steps[i][2])
end