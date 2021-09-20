
function go_to_the_wall(r::Robot)
    side = [Nord,Ost,Sud,West]
    for i in 1:4
        while !(isborder(r,side[i]))
            move!(r,side[i])
            if !(ismarker(r))
                putmarker!(r)
            end
        end
        go_back(r,i)
    end
end

function go_back(r::Robot,i::Int)
    side = [Sud, West, Nord, Ost]
    while ismarker(r)
        move!(r,side[i])
    end
end