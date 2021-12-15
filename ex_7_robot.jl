function check(f::Bool)
    if f
        return true
    else
        return false
    end
end

function go_and_mark!(side::HorizonSide,flag::Bool)
    while !isborder(r,side)
        if flag
            putmarker!(r)
            move!(r,side)
            flag = false 
        else
            move!(r,side)
            flag = true
        end
    end
    if check(flag)
        putmarker!(r)
    end
    return !flag
end

function go_sud_west_and_check!()
    steps_down = 0
    flag = true
    while !isborder(r,Sud)
        move!(r,Sud)
        steps_down += 1
        flag = (steps_down%2==0)
    end
    tmp = steps_down
    while !isborder(r,West)
        move!(r,West)
        tmp += 1
        flag = (tmp%2==0)
    end
    steps_left = tmp - steps_down
    return steps_down,steps_left,flag
end
function go!(side::HorizonSide)
    while !isborder(r,side)
        move!(r,side)
    end
end
function back!(side::HorizonSide,steps::Int)
    for i in 1:steps
        move!(r,side)
    end
end
function main(flag::Bool)
    while !isborder(r,Nord) || !isborder(r,Ost)
        flag = go_and_mark!(Ost, flag)
        if !isborder(r,Nord)
            move!(r,Nord)
        else
            break
        end
        go_and_mark!(West,flag)
        if !isborder(r,Nord)
            move!(r,Nord)
        end
    end
end

putmarker!(r)
steps_down, steps_left,flag = go_sud_west_and_check!()
main(flag)
go!(Sud)
go!(West)
back!(Ost,steps_left)
back!(Nord,steps_down)
