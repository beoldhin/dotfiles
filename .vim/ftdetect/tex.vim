set shiftwidth=2
set iskeyword+=:
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='latexmk -pdf -outdir=../build $*'

