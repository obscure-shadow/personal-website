let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Desktop/job/personal_site
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 resume.html
badd +1 resume.css
argglobal
silent! argdel *
$argadd resume.html
edit resume.html
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=1 winminwidth=1 winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 111 + 79) / 158)
exe 'vert 2resize ' . ((&columns * 46 + 79) / 158)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 67 - ((28 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
67
let s:c = 8 - ((5 * winwidth(0) + 55) / 111)
if s:c > 0
  exe 'normal! ' . s:c . '|zs' . 8 . '|'
else
  normal! 08|
endif
lcd ~/Desktop/job/personal_site
wincmd w
argglobal
if bufexists('~/Desktop/job/personal_site/resume.css') | buffer ~/Desktop/job/personal_site/resume.css | else | edit ~/Desktop/job/personal_site/resume.css | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 10 - ((9 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
10
normal! 010|
lcd ~/Desktop/job/personal_site
wincmd w
exe 'vert 1resize ' . ((&columns * 111 + 79) / 158)
exe 'vert 2resize ' . ((&columns * 46 + 79) / 158)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
