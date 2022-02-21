function Jdate()
    r!date +\%Y-\%m-\%dT09:00:00.000+0100
    norm kJ
endfunction

function HeaderC()
    norm ggO
    0r $XDG_CONFIG_HOME/vim/snippets/headerC
    call append(1,  " *  @file " . expand("%:t"))
    call append(2,  " *  @date " . strftime("%d.%m.%y"))
    call append(15, " *  @brief Contains the " . expand("%:t:r") . " class")
    "Capitalize the class first lettre in case
    15 norm 7wgUl 
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
