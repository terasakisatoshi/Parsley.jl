using Parsley
using Documenter

DocMeta.setdocmeta!(Parsley, :DocTestSetup, :(using Parsley); recursive=true)

makedocs(;
    modules=[Parsley],
    authors="SatoshiTerasaki <terasakisatoshi.math@gmail.com> and contributors",
    repo="https://github.com/terasakisatoshi/Parsley.jl/blob/{commit}{path}#{line}",
    sitename="Parsley.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://terasakisatoshi.github.io/Parsley.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/terasakisatoshi/Parsley.jl",
    devbranch="main",
)
