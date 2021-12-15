function search_line!()
    while true
        if !isborder(r,Nord)
            move!(r,West)
            if !isborder(r,Nord)
                move!(r,Nord)
            else
                break
            end
        else
            break
        end
    end
    
end


function search_passage!(steps::Int)
    while isborder(r,Nord)
        go!(West,steps)
        go!(Ost,steps)
        go!(Ost,steps)
        go!(West,steps)
        steps += 1
    end
end

function go!(side::HorizonSide,steps::Int)
    for i in 1:steps
        if isborder(r,Nord)
            move!(r,side)
        end
    end
end 


search_line!()

search_passage!(1)
