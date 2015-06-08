
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
    let top = line("w0") - 1
    let bottom = line("w$")
    let total = line("$")
    let visbleLines = bottom-top

    " display numbers
    let displayWidth = g:visualPagePercent_display_width
    let scale = 1.0 * displayWidth / total

    " ensure the display width is at least one so we retain a marker on
    " very large files.
    let displayWindowWidth = round(scale * visbleLines)
    if displayWindowWidth < 1
        let displayWindowWidth = 1
    endif

    " create the window
    let i = 0
    let displayWindow = ""
    while i < displayWindowWidth
        let displayWindow .= g:visualPagePercent_window_char
        let i += 1
    endwhile

    " create display before visible section
    let displayWidthBefore = round(scale * top)
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

