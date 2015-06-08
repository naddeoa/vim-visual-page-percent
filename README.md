
# Visual display of your location in a file for Vim

This plugin provides a function that can be used in the Vim status line to
display a horizontal visualization of your current location within a file.


## Usage

Add the following to your `.vimrc` file.

    set statusline+=%{VisualPercent()}

Remember that the status line won't show if you only have one window split
without adding the following line to your `.vimrc`.

    set laststatus=2

