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
    @eval import Dates: $ef
end

## Week
function firstdayofweek(dt::TimeType, d::Int)
    fd_date = firstdayofweek(dt)
    return fd_date + Day(d - 1)
end

lastdayofweek(dt::TimeType, d::Int) = firstdayofweek(dt, d)

## Month
function firstdayofmonth(dt::TimeType, d::Int)
    fd_date = firstdayofmonth(dt)
    fd_i = dayofweek(fd_date)
    fd_day = d - fd_i + 1 + 7(fd_i > d)
    return fd_date + Day(fd_day - 1)
end

function lastdayofmonth(dt::TimeType, d::Int)
    ld_date = lastdayofmonth(dt)
    ld_i = dayofweek(ld_date)
    ld_day = 7(ld_i < d) - d + ld_i + 1
    return ld_date - Day(ld_day - 1)
end

## Quarter

## Year

end  # end module
