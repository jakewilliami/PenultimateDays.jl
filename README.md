<h1 align="center">PenultimateDays.jl</h1>

Similar to [Dates](https://github.com/JuliaLang/julia/tree/master/stdlib/Dates)' `firstdayof*` and `lastdayof*`, I introduce to you `penultimatedayof*`; a useful function to find the second-to-last day of a measure of time.

Unlike Dates' `*dayof*` functions, I have extended functionality to find, for example, the penultimate _Tuesday_ of a measure of time.  We have also extended some of Dates' `*dayof*` functions to allow this functionality.

## Quick Start

```julia
julia> using Dates, PenultimateDays

julia> d = today()
2022-06-24

julia> penultimatedayofweek(d)
2022-06-25

julia> penultimatedayofmonth(d)
2022-06-29

julia> penultimatedayofmonth(d, Tuesday)
2022-06-21

julia> penultimatedayofquarter(d)
2022-06-29

julia> penultimatedayofquarter(d, Tuesday)
2022-06-21

julia> penultimatedayofyear(d)
2022-12-31

julia> penultimatedayofyear(d, Tuesday)
2022-12-20
```