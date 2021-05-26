---
title: How to get out of Vim (and the basics of Vim)
layout: post
date: '2021-04-20 15:42:29 +0200'
last_modified_date: '2021-05-26 18:11:44 +0200'
category: Vim
author: JacksonChen666
--- 
Oops, you were accidentally dropped in vim and now can't out. But don't hesitate and close the terminal window, you can get out.

To get out of vim, first confirm you're in normal mode (of vim):

- Use the `ESC` key to go back to normal mode

Then, you type the following characters in vim: `:qa`.
If for some reason you are still in vim (because it told you it had unsaved work), then now try to type `:qa!` and press return/enter key, losing any unsaved work (which could've contained bad work).

OK, you're out of vim.
Do you want to continue and learn how to use vim at a basic level? Yes?
OK then, here are the basics of vim.

## Start editing in vim
You are expected to be in normal mode. If you don't know which mode you're in, press escape.
You can also check if it's in normal mode when the bottom left of vim/terminal doesn't start with double dashes `--`, or it doesn't have the keywords `INSERT` or `VISUAL` after a couple characters.
- `i` to start putting whatever you type at whatever your cursor location is.
- `I` to move the cursor to the start of the line (usually after indenting) and start editing.
- `A` is same as `I` but moves cursor to the end.
- `a` to move the cursor right to compensate the cursor moving left one character.

Now, the said keys puts your vim session in `INSERT` mode, which lets you type text and any characters.


## Navigation
Vim has the usual arrow key navigation, but also hjkl navigation, which is a qwerty home row navigation in normal/visual mode (but not for insert mode).
- `h` moves the cursor left
- `l` moves the cursor right
- `k` moves the cursor up
- `j` moves the cursor down

## Saving documents
When you want to save the document, type `:w` and press the return key.
If you want to also quit vim while at it, then `:wq` should work, and then you can run your code.

## Running code
You can actually run your code in vim, too. Type `:!` in normal mode (transferring you to command mode), and the command to run your code.

When you run your code, it will pop you out of vim's window to return to your normal terminal (with vim in the background still open).
When your code stops running, vim will prompt you to press the enter key or type a vim command.
Pressing enter returns you to vim, but typing a vim command will give you an empty window with the command you type for some reason.
Pressing enter/return on command mode after running a shell command will return to normal vim.

## In Conclusion,
You learned how to exit vim, and how to actually use vim at hopefully a basic level.
I hope you found this helpful, and learned how to exit vim while learning how to use it.

Next time you find yourself in vim again while committing another change, you might want to consider changing your editor to be nano if you're willing to spend time making that change, if you don't like having to use vim.