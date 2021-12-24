temp = 0
count = 0
function go_and_count_and_take_temp!(side::HorizonSide)
    while !isborder(r,side)
        if ismarker(r)
           global temp += temperature(r)
           global count += 1
        end
        move!(r,side)
    end
    if ismarker(r)
        global temp += temperature(r)
        global count += 1
     end
    if !isborder(r,Nord)
        move!(r,Nord)
    end
end

length = 1
function measure_the_length!()
    while !isborder(r,Nord)
        move!(r,Nord)
        global length += 1
    end
    while !isborder(r,Sud)
        move!(r,Sud)
    end
end

function main()
    while !isborder(r,Nord) || !isborder(r,Ost)
        go_and_count_and_take_temp!(Ost)
        if isborder(r,Nord)  && isborder(r,Ost)
            if length%2==0
                go_and_count_and_take_temp!(West)
            end
            break
        else
            go_and_count_and_take_temp!(West)
        end
    end
end
measure_the_length!()
main()
print(temp,"  ", count)
