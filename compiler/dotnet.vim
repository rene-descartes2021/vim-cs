if exists("current_compiler")
  finish
endif
let current_compiler = "dotnet"
let s:save_cpo = &cpoptions
set cpoptions&vim

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=dotnet\ build\ /v:q\ /property:GenerateFullPaths=true\ /clp:ErrorsOnly
CompilerSet errorformat=\ %#%f(%l\\\,%c):\ %m

let &cpoptions = s:save_cpo
unlet s:save_cpo
