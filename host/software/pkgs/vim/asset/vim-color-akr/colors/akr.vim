hi      clear
syntax  reset
let     background    = "dark"
let     g:colors_name = "akr"

hi      Normal            cterm=NONE     gui=NONE     ctermfg=7     guifg=#F2F2F2  ctermbg=0      guibg=#161616
hi      NonText           cterm=NONE     gui=NONE     ctermfg=0     guifg=#161616  ctermbg=0      guibg=#161616
hi      LineNr            cterm=NONE     gui=NONE     ctermfg=241   guifg=#606060  ctermbg=NONE   guibg=NONE

hi      Cursor            cterm=reverse  gui=reverse  ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE
hi      CursorLine        cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=235    guibg=#262626
hi      CursorLineNr      cterm=NONE     gui=NONE     ctermfg=2     guifg=#AADB0F  ctermbg=235    guibg=#262626
hi      CursorColumn      cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#F2F2F2
hi      ColorColumn       cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=2      guibg=#AADB0F
hi      SignColumn        cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=2      guibg=#AADB0F

hi      TabLine           cterm=NONE     gui=NONE     ctermfg=10    guifg=#909636  ctermbg=0      guibg=#161616
hi      TabLineFill       cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=7      guibg=#F2F2F2
hi      TabLineSel        cterm=NONE     gui=NONE     ctermfg=0     guifg=#161616  ctermbg=10     guibg=#909636
hi      StatusLine        cterm=NONE     gui=NONE     ctermfg=10    guifg=#909636  ctermbg=235    guibg=#262626
hi      StatusLineNC      cterm=NONE     gui=NONE     ctermfg=10    guifg=#909636  ctermbg=0      guibg=#161616
hi      VertSplit         cterm=NONE     gui=NONE     ctermfg=235   guifg=#262626  ctermbg=235    guibg=#262626
hi      Visual            cterm=NONE     gui=NONE     ctermfg=3     guifg=#E4E093  ctermbg=1      guibg=#8C3346
hi      VisualNOS         cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE

hi      Pmenu             cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=232    guibg=#080808
hi      PmenuSbar         cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=235    guibg=#262626
hi      PmenuSel          cterm=NONE     gui=NONE     ctermfg=2     guifg=#AADB0F  ctermbg=241    guibg=#606060
hi      PmenuThumb        cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=247    guibg=#9e9e9e

hi      DiffAdd           cterm=NONE     gui=NONE     ctermfg=0     guifg=#161616  ctermbg=10     guibg=#909636
hi      DiffChange        cterm=NONE     gui=NONE     ctermfg=0     guifg=#161616  ctermbg=3      guibg=#E4E093
hi      DiffDelete        cterm=NONE     gui=NONE     ctermfg=0     guifg=#161616  ctermbg=1      guibg=#8C3346
hi      DiffText          cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=4      guibg=#352F6A

hi      Search            cterm=NONE     gui=NONE     ctermfg=0     guifg=#161616  ctermbg=10     guibg=#909636
hi      IncSearch         cterm=NONE     gui=NONE     ctermfg=0     guifg=#161616  ctermbg=2      guibg=#AADB0F

hi      Comment           cterm=NONE     gui=italic   ctermfg=7     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      Type              cterm=NONE     gui=NONE     ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE
hi      Boolean           cterm=NONE     gui=NONE     ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE
hi      String            cterm=NONE     gui=NONE     ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE
hi      Number            cterm=NONE     gui=NONE     ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE
hi      Title             cterm=bold     gui=bold     ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE
hi      Constant          cterm=bold     gui=italic   ctermfg=7     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      Identifier        cterm=bold     gui=bold     ctermfg=7     guifg=#F2F2F2  ctermbg=0      guibg=#161616
hi      Statement         cterm=bold     gui=bold     ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE
hi      StorageClass      cterm=bold     gui=bold     ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE
hi      Conditional       cterm=bold     gui=bold     ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE

hi      MatchParen        cterm=bold     gui=bold     ctermfg=0     guifg=#161616  ctermbg=2      guibg=#AADB0F
hi      Special           cterm=NONE     gui=NONE     ctermfg=7     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      Tabs              cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=235    guibg=#262626
hi      ColorColumn       cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=7      guibg=#F2F2F2
hi      Conceal           cterm=NONE     gui=NONE     ctermfg=7     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      Directory         cterm=NONE     gui=NONE     ctermfg=7     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      Error             cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=1      guibg=#8C3346
hi      ErrorMsg          cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=1      guibg=#8C3346
hi      FoldColumn        cterm=NONE     gui=NONE     ctermfg=7     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      Folded            cterm=NONE     gui=NONE     ctermfg=7     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      Ignore            cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE
hi      ModeMsg           cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE
hi      MoreMsg           cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE
hi      Question          cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE
hi      SignColumn        cterm=NONE     gui=NONE     ctermfg=7     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      Underlined        cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE
hi      WarningMsg        cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=9      guibg=#FF0000
hi      WildMenu          cterm=NONE     gui=NONE     ctermfg=0     guifg=#161616  ctermbg=10     guibg=#909636
hi      PreProc           cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE

hi      xmlTagName        cterm=NONE     gui=NONE     ctermfg=7     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      xmlEndTag         cterm=NONE     gui=NONE     ctermfg=7     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      xmlNamespace      cterm=bold     gui=bold     ctermfg=7     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      xmlAttrib         cterm=NONE     gui=NONE     ctermfg=7     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE

hi      texSection        cterm=bold     gui=bold     ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE
hi      texMathZoneX      cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#000000
hi      texMathText       cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#000000
hi      texMathSymbol     cterm=bold     gui=bold     ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#000000
hi      texMathOper       cterm=bold     gui=bold     ctermfg=2     guifg=#AADB0F  ctermbg=8      guibg=#000000
hi      texMathMatcher    cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#000000
hi      texTypeStyle      cterm=bold     gui=bold     ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#000000
hi      texStatement      cterm=bold     gui=bold     ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE
hi      texGreek          cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#000000
hi      texBeginEnd       cterm=NONE     gui=NONE     ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE
hi      texSubscript      cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#000000
hi      texSuperscript    cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#000000
hi      texBeginEndName   cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE
hi      Conceal           cterm=NONE     gui=NONE     ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#000000

hi      prologClauseHead  cterm=NONE     gui=NONE     ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE

match  Tabs /[\t]\+/
