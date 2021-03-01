### What are we doing?

We're updating the first million selling computer book, [BASIC Computer Games](https://en.wikipedia.org/wiki/BASIC_Computer_Games), for 2021!

### What's in this fork?

This fork includes ports to [OpenVMS BASIC](https://en.wikipedia.org/wiki/VSI_BASIC_for_OpenVMS) in the `vms` subdirectory for each game. They've been tested on a Compaq XP1000 with VSI BASIC V1.8-005 on OpenVMS V8.4-2L1, but should also run on VAX and Itanium. They may even run on BASIC-PLUS for the PDP-11 with minimal changes (I've used a few features like `EDIT$` that pre-VMS DEC BASIC may not support).

Major changes from Vintage Basic to OpenVMS BASIC:
- Use `\` instead of `:` to separate multiple statements on a line.
- Use `CR` and `LF` for extra carriage returns and newlines instead of multiple `PRINT` statements.
- `RIGHT$()` takes the start position as the second argument, not the number of characters to extract.
- Use `EDIT$(str,32)` to convert user input to uppercase, so that caps lock isn't required to play.
- `INPUT` can only have a string constant, not a dynamic string containing variables.
- `GOTO` into a block gives a compiler warning, so I've changed those cases to use `GOSUB`.
- `FOR/NEXT` and other blocks must be properly nested, so you can't call `NEXT I` from within an `IF` block.
- Use `RND` instead of `RND(1)`, and call `RANDOMIZE` at program start to seed the random number generator.
- Unreachable code flagged by the compiler has been removed.
- Some variables and arrays are declared `INTEGER` for performance or correct math. The scoring in Basketball was giving points to the opposing team because of an array subscript of `1-P`, which was fixed by `DECLARE INTEGER P`. This may be a quirk of VAX single-precision FP math on Alpha.
- There can only be one `END` on the last lexical line of the program. Replace other `END` statements with a `GOTO 999` to go to the end line.
- The `STOP` statement prints a `#` debug prompt where you can only type `CONTINUE` or `EXIT`, which is confusing, so replace with a goto to the `END` line.
- `ON n GOTO` and `ON n GOSUB` require an `OTHERWISE target` if the value of n may be less than 1 or greater than the number of targets on the line. In that case, without `OTHERWISE`, an error exception is thrown instead of falling through to the next line of code.

### Where can we discuss it?

Please see [the discussion here](https://discourse.codinghorror.com/t/updating-101-basic-computer-games-for-2021/7927) for a worklog and conversation around this project.

### Project structure

I have moved all [the original BASIC source code](http://www.vintage-basic.net/games.html) into a folder for each project in the original book (first volume). Note that Lyle Kopnicky has generously normalized all the code (thanks Lyle!) to run against [Vintage Basic](http://www.vintage-basic.net/download.html) circa 2009:

> I've included all the games here for your tinkering pleasure. I've tested and tweaked each one of them to make sure they'll run with Vintage BASIC, though you may see a few oddities. That's part of the fun of playing with BASIC: it never works quite the same on two machines. The games will play better if you keep CAPS LOCK on, as they were designed to be used with capital-letter input.

Each project has subfolders corresponding to the languages we'd like to see the games ported to. This is based on the [February 2021 TIOBE index of top languages](https://www.tiobe.com/tiobe-index/) that are _memory safe_ and _general purpose scripting language_ per [this post](https://discourse.codinghorror.com/t/updating-101-basic-computer-games-for-2021/7927/34):

- Java
- Python
- C#
- VB.NET
- JavaScript
- Ruby
- Delphi / Object Pascal
- Perl

### Project goals

Feel free to begin converting these classic games into the above list of modern, memory safe languages. But first, a few guidelines:

- **These are very old games**. They date from the mid-70s so they're not exactly examples of what kids (or anyone, really?) would be playing these days. Consider them more like classic programming exercises to teach programming.  We're paying it forward by converting them into modern languages, so the next generation can learn from the programs in this classic book -- and compare implementations across common modern languages.

- **Stay true to the original program**. These are mostly unsophisticated, simple command line / console games, so we should strive to replicate the command line / console output and behavior illustrated in the original book. See the README in the project folder for links to the original scanned source input and output. Avoid the impulse to add features; keep it simple.

- **Please DO update for modern coding conventions**. Support uppercase and lowercase. Use structured programming. Use subroutines. Try to be an example of good, modern coding practices!

- **Use lots of comments to explain what is going on**. Comment liberally! If there were clever tricks in the original code, decompose those tricks into simpler (even if more verbose) code, and use comments to explain what's happening and why.

- **Don't get _too_ fancy**. Definitely use the most recent versions and features of the target language, but also try to keep the code samples simple and explainable -- the goal is to teach programming in the target language, not necessarily demonstrate the cleverest one-line tricks.

### Have fun!

Thank you for taking part in this project to update a classic programming book -- one of the most influential programming books in computing history -- for 2021!
