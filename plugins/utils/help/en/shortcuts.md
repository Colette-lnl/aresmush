---
toc: Utilities / Miscellaneous
summary: Create your own command shortcuts.
---
# Creating Command Shortcuts

You can create your own shortcuts for commands.  

`shortcuts` - List your shortcuts.
`shortcut/add <shortcut>=<command>` - Adds a shortcut.
`shortcut/delete <shortcut>` - Removes a shortcut.

For example, if you want the game to do the 'combat' command whenever you type 'com', or 'help' every time you typed 'h', you would add a shortcut like this:

    shortcut/add com=combat
    shortcut/add h=help

You can include arguments in your shortcuts.  For example, you could create an alias that did 'help combat' when you typed `chelp`.

    shortcut/add chelp=help combat

When you use a shortcut, anything you type after it will be added to the end of the command.  Here's one that lets you do `pf <text>` to page Faraday.

    shortcut/add pf=page faraday=

NOTE: Custom shortcuts don't stack with game shortcuts. For example, `jobs/mine` is a game shortcut for `jobs/filter mine`. If you wanted a custom shortcut for that, you'd need to use the filter version. Similarly, `scenes/open` is a game shortcut for `scene/open`, so you'd need to use the singular version in a custom shortcut. (This is true for many plural commands.)