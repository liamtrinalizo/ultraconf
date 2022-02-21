" Vim syntax file
" Language:     Jira text formating
" Acknowledgement: Modified from Tim Pope vim-markdown syntax file
" Filenames:    *.jira
" Last Change:  2022.01.04

let g:jira_fenced_languages = ['', 'c', 'cpp', 'java']

if exists("b:current_syntax")
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'jira'
endif

runtime! syntax/html.vim
unlet! b:current_syntax

if !exists('g:jira_fenced_languages')
  let g:jira_fenced_languages = []
endif
let s:done_include = {}
let s:langSyntax = { 'c++': 'cpp' }
for s:type in map(copy(g:jira_fenced_languages),'matchstr(v:val,"[^=]*$")')
  if has_key(s:done_include, matchstr(s:type,'[^.]*'))
    continue
  endif
  if s:type =~ '\.'
    let b:{matchstr(s:type,'[^.]*')}_subtype = matchstr(s:type,'\.\zs.*')
    exe 'echo  b:{matchstr(s:type,"[^.]*")}_subtype'
  endif
  if s:type != ""
      exe 'syn include @jiraHighlight'.substitute(s:type,'+','p','g').' syntax/'.matchstr(s:type,'[^.]*').'.vim'
  endif
  unlet! b:current_syntax
  let s:done_include[matchstr(s:type,'[^.]*')] = 1
endfor
unlet! s:type
unlet! s:done_include

if !exists('g:jira_minlines')
  let g:jira_minlines = 50
endif
execute 'syn sync minlines=' . g:jira_minlines
syn case ignore

syn match jiraValid '[<>]\c[a-z/$!]\@!' transparent contains=NONE
syn match jiraValid '&\%(#\=\w*;\)\@!' transparent contains=NONE

syn match jiraLineStart "^[<@]\@!" nextgroup=@jiraBlock,htmlSpecialChar

syn cluster jiraBlock contains=jiraH1,jiraH2,jiraH3,jiraH4,jiraH5,jiraH6,jiraBlockquote,jiraListMarker,jiraOrderedListMarker,jiraRule
syn cluster jiraInline contains=jiraLineBreak,jiraLinkText,jiraItalic,jiraBold,jiraCode,jiraEscape,@htmlTop,jiraError,jiraValid

syn match jiraH1 "^.\+\n=\+$" contained contains=@jiraInline,jiraHeadingRule,jiraAutomaticLink
syn match jiraH2 "^.\+\n-\+$" contained contains=@jiraInline,jiraHeadingRule,jiraAutomaticLink

syn region jiraH1 matchgroup=jiraH1Delimiter start="h1\." end="$" keepend oneline contains=@jiraInline,jiraAutomaticLink contained
syn region jiraH2 matchgroup=jiraH2Delimiter start="h2\." end="$" keepend oneline contains=@jiraInline,jiraAutomaticLink contained
syn region jiraH3 matchgroup=jiraH3Delimiter start="h3\." end="$" keepend oneline contains=@jiraInline,jiraAutomaticLink contained
syn region jiraH4 matchgroup=jiraH4Delimiter start="h4\." end="$" keepend oneline contains=@jiraInline,jiraAutomaticLink contained
syn region jiraH5 matchgroup=jiraH5Delimiter start="h5\." end="$" keepend oneline contains=@jiraInline,jiraAutomaticLink contained
syn region jiraH6 matchgroup=jiraH6Delimiter start="h6\." end="$" keepend oneline contains=@jiraInline,jiraAutomaticLink contained

syn match jiraBlockquote ">\%(\s\|$\)" contained nextgroup=@jiraBlock

" TODO: real nesting
syn match jiraListMarker "\%(\t\| \{0,4\}\)[-*+]\%(\s\+\S\)\@=" contained
syn match jiraOrderedListMarker "\%(\t\| \{0,4}\)\<\d\+\.\%(\s\+\S\)\@=" contained

syn match jiraRule "\* *\* *\*[ *]*$" contained
syn match jiraRule "- *- *-[ -]*$" contained

syn match jiraLineBreak " \{2,\}$"

syn match jiraUrl "\S\+" nextgroup=jiraUrlTitle skipwhite contained
syn region jiraUrl matchgroup=jiraUrlDelimiter start="<" end=">" oneline keepend nextgroup=jiraUrlTitle skipwhite contained
syn region jiraUrlTitle matchgroup=jiraUrlTitleDelimiter start=+"+ end=+"+ keepend contained
syn region jiraUrlTitle matchgroup=jiraUrlTitleDelimiter start=+'+ end=+'+ keepend contained
syn region jiraUrlTitle matchgroup=jiraUrlTitleDelimiter start=+(+ end=+)+ keepend contained

