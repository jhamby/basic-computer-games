#!/usr/bin/env rexx

say copies(' ',26)"ACEY DUCEY CARD GAME"
say copies(' ',15)"CREATIVE COMPUTING  MORRISTOWN, NEW JERSEY"
say; say
say "ACEY-DUCEY IS PLAYED IN THE FOLLOWING MANNER:"
say "THE DEALER (COMPUTER) DEALS TWO CARDS FACE UP"
say "YOU HAVE AN OPTION TO BET OR NOT BET DEPENDING"
say "ON WHETHER OR NOT YOU FEEL THE CARD WILL HAVE"
say "A VALUE BETWEEN THE FIRST TWO."
say "IF YOU DO NOT WANT TO BET, INPUT A 0"

/* KeepPlaying is set to YES or NO when the player runs out of money. */
do until KeepPlaying = "NO"
    balance = 100
    do until balance <= 0
        say "YOU NOW HAVE" balance "DOLLARS."
        say
        do until a \= b
            a = random(2,14)
            b = random(2,14)
            if a > b then
                parse value a b with b a    /* trick to swap two vars */
            else nop
        end
        say
        say "HERE ARE YOUR NEXT TWO CARDS:"
        call PrintCard a
        call PrintCard b
        say; say

        do until datatype(bet) = "NUM" & bet >= 0 & bet <= balance
            say "WHAT IS YOUR BET?"
            pull bet
            select
                when datatype(bet) \= "NUM" | bet < 0 then
                    say "PLEASE ENTER A NON-NEGATIVE NUMBER"
                when bet > balance then
                    do
                        say "SORRY, MY FRIEND, BUT YOU BET TOO MUCH."
                        say "YOU HAVE ONLY" balance "DOLLARS TO BET."
                    end
                otherwise nop
            end
        end

        if bet = 0 then
            say "CHICKEN!!"
        else
            do
                c = random(2,14)
                call PrintCard c
                if c > a & c < b then
                    do
                        say "YOU WIN!!!"
                        balance = balance + bet
                    end
                else
                    do
                        say "SORRY, YOU LOSE"
                        balance = balance - bet
                    end
            end

        say /* print blank line before returning to top */
    end

    say "SORRY, FRIEND, BUT YOU BLEW YOUR WAD."
    say; say
    do until KeepPlaying == "YES" | KeepPlaying == "NO"
        say "TRY AGAIN (YES OR NO)"
        pull KeepPlaying
    end
end
exit

PrintCard: procedure
arg card
select
    when card = 11 then
        say "JACK"
    when card = 12 then
        say "QUEEN"
    when card = 13 then
        say "KING"
    when card = 14 then
        say "ACE"
    otherwise
        say card
end
return
