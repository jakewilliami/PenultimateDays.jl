module PenultimateDays

using Dates

for t in (:week, :month, :quarter, :year)
    pf = Symbol("penultimatedayof$(t)")
    @eval $pf(dt::TimeType) = error("not yet implemented")
    @eval $pf(dt::TimeType, d::Int) = error("not yet implemented")
    @eval export $pf
end

# Dates (stdlib) extended

for m in (:first, :last), t in (:week, :month, :quarter, :year)
    ef = Symbol("$(m)dayof$(t)")
    @eval begin
        import Dates: $ef
        export $ef
    end
end

function firstdayofmonth(dt::TimeType, d::Int)
    fd_date = firstdayofmonth(dt)
    fd_i = dayofweek(fd_date)
    fd_day = d - fd_i + 1
    fd_i > d && (fd_day += 7)
    return fd_date + Day(fd_day - 1)
end

end  # end module
