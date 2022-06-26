include(joinpath(dirname(@__DIR__), "src", "PenultimateDays.jl"))
using Documenter, .PenultimateDays

Documenter.makedocs(
    clean = true,
    doctest = true,
    modules = Module[PenultimateDays],
    repo = "",
    highlightsig = true,
    sitename = "PenultimateDays Documentation",
    expandfirst = [],
    pages = [
        "Index" => "index.md",
    ]
)

deploydocs(;
    repo  =  "github.com/jakewilliami/PenultimateDays.jl.git",
)
