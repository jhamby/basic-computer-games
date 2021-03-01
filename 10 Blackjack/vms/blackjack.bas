1 RANDOMIZE
2 PRINT TAB(31);"BLACK JACK"
4 PRINT TAB(15);"CREATIVE COMPUTING  MORRISTOWN, NEW JERSEY"
6 PRINT LF + LF
10 DEF INTEGER HANDVAL(INTEGER Q)=Q+11*(Q>=22)
20 DIM INTEGER P(15,12),Q(15),C(52),D(52)
25 DIM REAL B(15),S(7),T(8),Z(15)
30 DIM INTEGER R(15)
35 DECLARE INTEGER AA,AB,AC,C,C1,C2,C3,D,D1,H,H1,I,I1,J,L,L1,L2
37 DECLARE INTEGER N,Q,Q1,Q2,X,X1
40 REM--P(I,J) IS THE JTH CARD IN HAND I, Q(I) IS TOTAL OF HAND I
50 REM--C IS THE DECK BEING DEALT FROM, D IS THE DISCARD PILE,
60 REM--T(I) IS THE TOTAL FOR PLAYER I, S(I) IS THE TOTAL THIS HAND FOR
70 REM--PLAYER I, B(I) IS TH BET FOR HAND I
80 REM--R(I) IS THE LENGTH OF P(I,*)
90 GOTO 1500
100 REM--SUBROUTINE TO GET A CARD.  RESULT IS PUT IN X.
110 IF C<51 THEN 230
120 PRINT "RESHUFFLING"
130 FOR D=D TO 1 STEP -1
140 C=C-1
150 C(C)=D(D)
160 NEXT D
170 FOR C1=52 TO C STEP -1
180 C2=INT(RND*(C1-C+1))+C
190 C3=C(C2)
200 C(C2)=C(C1)
210 C(C1)=C3
220 NEXT C1
230 X=C(C)
240 C=C+1
250 RETURN
300 REM--SUBROUTINE TO EVALUATE HAND I.  TOTAL IS PUT INTO
310 REM--Q(I). TOTALS HAVE THE FOLLOWING MEANING:
320 REM--  2-10...HARD 2-10
330 REM-- 11-21...SOFT 11-21
340 REM-- 22-32...HARD 11-21
350 REM--  33+....BUSTED
360 Q=0
370 FOR Q2=1 TO R(I)
380 X=P(I,Q2)
390 GOSUB 500
400 NEXT Q2
410 Q(I)=Q
420 RETURN
500 REM--SUBROUTINE TO ADD CARD X TO TOTAL Q.
510 X1=X \ IF X1>10 THEN X1=10 \ REM  SAME AS X1=10 MIN X
520 Q1=Q+X1
530 IF Q>=11 THEN 590
540 IF X>1 THEN 570
550 Q=Q+11
560 RETURN
570 Q=Q1-11*(Q1>=11)
580 RETURN
590 Q=Q1-(Q<=21 AND Q1>21)
600 IF Q<33 THEN 620
610 Q=-1
620 RETURN
700 REM--CARD PRINTING SUBROUTINE
710 REM  D$ DEFINED ELSEWHERE
720 PRINT MID$(D$,3*X-2,3);
730 PRINT "  ";
740 RETURN
750 REM--ALTERNATIVE PRINTING ROUTINE
760 PRINT " ";MID$(D$,3*X-1,2);
770 PRINT "   ";
780 RETURN
800 REM--SUBROUTINE TO PLAY OUT A HAND.
810 REM--NO SPLITTING OR BLACKJACKS ALLOWED
820 H1=5
830 GOSUB 1410
840 H1=3
850 ON H GOTO 950,930
860 GOSUB 100
870 B(I)=B(I)*2
880 PRINT "RECEIVED A";
890 GOSUB 700
900 GOSUB 1100
910 IF Q>0 THEN GOSUB 1300
920 RETURN
930 GOSUB 1320
940 RETURN
950 GOSUB 100
960 PRINT "RECEIVED A";
970 GOSUB 700
980 GOSUB 1100
990 IF Q<0 THEN 940
1000 PRINT "HIT";
1010 GOTO 830
1100 REM--SUBROUTINE TO ADD A CARD TO ROW I
1110 R(I)=R(I)+1
1120 P(I,R(I))=X
1130 Q=Q(I)
1140 GOSUB 500
1150 Q(I)=Q
1160 IF Q>=0 THEN 1190
1170 PRINT "...BUSTED"
1180 GOSUB 1200
1190 RETURN
1200 REM--SUBROUTINE TO DISCARD ROW I
1210 WHILE R(I)<>0
1230 D=D+1
1240 D(D)=P(I,R(I))
1250 R(I)=R(I)-1
1260 NEXT
1270 RETURN
1300 REM--PRINTS TOTAL OF HAND I
1310 PRINT
1320 AA=HANDVAL(Q(I))
1325 PRINT "TOTAL IS";AA
1330 RETURN
1400 REM--SUBROUTINE TO READ REPLY
1410 REM  I$ DEFINED ELSEWHERE
1420 INPUT H$ \ H$=EDIT$(LEFT$(H$,1),32)
1430 FOR H=1 TO H1 STEP 2
1440 IF H$=MID$(I$,H,1) THEN 1480
1450 NEXT H
1460 PRINT "TYPE ";MID$(I$,1,H1-1);" OR ";MID$(I$,H1,2);" PLEASE";
1470 GOTO 1420
1480 H=(H+1)/2
1490 RETURN
1500 REM--PROGRAM STARTS HERE
1510 REM--INITIALIZE
1520 D$="N A  2  3  4  5  6  7N 8  9 10  J  Q  K"
1530 I$="H,S,D,/,"
1540 FOR I=1 TO 13
1550 FOR J=4*I-3 TO 4*I
1560 D(J)=I
1570 NEXT J
1580 NEXT I
1590 D=52
1600 C=53
1610 PRINT "DO YOU WANT INSTRUCTIONS";
1620 INPUT H$
1630 IF LEFT$(H$,1)="N" OR LEFT$(H$,1)="n" THEN 1760
1640 PRINT "THIS IS THE GAME OF 21. AS MANY AS 7 PLAYERS MAY PLAY THE"
1650 PRINT "GAME. ON EACH DEAL, BETS WILL BE ASKED FOR, AND THE"
1660 PRINT "PLAYERS' BETS SHOULD BE TYPED IN. THE CARDS WILL THEN BE"
1670 PRINT "DEALT, AND EACH PLAYER IN TURN PLAYS HIS HAND. THE"
1680 PRINT "FIRST RESPONSE SHOULD BE EITHER 'D', INDICATING THAT THE"
1690 PRINT "PLAYER IS DOUBLING DOWN, 'S', INDICATING THAT HE IS"
1700 PRINT "STANDING, 'H', INDICATING HE WANTS ANOTHER CARD, OR '/',"
1710 PRINT "INDICATING THAT HE WANTS TO SPLIT HIS CARDS. AFTER THE"
1720 PRINT "INITIAL RESPONSE, ALL FURTHER RESPONSES SHOULD BE 'S' OR"
1730 PRINT "'H', UNLESS THE CARDS WERE SPLIT, IN WHICH CASE DOUBLING"
1740 PRINT "DOWN IS AGAIN PERMITTED. IN ORDER TO COLLECT FOR"
1750 PRINT "BLACKJACK, THE INITIAL RESPONSE SHOULD BE 'S'."
1760 PRINT "NUMBER OF PLAYERS";
1770 INPUT N
1775 PRINT
1780 IF N<1 OR N>7 OR N>INT(N) THEN 1760
1790 FOR I=1 TO 8 \ T(I)=0 \ NEXT I
1800 D1=N+1
1810 IF 2*D1+C>=52 THEN GOSUB 120
1820 IF C=2 THEN C=C-1
1830 FOR I=1 TO N  \ Z(I)=0 \ NEXT I
1840 FOR I=1 TO 7  \ B(I)=0 \ NEXT I
1850 FOR I=1 TO 15 \ Q(I)=0 \ NEXT I
1860 FOR I=1 TO 7  \ S(I)=0 \ NEXT I
1870 FOR I=1 TO 15 \ R(I)=0 \ NEXT I
1880 PRINT "BETS:"
1890 FOR I=1 TO N \ PRINT "#";I; \ INPUT Z(I) \ NEXT I
1900 FOR I=1 TO N
1910 IF Z(I)<=0 OR Z(I)>500 THEN 1880
1920 B(I)=Z(I)
1930 NEXT I
1940 PRINT "PLAYER";
1950 FOR I=1 TO N
1960 PRINT I;"   ";
1970 NEXT I
1980 PRINT "DEALER"
1990 FOR J=1 TO 2
2000 PRINT TAB(5);
2010 FOR I=1 TO D1
2020 GOSUB 100
2030 P(I,J)=X
2040 IF J=1 OR I<=N THEN GOSUB 750
2050 NEXT I
2060 PRINT
2070 NEXT J
2080 FOR I=1 TO D1
2090 R(I)=2
2100 NEXT I
2110 REM--TEST FOR INSURANCE
2120 IF P(D1,1)>1 THEN 2240
2130 PRINT "ANY INSURANCE";
2140 INPUT H$
2150 IF EDIT$(LEFT$(H$,1),32)<>"Y" THEN 2240
2160 PRINT "INSURANCE BETS"
2170 FOR I=1 TO N \ PRINT "#";I; \ INPUT Z(I) \ NEXT I
2180 FOR I=1 TO N
2190 IF Z(I)<0 OR Z(I)>B(I)/2 THEN 2160
2200 NEXT I
2210 FOR I=1 TO N
2220 S(I)=Z(I)*(3*(-(P(D1,2)>=10))-1)
2230 NEXT I
2240 REM--TEST FOR DEALER BLACKJACK
2250 L1=1 \ L2=1
2252 IF P(D1,1)=1 AND P(D1,2)>9 THEN L1=0 \ L2=0
2253 IF P(D1,2)=1 AND P(D1,1)>9 THEN L1=0 \ L2=0
2254 IF L1<>0 OR L2<>0 THEN 2320
2260 PRINT CR + LF + "DEALER HAS A";MID$(D$,3*P(D1,2)-2,3);" IN THE HOLE ";
2270 PRINT "FOR BLACKJACK"
2280 FOR I=1 TO D1
2290 GOSUB 300
2300 NEXT I
2310 GOTO 3140
2320 REM--NO DEALER BLACKJACK
2330 IF P(D1,1)>1 AND P(D1,1)<10 THEN 2350
2340 PRINT CR + LF + "NO DEALER BLACKJACK."
2350 REM--NOW PLAY THE HANDS
2360 FOR I=1 TO N
2370 PRINT "PLAYER";I;
2380 H1=7
2390 GOSUB 1410
2400 ON H GOTO 2550,2410,2510,2600
2410 REM--PLAYER WANTS TO STAND
2420 GOSUB 300
2430 IF Q(I)<>21 THEN 2490
2440 PRINT "BLACKJACK"
2450 S(I)=S(I)+1.5*B(I)
2460 B(I)=0
2470 GOSUB 1200
2480 GOTO 2900
2490 GOSUB 1320
2500 GOTO 2900
2510 REM--PLAYER WANTS TO DOUBLE DOWN
2520 GOSUB 300
2530 GOSUB 860
2540 GOTO 2900
2550 REM--PLAYER WANTS TO BE HIT
2560 GOSUB 300
2570 H1=3
2580 GOSUB 950
2590 GOTO 2900
2600 REM--PLAYER WANTS TO SPLIT
2610 L1=P(I,1) \ IF P(I,1)>10 THEN L1=10
2612 L2=P(I,2) \ IF P(I,2)>10 THEN L2=10
2614 IF L1=L2 THEN 2640
2620 PRINT "SPLITTING NOT ALLOWED."
2630 GOTO 2370
2640 REM--PLAY OUT SPLIT
2650 I1=I+D1
2660 R(I1)=2
2670 P(I1,1)=P(I,2)
2680 B(I+D1)=B(I)
2690 GOSUB 100
2700 PRINT "FIRST HAND RECEIVES A";
2710 GOSUB 700
2720 P(I,2)=X
2730 GOSUB 300
2740 PRINT
2750 GOSUB 100
2760 PRINT "SECOND HAND RECEIVES A";
2770 I=I1
2780 GOSUB 700
2790 P(I,2)=X
2800 GOSUB 300
2810 PRINT
2820 I=I1-D1
2830 IF P(I,1)=1 THEN 2900
2840 REM--NOW PLAY THE TWO HANDS
2850 PRINT "HAND";1-(I>D1);
2860 GOSUB 800
2870 I=I+D1
2880 IF I=I1 THEN 2850
2890 I=I1-D1
2900 NEXT I
2905 I=D1
2910 GOSUB 300
2920 REM--TEST FOR PLAYING DEALER'S HAND
2930 FOR I=1 TO N
2940 IF R(I)>0 OR R(I+D1)>0 THEN 3010
2950 NEXT I
2960 PRINT "DEALER HAD A";
2970 X=P(D1,2)
2980 GOSUB 700
2990 PRINT " CONCEALED."
3000 GOTO 3140
3010 PRINT "DEALER HAS A";MID$(D$,3*P(D1,2)-2,3);" CONCEALED ";
3020 I=D1
3030 AA=HANDVAL(Q(I))
3035 PRINT "FOR A TOTAL OF";AA
3040 IF AA>16 THEN 3130
3050 PRINT "DRAWS";
3060 GOSUB 100
3070 GOSUB 750
3080 GOSUB 1100
3090 AA=HANDVAL(Q)
3095 IF Q>0 AND AA<17 THEN 3060
3100 Q(I)=Q-(Q<0)/2
3110 IF Q<0 THEN 3140
3120 AA=HANDVAL(Q)
3125 PRINT "---TOTAL IS";AA
3130 PRINT
3140 REM--TALLY THE RESULT
3150 REM
3160 Z$="LOSES PUSHES WINS "
3165 PRINT
3170 FOR I=1 TO N
3180 AA=HANDVAL(Q(I))
3182 AB=HANDVAL(Q(I+D1))
3184 AC=HANDVAL(Q(D1))
3186 S(I)=S(I)+B(I)*SGN(AA-AC)+B(I+D1)*SGN(AB-AC)
3188 B(I+D1)=0
3200 PRINT "PLAYER";I;
3210 PRINT MID$(Z$,SGN(S(I))*6+7,6);" ";
3220 IF S(I)<>0 THEN 3250
3230 PRINT "      ";
3240 GOTO 3260
3250 PRINT ABS(S(I));
3260 T(I)=T(I)+S(I)
3270 PRINT "TOTAL=";T(I)
3280 GOSUB 1200
3290 T(D1)=T(D1)-S(I)
3300 I=I+D1
3310 GOSUB 1200
3320 I=I-D1
3330 NEXT I
3340 PRINT "DEALER'S TOTAL=";T(D1)
3345 PRINT
3350 GOSUB 1200
3360 GOTO 1810
