using HorizonSideRobots
function member_steps_nord_west(side::HorizonSide)
    c = 0
    while !(isborder(r,side))
        move!(r,side)
        c+=1
    end
    return c
end

function movements_and_putmarkers!(robot::Robot,s::HorizonSide)
    while !isborder(robot,s)
        putmarker!(robot)
        move!(robot,s)
    end
    putmarker!(robot)
end

function mark_all(r::Robot)
    j = 0
    while !isborder(r,Sud)
        sides = [Ost,West]
        j = (j%2) + 1
        movements_and_putmarkers!(r,sides[j])
        move!(r,Sud)
    end
    if isborder(r,West)
        movements_and_putmarkers!(r,Ost)
    else
        movements_and_putmarkers!(r,West)
    end
end

function rever(steps, side)
    for i in 1:steps
        move!(r, side)
    end
end


nord_steps = member_steps_nord_west(Nord)
west_steps = member_steps_nord_west(West)
mark_all(r)
member_steps_nord_west(Nord)
member_steps_nord_west(West)
rever(nord_steps, Sud)
rever(west_steps, Ost)