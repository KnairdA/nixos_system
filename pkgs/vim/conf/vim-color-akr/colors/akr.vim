hi      clear
syntax  reset
let     background     =              "dark"
let     g:colors_name  =              "akr"

hi      Normal         gui=NONE       guifg=#F2F2F2  guibg=#161616
hi      NonText        gui=NONE       guifg=#161616  guibg=#161616
hi      LineNr         gui=NONE       guifg=#605c5a  guibg=NONE
hi      Cursor         gui=NONE       guifg=#F2F2F2  guibg=#D80F33
hi      CursorColumn   gui=NONE       guifg=NONE     guibg=#000000
hi      CursorLine     gui=NONE       guifg=NONE     guibg=#212121
hi      CursorLineNr   gui=NONE       guifg=#aadb0f  guibg=#212121
hi      ColorColumn    gui=NONE       guifg=NONE     guibg=#aadb0f
hi      SignColumn     gui=NONE       guifg=NONE     guibg=#aadb0f

hi      TabLine        gui=NONE       guifg=#909636  guibg=#161616
hi      TabLineFill    gui=NONE       guifg=NONE     guibg=#262626
hi      TabLineSel     gui=NONE       guifg=#161616  guibg=#909636
hi      StatusLine     gui=NONE       guifg=#909636  guibg=#212121
hi      StatusLineNC   gui=NONE       guifg=#909637  guibg=#212121
hi      VertSplit      gui=NONE       guifg=#262626  guibg=#262626
hi      Visual         gui=NONE       guifg=#E4E093  guibg=#8C3346
hi      VisualNOS      gui=NONE       guifg=NONE     guibg=NONE

hi      Pmenu          gui=NONE       guifg=NONE     guibg=#000000
hi      PmenuSbar      gui=NONE       guifg=NONE     guibg=#262626
hi      PmenuSel       gui=NONE       guifg=NONE     guibg=#333333
hi      PmenuThumb     gui=NONE       guifg=NONE     guibg=#424242
hi      DiffAdd        gui=NONE       guifg=NONE     guibg=#082608
hi      DiffChange     gui=NONE       guifg=NONE     guibg=#000000
hi      DiffDelete     gui=NONE       guifg=NONE     guibg=#260808
hi      DiffText       gui=NONE       guifg=NONE     guibg=#333333
hi      Search         gui=NONE       guifg=#161616  guibg=#909636
hi      IncSearch      gui=NONE       guifg=#161616  guibg=#aadb0f

hi      Comment        gui=italic     guifg=#F2F2F2  guibg=NONE
hi      Type           gui=NONE       guifg=#aadb0f  guibg=NONE
hi      Boolean        gui=NONE       guifg=#aadb0f  guibg=NONE
hi      String         gui=NONE       guifg=#aadb0f  guibg=NONE
hi      Number         gui=NONE       guifg=#aadb0f  guibg=NONE
hi      Title          gui=bold       guifg=#aadb0f  guibg=NONE
hi      Todo           gui=standout   guifg=NONE     guibg=NONE
hi      Constant       gui=italic     guifg=#F2F2F2  guibg=NONE
hi      Identifier     gui=bold       guifg=#F2F2F2  guibg=#161616
hi      Statement      gui=bold       guifg=#aadb0f  guibg=NONE
hi      StorageClass   gui=bold       guifg=#aadb0f  guibg=NONE
hi      Conditional    gui=bold       guifg=#aadb0f  guibg=NONE
hi      MatchParen     gui=bold       guifg=NONE     guibg=NONE

hi      Special        gui=NONE       guifg=#808080  guibg=NONE
hi      SpecialKeyTab  gui=NONE       guifg=NONE     guibg=#212121

hi      ColorColumn    gui=NONE       guifg=NONE     guibg=#000000
hi      Conceal        gui=NONE       guifg=#808080  guibg=NONE
hi      Directory      gui=NONE       guifg=#F2F2F2  guibg=NONE
hi      Error          gui=NONE       guifg=NONE     guibg=#8C3346
hi      ErrorMsg       gui=NONE       guifg=NONE     guibg=#8C3346
hi      FoldColumn     gui=NONE       guifg=#616161  guibg=NONE
hi      Folded         gui=NONE       guifg=#707070  guibg=NONE
hi      Ignore         gui=NONE       guifg=NONE     guibg=NONE
hi      ModeMsg        gui=NONE       guifg=NONE     guibg=NONE
hi      MoreMsg        gui=NONE       guifg=NONE     guibg=NONE
hi      Question       gui=NONE       guifg=NONE     guibg=NONE
hi      SignColumn     gui=NONE       guifg=#616161  guibg=NONE
hi      Underlined     gui=NONE       guifg=NONE     guibg=NONE
hi      WarningMsg     gui=NONE       guifg=NONE     guibg=#260808
hi      WildMenu       gui=NONE       guifg=NONE     guibg=#525252
hi      lCursor        gui=NONE       guifg=NONE     guibg=NONE
hi      PreProc        gui=NONE       guifg=NONE     guibg=NONE

hi      SpellBad       gui=undercurl  guifg=NONE     guibg=#260808
hi      SpellCap       gui=undercurl  guifg=NONE     guibg=NONE
hi      SpellLocal     gui=undercurl  guifg=NONE     guibg=#082608
hi      SpellRare      gui=undercurl  guifg=NONE     guibg=#262626

hi      xmlTagName     gui=NONE       guifg=#F2F2F2  guibg=NONE
hi      xmlEndTag      gui=NONE       guifg=#F2F2F2  guibg=NONE
hi      xmlNamespace   gui=bold       guifg=#F2F2F2  guibg=NONE
hi      xmlAttrib      gui=NONE       guifg=#F2F2F2  guibg=NONE

hi      vimwikiLink    gui=underline  guifg=#aadb0f  guibg=NONE

hi      texSection      gui=bold       guifg=#aadb0f  guibg=NONE
hi      texMathZoneX    gui=NONE       guifg=NONE     guibg=#000000
hi      texMathText     gui=NONE       guifg=NONE     guibg=#000000
hi      texMathSymbol   gui=bold       guifg=NONE     guibg=#000000
hi      texMathOper     gui=bold       guifg=#aadb0f  guibg=#000000
hi      texMathMatcher  gui=NONE       guifg=NONE     guibg=#000000
hi      texTypeStyle    gui=bold       guifg=NONE     guibg=#000000
hi      texStatement    gui=bold       guifg=NONE     guibg=NONE
hi      texGreek        gui=NONE       guifg=NONE     guibg=#000000
hi      texBeginEnd     gui=NONE       guifg=#aadb0f  guibg=NONE
hi      texSubscript    gui=NONE       guifg=NONE     guibg=#000000
hi      texSuperscript  gui=NONE       guifg=NONE     guibg=#000000
hi      texBeginEndName gui=NONE       guifg=NONE     guibg=NONE
hi      Conceal         gui=NONE       guifg=NONE     guibg=#000000

hi      prologClauseHead gui=NONE      guifg=#aadb0f  guibg=NONE

hi      IndentGuidesEven gui=NONE      guifg=#424242  guibg=#2D2D2D
hi      IndentGuidesOdd  gui=NONE      guifg=#424242  guibg=#2D2D2D

match   SpecialKey     '^\s\+'
