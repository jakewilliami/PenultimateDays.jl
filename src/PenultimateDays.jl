module PenultimateDays

using Dates

for t in (:week, :month, :quarter, :year)
    pf = Symbol("penultimatedayof$(t)")
    @eval $pf(dt::TimeType) = error("not yet implemented")
    @eval $pf(dt::TimeType, d::Int) = error("not yet implemented")
    @eval export $pf
    for m in (:first, :last)
        ef = Symbol("$(m)dayof$(t)")
        @eval import Dates: $ef
        @eval $ef(dt::TimeType, d::Int) = error("not yet implemented")
        @eval export $ef
    end
end

end  # end module
