3 RANDOMIZE
4 DECLARE INTEGER P     ! needed for (1-P) to work
5 PRINT TAB(31);"BASKETBALL"
7 PRINT TAB(15);"CREATIVE COMPUTING  MORRISTOWN, NEW JERSEY"
8 PRINT LF + LF
10 PRINT "THIS IS DARTMOUTH COLLEGE BASKETBALL.  YOU WILL BE DARTMOUTH"
20 PRINT " CAPTAIN AND PLAYMAKER.  CALL SHOTS AS FOLLOWS:  1. LONG"
30 PRINT " (30 FT.) JUMP SHOT; 2. SHORT (15 FT.) JUMP SHOT; 3. LAY"
40 PRINT " UP; 4. SET SHOT."
60 PRINT "BOTH TEAMS WILL USE THE SAME DEFENSE.  CALL DEFENSE AS"
70 PRINT "FOLLOWS:  6. PRESS; 6.5 MAN-TO MAN; 7. ZONE; 7.5 NONE."
72 PRINT "TO CHANGE DEFENSE, JUST TYPE 0 AS YOUR NEXT SHOT."
76 INPUT "YOUR STARTING DEFENSE WILL BE";D \ IF D<6 THEN GOTO 76
79 PRINT
80 INPUT "CHOOSE YOUR OPPONENT";O$
370 PRINT "CENTER JUMP"
390 IF RND > 3/5 THEN 420
400 PRINT O$;" CONTROLS THE TAP."
410 GOTO 3000
420 PRINT "DARTMOUTH CONTROLS THE TAP."
425 PRINT
430 INPUT "YOUR SHOT";Z
440 P=0
445 IF Z<>INT(Z) THEN 455
446 IF Z<1 OR Z>4 THEN 455
447 GOTO 460
455 PRINT "INCORRECT ANSWER.  RETYPE IT. "; \ GOTO 430
460 IF RND<.5 THEN 1000
480 IF T<100 THEN 1000
490 PRINT
491 IF S(1)<>S(0) THEN 510
492 PRINT CR + LF + "   ***** END OF SECOND HALF *****" + LF
493 PRINT "SCORE AT END OF REGULATION TIME:"
494 PRINT "        DARTMOUTH:";S(1);"  ";O$;":";S(0)
495 PRINT
496 PRINT "BEGIN TWO MINUTE OVERTIME PERIOD"
499 T=93
500 GOTO 370
510 PRINT "   ***** END OF GAME *****"
515 PRINT "FINAL SCORE: DARTMOUTH:";S(1);"  ";O$;":";S(0)
520 GOTO 9999
600 PRINT
610 PRINT "   *** TWO MINUTES LEFT IN THE GAME ***"
620 PRINT
630 RETURN
1000 ON Z GOTO 1040,1040 OTHERWISE 1300
1040 T=T+1
1041 IF T=50 THEN 8000
1042 IF T=92 THEN 1046
1043 GOTO 1050
1046 GOSUB 600
1050 PRINT "JUMP SHOT"
1060 IF RND>.341*D/8 THEN 1090
1070 PRINT "SHOT IS GOOD."
1075 GOSUB 7000
1085 GOTO 3000
1090 IF RND>.682*D/8 THEN 1200
1100 PRINT "SHOT IS OFF TARGET."
1105 IF D/6*RND>.45 THEN 1130
1110 PRINT "DARTMOUTH CONTROLS THE REBOUND."
1120 GOTO 1145
1130 PRINT "REBOUND TO ";O$
1140 GOTO 3000
1145 IF RND>.4 THEN 1158
1150 GOTO 1300
1158 IF D=6 THEN 5100
1160 PRINT "BALL PASSED BACK TO YOU. ";
1170 GOTO 430
1200 IF RND>.782*D/8 THEN 1250
1210 PRINT "SHOT IS BLOCKED.  BALL CONTROLLED BY ";
1230 IF RND>.5 THEN 1242
1235 PRINT "DARTMOUTH."
1240 GOTO 430
1242 PRINT O$;"."
1245 GOTO 3000
1250 IF RND>.843*D/8 THEN 1270
1255 PRINT "SHOOTER IS FOULED.  TWO SHOTS."
1260 GOSUB 4000
1265 GOTO 3000
1270 PRINT "CHARGING FOUL.  DARTMOUTH LOSES BALL."
1280 GOTO 3000
1300 T=T+1
1301 IF T=50 THEN 8000
1302 IF T=92 THEN 1304
1303 GOTO 1305
1304 GOSUB 600
1305 IF Z=0 THEN 2010
1310 IF Z>3 THEN 1700
1320 PRINT "LAY UP."
1330 IF 7/D*RND>.4 THEN 1360
1340 PRINT "SHOT IS GOOD.  TWO POINTS."
1345 GOSUB 7000
1355 GOTO 3000
1360 IF 7/D*RND>.7 THEN 1500
1370 PRINT "SHOT IS OFF THE RIM."
1380 IF RND>2/3 THEN 1415
1390 PRINT O$;" CONTROLS THE REBOUND."
1400 GOTO 3000
1415 PRINT "DARTMOUTH CONTROLS THE REBOUND."
1420 IF RND>.4 THEN 1440
1430 GOTO 1300
1440 PRINT "BALL PASSED BACK TO YOU.";
1450 GOTO 430
1500 IF 7/D*RND>.875 THEN 1600
1510 PRINT "SHOOTER FOULED.  TWO SHOTS."
1520 GOSUB 4000
1530 GOTO 3000
1600 IF 7/D*RND>.925 THEN 1630
1610 PRINT "SHOT BLOCKED. ";O$;"'S BALL."
1620 GOTO 3000
1630 PRINT "CHARGING FOUL.  DARTMOUTH LOSES THE BALL."
1640 GOTO 3000
1700 PRINT "SET SHOT."
1710 GOTO 1330
2010 INPUT "YOUR NEW DEFENSIVE ALIGNMENT IS";D
2030 IF D<6 THEN 2010
2040 GOTO 425
3000 P=1
3005 T=T+1
3008 IF T=50 THEN 8000
3012 GOTO 3018
3018 PRINT
3020 Z1=10/4*RND+1
3030 IF Z1>2 THEN 3500
3040 PRINT "JUMP SHOT."
3050 IF 8/D*RND>.35 THEN 3100
3060 PRINT "SHOT IS GOOD."
3080 GOSUB 6000
3090 GOTO 425
3100 IF 8/D*RND>.75 THEN 3200
3105 PRINT "SHOT IS OFF RIM."
3110 IF D/6*RND>.5 THEN 3150
3120 PRINT "DARTMOUTH CONTROLS THE REBOUND."
3130 GOTO 425
3150 PRINT O$;" CONTROLS THE REBOUND."
3160 IF D=6 THEN 5000
3165 IF RND>.5 THEN 3175
3168 PRINT "PASS BACK TO ";O$;" GUARD."
3170 GOTO 3000
3175 GOTO 3500
3200 IF 8/D*RND>.9 THEN 3310
3210 PRINT "PLAYER FOULED.  TWO SHOTS."
3220 GOSUB 4000
3230 GOTO 425
3310 PRINT "OFFENSIVE FOUL.  DARTMOUTH'S BALL."
3320 GOTO 425
3500 IF Z1>3 THEN 3800
3510 PRINT "LAY UP."
3520 IF 7/D*RND>.413 THEN 3600
3530 PRINT "SHOT IS GOOD."
3540 GOSUB 6000
3550 GOTO 425
3600 PRINT "SHOT IS MISSED."
3610 GOTO 3110
3800 PRINT "SET SHOT."
3810 GOTO 3520
4000 REM FOUL SHOOTING
4010 IF RND>.49 THEN 4050
4020 PRINT "SHOOTER MAKES BOTH SHOTS."
4030 S(1-P)=S(1-P)+2
4040 GOSUB 6010
4041 RETURN
4050 IF RND>.75 THEN 4100
4060 PRINT "SHOOTER MAKES ONE SHOT AND MISSES ONE."
4070 S(1-P)=S(1-P)+1
4080 GOTO 4040
4100 PRINT "BOTH SHOTS MISSED."
4110 GOTO 4040
5000 IF RND>.75 THEN 5010
5005 GOTO 3165
5010 PRINT "BALL STOLEN.  EASY LAY UP FOR DARTMOUTH."
5015 GOSUB 7000
5030 GOTO 3000
5100 IF RND>.6 THEN 5120
5110 GOTO 1160
5120 PRINT "PASS STOLEN BY ";O$;" EASY LAYUP."
5130 GOSUB 6000
5140 GOTO 425
6000 S(0)=S(0)+2
6010 PRINT "SCORE: ";S(1);"TO";S(0)
6020 RETURN
7000 S(1)=S(1)+2
7010 GOSUB 6010
7020 RETURN
8000 PRINT CR + LF + "   ***** END OF FIRST HALF *****" + LF
8010 PRINT "SCORE: DARTMOUTH:";S(1);"  ";O$;":";S(0)
8015 PRINT
8016 PRINT
8020 GOTO 370
9999 END
