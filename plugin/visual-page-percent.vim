
" Avoid installing twice.
if exists('g:loaded_visualPagePercent')
    finish
endif
let g:loaded_visualPagePercent = 1

if !exists('g:visualPagePercent_window_char')
    let g:visualPagePercent_window_char = '●'
endif

if !exists('g:visualPagePercent_before_window_char')
    let g:visualPagePercent_before_window_char = '-'
endif

if !exists('g:visualPagePercent_after_window_char')
    let g:visualPagePercent_after_window_char = '-'
endif

if !exists('g:visualPagePercent_display_width')
    let g:visualPagePercent_display_width = 25
endif

function! VisualPercent()
    " real numbers
    let top = line("w0")
    let bottom = line("w$")
    let total = line("$") * 1.0
    let visbleLines = bottom-top

    " display numbers
    let displayWidth = g:visualPagePercent_display_width
    let displayWindowWidth = displayWidth / total * visbleLines

    " create the window
    let i = 0
    let displayWindow = ""
    while i < displayWindowWidth
        let displayWindow .= g:visualPagePercent_window_char
        let i += 1
    endwhile

    " create display before visible section
    let displayWidthBefore = displayWidth / total * top
    let displayBefore = ""
    while i < displayWidthBefore + displayWindowWidth
        let displayBefore .= g:visualPagePercent_before_window_char
        let i += 1
    endwhile

    " create display after visible section
    let displayWidthAfter = displayWidth - displayWidthBefore - displayWindowWidth
    let displayAfter = ""
    while i < displayWidth
        let displayAfter .= g:visualPagePercent_after_window_char
        let i += 1
    endwhile

    return displayBefore.displayWindow.displayAfter
endfunction

