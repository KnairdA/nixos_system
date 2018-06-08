hi      clear
syntax  reset
let     background    = "dark"
let     g:colors_name = "akr"

hi      Normal            cterm=NONE    ctermfg=8     guifg=#F2F2F2  ctermbg=0      guibg=#161616
hi      NonText           cterm=NONE    ctermfg=0     guifg=#161616  ctermbg=0      guibg=#161616
hi      LineNr            cterm=NONE    ctermfg=241   guifg=#606060  ctermbg=NONE   guibg=NONE

hi      Cursor            cterm=NONE    ctermfg=235   guifg=#262626  ctermbg=0      guibg=#161616
hi      CursorLine        cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=235    guibg=#262626
hi      CursorLineNr      cterm=NONE    ctermfg=2     guifg=#AADB0F  ctermbg=235    guibg=#262626
hi      CursorColumn      cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#F2F2F2
hi      ColorColumn       cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=2      guibg=#AADB0F
hi      SignColumn        cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=2      guibg=#AADB0F

hi      TabLine           cterm=NONE    ctermfg=10    guifg=#909636  ctermbg=0      guibg=#161616
hi      TabLineFill       cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#F2F2F2
hi      TabLineSel        cterm=NONE    ctermfg=0     guifg=#161616  ctermbg=10     guibg=#909636
hi      StatusLine        cterm=NONE    ctermfg=10    guifg=#909636  ctermbg=235    guibg=#262626
hi      StatusLineNC      cterm=NONE    ctermfg=10    guifg=#909636  ctermbg=235    guibg=#262626
hi      VertSplit         cterm=NONE    ctermfg=235   guifg=#262626  ctermbg=235    guibg=#262626
hi      Visual            cterm=NONE    ctermfg=3     guifg=#E4E093  ctermbg=1      guibg=#8C3346
hi      VisualNOS         cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE

hi      Pmenu             cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=232    guibg=#080808
hi      PmenuSbar         cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=235    guibg=#262626
hi      PmenuSel          cterm=NONE    ctermfg=2     guifg=#AADB0F  ctermbg=241    guibg=#606060
hi      PmenuThumb        cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=247    guibg=#9e9e9e

hi      DiffAdd           cterm=NONE    ctermfg=0     guifg=#161616  ctermbg=10     guibg=#909636
hi      DiffChange        cterm=NONE    ctermfg=0     guifg=#161616  ctermbg=3      guibg=#E4E093
hi      DiffDelete        cterm=NONE    ctermfg=0     guifg=#161616  ctermbg=1      guibg=#8C3346
hi      DiffText          cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=4      guibg=#352F6A

hi      Search            cterm=NONE    ctermfg=0     guifg=#161616  ctermbg=10     guibg=#909636
hi      IncSearch         cterm=NONE    ctermfg=0     guifg=#161616  ctermbg=2      guibg=#AADB0F

hi      Comment           cterm=italic  ctermfg=8     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      Type              cterm=NONE    ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE
hi      Boolean           cterm=NONE    ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE
hi      String            cterm=NONE    ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE
hi      Number            cterm=NONE    ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE
hi      Title             cterm=bold    ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE
hi      Constant          cterm=italic  ctermfg=8     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      Identifier        cterm=bold    ctermfg=8     guifg=#F2F2F2  ctermbg=0      guibg=#161616
hi      Statement         cterm=bold    ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE
hi      StorageClass      cterm=bold    ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE
hi      Conditional       cterm=bold    ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE

hi      MatchParen        cterm=bold    ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE
hi      Special           cterm=NONE    ctermfg=235   guifg=#262626  ctermbg=NONE   guibg=NONE
hi      Tabs              cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=235    guibg=#262626
hi      ColorColumn       cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#F2F2F2
hi      Conceal           cterm=NONE    ctermfg=8     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      Directory         cterm=NONE    ctermfg=8     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      Error             cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=1      guibg=#8C3346
hi      ErrorMsg          cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=1      guibg=#8C3346
hi      FoldColumn        cterm=NONE    ctermfg=8     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      Folded            cterm=NONE    ctermfg=8     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      Ignore            cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE
hi      ModeMsg           cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE
hi      MoreMsg           cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE
hi      Question          cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE
hi      SignColumn        cterm=NONE    ctermfg=8     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      Underlined        cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE
hi      WarningMsg        cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=9      guibg=#FF0000
hi      WildMenu          cterm=NONE    ctermfg=0     guifg=#161616  ctermbg=10     guibg=#909636
hi      lCursor           cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE
hi      PreProc           cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE

hi      xmlTagName        cterm=NONE    ctermfg=8     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      xmlEndTag         cterm=NONE    ctermfg=8     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      xmlNamespace      cterm=bold    ctermfg=8     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE
hi      xmlAttrib         cterm=NONE    ctermfg=8     guifg=#F2F2F2  ctermbg=NONE   guibg=NONE

hi      texSection        cterm=bold    ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE
hi      texMathZoneX      cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#F2F2F2
hi      texMathText       cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#F2F2F2
hi      texMathSymbol     cterm=bold    ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#F2F2F2
hi      texMathOper       cterm=bold    ctermfg=2     guifg=#AADB0F  ctermbg=8      guibg=#F2F2F2
hi      texMathMatcher    cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#F2F2F2
hi      texTypeStyle      cterm=bold    ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#F2F2F2
hi      texStatement      cterm=bold    ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE
hi      texGreek          cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#F2F2F2
hi      texBeginEnd       cterm=NONE    ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE
hi      texSubscript      cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#F2F2F2
hi      texSuperscript    cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#F2F2F2
hi      texBeginEndName   cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=NONE   guibg=NONE
hi      Conceal           cterm=NONE    ctermfg=NONE  guifg=NONE     ctermbg=8      guibg=#F2F2F2

hi      prologClauseHead  cterm=NONE    ctermfg=2     guifg=#AADB0F  ctermbg=NONE   guibg=NONE

match  Tabs /[\t]\+/
