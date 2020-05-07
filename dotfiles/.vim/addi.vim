function Jdate()
    r!date +\%Y-\%m-\%dT09:00:00.000+0100
    norm kJ
endfunction

function Header()
    norm ggO
    0r ~/.vim/snippets/header_addi
    call append(1, " *  @file " . expand("%:t"))
endfunction
