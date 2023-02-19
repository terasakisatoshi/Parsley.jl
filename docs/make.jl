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

import Pkg;
Pkg.activate("page/Project.toml")
Pkg.instantiate()
using NodeJS;
run(`$(npm_cmd()) install highlight.js purgecss`);
import PkgPage;
PkgPage.optimize(input="page", output="page");
run(`mv page/__site/page docs/build/page`)
Pkg.activate("docs/Project.toml")

deploydocs(;
    repo="github.com/terasakisatoshi/Parsley.jl",
    devbranch="main",
)
