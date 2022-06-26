# PenultimateDays.jl Documentation

```@contents
```

```@meta
CurrentModule = PenultimateDays
DocTestSetup = quote
    using PenultimateDays
end
```

## Adding PenultimateDays.jl
```@repl
using Pkg
Pkg.add("PenultimateDays")
```

## Documentation

### Trivial Penultimate Functions
```@docs
penultimatedayofweek(::TimeType)
penultimatedayofmonth(::TimeType)
penultimatedayofquarter(::TimeType)
penultimatedayofyear(::TimeType)
```

### Day-specific Penultimate Functions
```@docs
penultimatedayofmonth(::TimeType, ::Int)
penultimatedayofquarter(::TimeType, ::Int)
penultimatedayofyear(::TimeType, ::Int)
```

### Dates (Standard Library) Extended
```@docs
firstdayofweek(::TimeType, ::Int)
lastdayofweek(::TimeType, ::Int)
firstdayofmonth(::TimeType, ::Int)
lastdayofmonth(::TimeType, ::Int)
firstdayofquarter(::TimeType, ::Int)
lastdayofquarter(::TimeType, ::Int)
firstdayofyear(::TimeType, ::Int)
lastdayofyear(::TimeType, ::Int)
```

## Index

```@index
```