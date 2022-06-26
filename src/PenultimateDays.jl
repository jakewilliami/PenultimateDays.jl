module PenultimateDays

using Dates

# Dates (stdlib) extended

for m in (:first, :last), t in (:week, :month, :quarter, :year)
    f = Symbol("$(m)dayof$(t)")
    ms, ts = string(m), string(t)
    @eval begin 
        import Dates: $f
        
        @doc """
            $($f)(dt::TimeType, d::Int) -> TimeType
        
        Adjusts `dt` to the $($ms) `d`-day of its $($ts), given some `d`, the day of the week as an `Int`, with `1 = Monday, 2 = Tuesday, &c...`
        
        For example, the `$($f)(dt, 6)` will find the $($ms) Saturday of the $($ts).  Dates also exports integer aliases `Monday`–`Sunday`, so you can write `$($f)(dt, Saturday)`.
        
        See also: `Dates.dayofweek`
        """
        $f
    end
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

firstdayofquarter(dt::TimeType, d::Int) = firstdayofmonth(firstdayofquarter(dt), d)
lastdayofquarter(dt::TimeType, d::Int) = lastdayofmonth(lastdayofquarter(dt), d)

## Year

firstdayofyear(dt::TimeType, d::Int) = firstdayofmonth(firstdayofyear(dt), d)
lastdayofyear(dt::TimeType, d::Int) = lastdayofmonth(lastdayofyear(dt), d)


# Trivial Penultimate Functions

for t in (:week, :month, :quarter, :year)
    f, f′ = Symbol("penultimatedayof$(t)"), Symbol("lastdayof$(t)")
    ts = string(t)
    @eval begin 
        @doc """
            $($f)(dt::TimeType) -> TimeType
        
        Adjusts `dt` to the penultimate (second-to-last) day of its $($ts).
        """
        $f(dt::TimeType) = $f′(dt) - Day(1)
        export $f
    end
end


# Day-specific Penultimate Functions

## Month

"""
    penultimatedayofmonth(dt::TimeType) -> TimeType

Adjusts `dt` to the penultimate (second-to-last) day of its month, given some `d`, the day of the week as an `Int`, with `1 = Monday, 2 = Tuesday, &c...`

For example, the `penultimatedayofmonth(dt, 6)` will find the penultimate Saturday of the month.  Dates also exports integer aliases `Monday`–`Sunday`, so you can write `penultimatedayofmonth(dt, Saturday)`.
        
See also: `Dates.dayofweek`, `lastdayofmonth`
"""
penultimatedayofmonth(dt::TimeType, d::Int) = lastdayofmonth(dt, d) - Week(1)

end  # end module
