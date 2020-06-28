function Jdate()
    r!date +\%Y-\%m-\%dT09:00:00.000+0100
    norm kJ
endfunction

function Header()
    norm ggO
    0r ~/.vim/snippets/header_addi
    call append(1, " *  @file " . expand("%:t"))
endfunction

function Jid()
    let dict = []
	for line in readfile('/tmp/jiraTasks')
        let id = split(line, ': ')
        let tmp = {'word':id[0], 'abbr':line}
        call add(dict, tmp)
    endfor
    call complete(col('.'), dict)
    return ''
endfunc
