function search_snake!(steps::Int,side::HorizonSide)
    for _ in 1:steps
        if ismarker(r)
            return true
        else
        move!(r,side)
        end
    end
    return false
end


function main()
    steps = 1
    k = 0
    while true
        flag = false
        for i in [Nord,West,Sud,Ost]
            flag = search_snake!(steps,i)
            steps += (k%2)
            k += 1
            if flag
                break
            end
        end
        if flag
            break
        end
    end
end

main()