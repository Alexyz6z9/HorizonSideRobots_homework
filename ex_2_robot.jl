function Kolya_steps(side::HorizonSide)
    c = 0
    while !(isborder(r,side))
        move!(r,side)
        c+=1
    end
    return c
end

function marks_perim(r::Robot)
    for i in [Ost, Sud, West, Nord]
        while !(isborder(r,i))
            putmarker!(r)
            move!(r,i)

        end
    end
end

function rever(steps, side)
    for i in 1:steps
        move!(r, side)
    end
    
end

nord_steps = Kolya_steps(Nord)
west_steps = Kolya_steps(West)
marks_perim(r)
rever(nord_steps,Sud)
rever(west_steps,Ost)