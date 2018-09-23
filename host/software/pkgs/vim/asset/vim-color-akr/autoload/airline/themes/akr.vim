" Normal mode
"          [ guifg     , guibg     , ctermfg , ctermbg ]
let s:N1 = [ '#161616' , '#909636' , 0       , 10 ] " mode
let s:N2 = [ '#161616' , '#909636' , 0       , 10 ] " info
let s:N3 = [ '#909636' , '#161616' , 10      , 0  ] " statusline
let s:N4 = [ '#352F6A' , 4                        ] " mode modified

" Insert mode
let s:I1 = [ '#E4E093' , '#352F6A' , 3       , 4 ]
let s:I2 = [ '#E4E093' , '#352F6A' , 3       , 4 ]
let s:I3 = [ '#909636' , '#161616' , 10      , 0 ]
let s:I4 = [ '#352F6A' , 4                       ]

" Visual mode
let s:V1 = [ '#E4E093' , '#8C3346' , 3       , 1 ]
let s:V2 = [ '#E4E093' , '#8C3346' , 3       , 1 ]
let s:V3 = [ '#909636' , '#161616' , 10      , 0 ]
let s:V4 = [ '#352F6A' , 4                       ]

" Replace mode
let s:R1 = [ '#E4E093' , '#352F6A' , 3       , 4 ]
let s:R2 = [ '#E4E093' , '#352F6A' , 3       , 4 ]
let s:R3 = [ '#909636' , '#161616' , 10      , 0 ]
let s:R4 = [ '#352F6A' , 4                       ]

" Paste mode
let s:PA = [ '#352F6A' , 4 ]

" Info modified
let s:IM = [ '#909636' , 10 ]

" Inactive mode
let s:IA = [ '#767676' , s:N3[1] , 243 , s:N3[3] , '' ]

let g:airline#themes#akr#palette = {}

let g:airline#themes#akr#palette.accents = {
      \ 'red': [ '#8C3346' , '' , 1 , '' , '' ],
      \ }

let g:airline#themes#akr#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#akr#palette.normal_modified = {
    \ 'airline_a': [ s:N1[0] , s:N4[0] , s:N1[2] , s:N4[1] , ''     ] ,
    \ 'airline_b': [ s:N4[0] , s:IM[0] , s:N4[1] , s:IM[1] , ''     ] ,
    \ 'airline_c': [ s:N4[0] , s:N3[1] , s:N4[1] , s:N3[3] , ''     ] }


let g:airline#themes#akr#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#akr#palette.insert_modified = {
    \ 'airline_a': [ s:I1[0] , s:I4[0] , s:I1[2] , s:I4[1] , ''     ] ,
    \ 'airline_b': [ s:I4[0] , s:IM[0] , s:I4[1] , s:IM[1] , ''     ] ,
    \ 'airline_c': [ s:I4[0] , s:N3[1] , s:I4[1] , s:N3[3] , ''     ] }


let g:airline#themes#akr#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#akr#palette.visual_modified = {
    \ 'airline_a': [ s:V1[0] , s:V4[0] , s:V1[2] , s:V4[1] , ''     ] ,
    \ 'airline_b': [ s:V4[0] , s:IM[0] , s:V4[1] , s:IM[1] , ''     ] ,
    \ 'airline_c': [ s:V4[0] , s:N3[1] , s:V4[1] , s:N3[3] , ''     ] }


let g:airline#themes#akr#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#akr#palette.replace_modified = {
    \ 'airline_a': [ s:R1[0] , s:R4[0] , s:R1[2] , s:R4[1] , ''     ] ,
    \ 'airline_b': [ s:R4[0] , s:IM[0] , s:R4[1] , s:IM[1] , ''     ] ,
    \ 'airline_c': [ s:R4[0] , s:N3[1] , s:R4[1] , s:N3[3] , ''     ] }


let g:airline#themes#akr#palette.insert_paste = {
    \ 'airline_a': [ s:I1[0] , s:PA[0] , s:I1[2] , s:PA[1] , ''     ] ,
    \ 'airline_b': [ s:PA[0] , s:IM[0] , s:PA[1] , s:IM[1] , ''     ] ,
    \ 'airline_c': [ s:PA[0] , s:N3[1] , s:PA[1] , s:N3[3] , ''     ] }


let g:airline#themes#akr#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#akr#palette.inactive_modified = {
    \ 'airline_c': [ s:N4[0] , ''      , s:N4[1] , ''      , ''     ] }


if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#akr#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ '#909636' , '#161616' , 10 , 0  , ''     ] ,
      \ [ '#909636' , '#161616' , 10 , 0  , ''     ] ,
      \ [ '#161616' , '#909636' , 0  , 10 , 'bold' ] )
