using FdeSolver
using Documenter

DocMeta.setdocmeta!(FdeSolver, :DocTestSetup, :(using FdeSolver); recursive=true)

makedocs(;
    modules=[FdeSolver],
    authors="Moein Khalinghi, Giulio Benedetti",
    repo="https://github.com/RiboRings/FdeSolver.jl/blob/{commit}{path}#{line}",
    sitename="FdeSolver.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://RiboRings.github.io/FdeSolver.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/RiboRings/FdeSolver.jl",
)