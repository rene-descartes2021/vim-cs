if exists("current_compiler")
  finish
endif
let current_compiler = "dotnet"
let s:keepcpo = &cpo
set cpo&vim

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=dotnet\ build\ /v:q\ /property:GenerateFullPaths=true\ /clp:ErrorsOnly
CompilerSet errorformat=\ %#%f(%l\\\,%c):\ %m

let &cpo = s:keepcpo
unlet s:keepcpo
