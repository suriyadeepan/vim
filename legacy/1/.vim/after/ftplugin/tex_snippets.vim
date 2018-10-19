let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim


exec "Snippet inc #include \"".st.et.".h\"".st.et


if !exists('loaded_snippet') || &cp
    finish
endif


let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim


"exec "Snippet sub \\subsection{".st."name".et."}\\label{sub:".st."name:substitute(@z,'.','\\l&','g')".et."}<CR>".st.et
"exec "Snippet $$ \\[<CR>".st.et."<CR>\\]<CR>".st.et
"exec "Snippet ssub \\subsubsection{".st."name".et."}\\label{ssub:".st."name:substitute(@z,'.','\\l&','g')".et."}<CR>".st.et
"exec "Snippet itd \\item[".st."desc".et."] ".st.et
"exec "Snippet sec \\section{".st."name".et."}\\label{sec:".st."name:substitute(@z,'.','\\l&','g')".et."}<CR>".st.et

exec "Snippet sub \\subsection{".st.et."}\\label{sub:".st."name:substitute(@z,'.','\\l&','g')".et."}<CR>".st.et
exec "Snippet $$ \\[<CR>".st.et."<CR>\\]<CR>".st.et
exec "Snippet ssub \\subsubsection{".st.et."}\\label{ssub:".st."name:substitute(@z,'.','\\l&','g')".et."}<CR>".st.et
exec "Snippet itd \\item[".st.et."] ".st.et
exec "Snippet sec \\section{".st.et."}\\label{sec:".st."name:substitute(@z,'.','\\l&','g')".et."}<CR>".st.et

exec "Snippet align %Align options - center, flushleft, flushright<CR>\\begin{<{center}>}\\vspace{1cm}<CR><CR><CR>\\end{<{center}>}\\vspace{1cm}"

exec "Snippet bullets \\begin{itemize}<CR>\\item{".st.et."}<CR>\\item{".st.et."}<CR>\\end{itemize}"




"exec "Snippet name_test My name is <{forename}> <{surname}>. Call me <{forename}>."


exec "Snippet fig %\\includegraphics[width=0.5\\linewidth]{file_name}<CR> %\\captionof{figure}{\\color{Green} Write some caption here}<CR> \\includegraphics[width=".st.et."\\linewidth]{".st.et."}<CR>\\captionof{figure}{\\color{Green} ".st.et."}"


