" Copyright 2020 The vim-go-testscript Authors. All rights reserved.
" Use of this source code is governed by a BSD-style
" license that can be found in the LICENSE file.

" vim-go-testscript: Vim syntax file for Go testscript.

if exists("b:current_syntax")
  finish
endif

syntax case match

syntax keyword testscriptTodo                    contained TODO FIXME XXX BUG
syntax cluster testscriptCommentGroup            contains=testscriptTodo

syntax match testscriptCondition                 contained /\%(!\>\)\?\%(gc\|gccgo\|short\|cgo\|msan\|race\|net\|link\|net\|root\|symlink\|exec\|GODEBUG|buildmode\)\>/
syntax region testscriptConditionBrace           start="^\[" skip="(!|\s+)" end="\]" contains=testscriptCondition,testscriptMust
highlight default link testscriptConditionBrace  PreProc
highlight default link testscriptCondition       Special

syntax keyword testscriptCommand                 addcrlf cc cd chmod cmp cmpenv cp env exec exists go grep mkdir rm skip stale stderr stdout stop symlink wait 
highlight default link testscriptCommand         Keyword

" TODO(zchee): support contains testscriptConditionBrace, like [!gc]
syntax region  testscriptMust                    start="^!" end=" "
highlight default link testscriptMust            Statement

syntax region  testscriptComment                 start="#" skip="\\$" end="$" keepend contains=@testscriptCommentGroup,@Spell
highlight default link testscriptComment         Comment

" TODO(zchee): support variable which have 'env ' prefix
" syntax region testscriptVariable                 start=/env / end=/=/
" highlight default link testscriptVariable        Identifier

" TODO(zchee): support go and gomod syntax, like:
"  -- x/y/z/z.go --
"  package z
"  import "does/not/exist"

let b:current_syntax = "testscript"

" vim: sts=2:sw=2:ts=2:et