syn region jiraLinkText matchgroup=jiraLinkTextDelimiter start="!\=\[\%(\%(\_[^][]\|\[\_[^][]*\]\)*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" nextgroup=jiraLink,jiraId skipwhite contains=@jiraInline,jiraLineStart
syn region jiraLink matchgroup=jiraLinkDelimiter start="(" end=")" contains=jiraUrl keepend contained
syn region jiraId matchgroup=jiraIdDelimiter start="\[" end="\]" keepend contained
syn region jiraAutomaticLink matchgroup=jiraUrlDelimiter start="<\%(\w\+:\|[[:alnum:]_+-]\+@\)\@=" end=">" keepend oneline

let s:concealends = ''
if has('conceal') && get(g:, 'jira_syntax_conceal', 1) == 1
  let s:concealends = ' concealends'
endif
exe 'syn region jiraItalic matchgroup=jiraItalicDelimiter start="\w\@<!_\S\@=" end="\S\@<=_\w\@!" skip="\\_" contains=jiraLineStart,@Spell' . s:concealends
exe 'syn region jiraBold   matchgroup=jiraBoldDelimiter start="\S\@<=\*\|\*\S\@=" end="\S\@<=\*\|\*\S\@=" skip="\\\*" contains=jiraLineStart,jiraItalic,@Spell' . s:concealends

syn region jiraCode matchgroup=jiraCodeDelimiter start="^{code\S*}$" end="^{code}$" keepend

syn match jiraFootnote "\[^[^\]]\+\]"
syn match jiraFootnoteDefinition "^\[^[^\]]\+\]:"

if main_syntax ==# 'jira'
  let s:done_include = {}
  for s:type in g:jira_fenced_languages
    if has_key(s:done_include, matchstr(s:type,'[^.]*'))
      continue
    endif
    exe 'syn region jiraHighlight'.substitute(matchstr(s:type,'[^=]*$'),'+','p','g').' matchgroup=jiraCodeDelimiter start="{code:\?'.s:type.'}" end="{code}" keepend contains=@jiraHighlight'.substitute(matchstr(s:type,'[^=]*$'),'+','p','g') . s:concealends
    let s:done_include[matchstr(s:type,'[^.]*')] = 1
  endfor
  unlet! s:type
  unlet! s:done_include
endif

syn match jiraEscape "\\[][\\`*_{}()<>#+.!-]"
syn match jiraTable "|"
"syn match jiraError "\w\@<=_\w\@="

hi def link jiraH1                    htmlBoldItalic
hi def link jiraH2                    htmlBoldItalic
hi def link jiraH3                    htmlBoldItalic
hi def link jiraH4                    htmlBoldItalic
hi def link jiraH5                    htmlBoldItalic
hi def link jiraH6                    htmlBoldItalic
hi def link jiraHeadingRule           jiraRule
hi def link jiraH1Delimiter           jiraHeadingDelimiter
hi def link jiraH2Delimiter           jiraHeadingDelimiter
hi def link jiraH3Delimiter           jiraHeadingDelimiter
hi def link jiraH4Delimiter           jiraHeadingDelimiter
hi def link jiraH5Delimiter           jiraHeadingDelimiter
hi def link jiraH6Delimiter           jiraHeadingDelimiter
hi def link jiraHeadingDelimiter      Delimiter
hi def link jiraOrderedListMarker     jiraListMarker
hi def link jiraListMarker            htmlTagName
hi def link jiraBlockquote            Comment
hi def link jiraRule                  PreProc
hi def link jiraHighlight             Comment

hi def link jiraFootnote              Typedef
hi def link jiraFootnoteDefinition    Typedef

hi def link jiraLinkText              htmlLink
hi def link jiraIdDeclaration         Typedef
hi def link jiraId                    Type
hi def link jiraAutomaticLink         jiraUrl
hi def link jiraUrl                   Float
hi def link jiraUrlTitle              String
hi def link jiraIdDelimiter           jiraLinkDelimiter
hi def link jiraUrlDelimiter          htmlTag
hi def link jiraUrlTitleDelimiter     Delimiter

hi def link jiraItalic                htmlItalic
hi def link jiraItalicDelimiter       jiraItalic
hi def link jiraBold                  htmlBold
hi def link jiraBoldDelimiter         jiraBold
hi def link jiraBoldItalic            htmlBoldItalic
hi def link jiraCodeDelimiter         Delimiter
hi def link jiraTable                 Delimiter

hi def link jiraEscape                Special

let b:current_syntax = "jira"
if main_syntax ==# 'jira'
  unlet main_syntax
endif

" vim:set sw=2:
