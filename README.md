<h1 align="center">PenultimateDays.jl</h1>

<!-- [![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://jakewilliami.github.io/PenultimateDays.jl/stable) -->
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://jakewilliami.github.io/PenultimateDays.jl/dev)
[![CI](https://github.com/invenia/PkgTemplates.jl/workflows/CI/badge.svg)](https://github.com/jakewilliami/PenultimateDays.jl/actions?query=workflow%3ACI)
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)
<!-- ![Project Status](https://img.shields.io/badge/status-maturing-green) -->

Similar to [Dates](https://github.com/JuliaLang/julia/tree/master/stdlib/Dates)' `firstdayof*` and `lastdayof*`, I introduce to you `penultimatedayof*`; a useful function to find the second-to-last day of a measure of time.

Unlike Dates' `*dayof*` functions, I have extended functionality to find, for example, the penultimate _Tuesday_ of a measure of time.  We have also extended some of Dates' `*dayof*` functions to allow this functionality.

See also [jakewilliami/pt](https://github.com/jakewilliami/pt) for a command-line implementation using logic from this package.

## Quick Start

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

## Citation

If your research depends on PenultimateDays.jl, please consider giving us a formal citation: [`citation.bib`](./citation.bib).
