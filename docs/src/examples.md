# Examples

## Basic examples

```julia
julia> using Dates, PenultimateDays

julia> d = today()
2022-06-24

julia> penultimatedayofweek(d)  # second-to-last day of the week
2022-06-25

julia> penultimatedayofmonth(d)  # second-to-last day of the month
2022-06-29

julia> penultimatedayofmonth(d, Tuesday)  # second-to-last Tuesday of the month
2022-06-21

julia> penultimatedayofquarter(d)  # second-to-last day of the quarter
2022-06-29

julia> penultimatedayofquarter(d, Tuesday)  # second-to-last Tuesday of the quarter
2022-06-21

julia> penultimatedayofyear(d)  # second-to-last day of the year
2022-12-31

julia> penultimatedayofyear(d, Tuesday)  # second-to-last Tuesday of the year
2022-12-20
```

## Extending the Dates standard library

We have also extended the Dates standard library to allow specification of day for `*dayof*` functions:
```julia
julia> using Dates, PenultimateDays

julia> d = today()
2022-06-24

julia> firstdayofmonth(d, Tuesday)
2022-06-07

julia> lastdayofmonth(d, Tuesday)
2022-06-28
```

See also `test/runtests.jl` in the repository.