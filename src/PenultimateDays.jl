module PenultimateDays

using Dates

for t in (:week, :month, :quarter, :year)
    pf = Symbol("penultimatedayof$(t)")
    @eval $pf(dt::TimeType) = error("not yet implemented")
    @eval $pf(dt::TimeType, d::Int) = error("not yet implemented")
    @eval export $pf
end

for t in (:week, :month, :quarter, :year)
    for m in (:first, :last)
        ef = Symbol("$(m)dayof$(t)")
        @eval begin
            import Dates: $ef
            function $ef(dt::TimeType, d::Int)
                error("not yet implemented")
            end
            export $ef
        end
    end
end

end  # end module
