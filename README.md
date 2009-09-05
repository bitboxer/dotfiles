# Bodo Tasche Dot Files #

These are config files to set up a system the way I like it. This is a fork 
of [dotfiles](http://github.com/ryanb/dotfiles) by [Ryan Bates](http://railscasts.com/).

## Installation ##

    git clone git://github.com/bodo/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    rake install
    # edit ~/.gitconfig and personalize it

## Environment ##

I am running on Mac OS X, but it will likely work on Linux as well with 
minor fiddling. I primarily use zsh. If you would like to switch to zsh, 
you can do so with the following command.

    chsh -s /bin/zsh

## Features ##

### Command line ##

I normally place all of my coding projects in ~/code, so this directory 
can easily be accessed (and tab completed) with the "c" command.

    c railsca<tab>

There is also an "h" command which behaves similar, but acts on the 
home path.

    h doc<tab>

Tab completion is also added to rake and cap commands:

    rake db:mi<tab>
    cap de<tab>

To speed things up, the results are cached in local `.rake_tasks~` and 
`.cap_tasks~`. It is smart enough to expire the cache automatically in 
most cases, but you can simply remove the files to flush the cache.

There are a few key bindings set. Many of these require option to be
set as the meta key. Option-left/right arrow will move cursor by word, 
and control-left/right will move to beginning and end of line. 
Control-option-N will open a new tab with the current directory under
Mac OS X Terminal.

If you're using git, you'll notice the current branch name shows up in
the prompt while in a git repository.

If you're using Rails, you'll find some handy aliases (below). You can 
also use `show_log` and `hide_log` in script/console to show the log inline.
  
    ss       # script/server
    sc       # script/console
    sg       # script/generate
    a        # autotest
    tlog     # tail -f log/development.log
    rst      # touch tmp/restart.txt
    migrate  # rake db:migrate db:test:clone
    scaffold # script/generate nifty\_scaffold

See the other aliases in `~/.zsh/aliases`

If there are some shell configuration settings which you want secure or 
specific to one system, place it into a `~/.localrc` file. This will be 
loaded automatically if it exists.

There are several features enabled in Ruby's irb including history, 
completion and auto-indent. Many convenience methods are added as well 
such as "ri" which can be used to get inline documentation in IRB. 
See irbrc and railsrc files for details.

### Vim config ###

I added the vim-config Files of [Joe Ferris](http://github.com/jferris/config_files) . 
The vim config includes the rails.vim Plugin for vim and some other tweaks to make
vim the best rails command line editor on the planet :) . Try out `:Rcon<tab>` in vim when
opening a rails project.

The color scheme mimics the railscast scheme when in GUI-Mode (e.g. when using 
[MacVim](http://code.google.com/p/macvim/) ).

Some basic informations about the installed plugins can be found here:

* [rails.vim](http://rails.vim.tpope.net/)
* [xmledit.vim](http://www.vim.org/scripts/script.php?script_id=301)

Look into the vim/plugin-directory to find out which plugins are currently available 
besides this two.
