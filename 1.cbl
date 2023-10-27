       IDENTIFICATION DIVISION.
       PROGRAM-ID. SquareNumber.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01 WS-NUMBER               PIC 9(5).
       01 WS-NUMBER-SQUARED       PIC 9(10).
       01 WS-RESPONSE             PIC X.

       PROCEDURE DIVISION.
       DISPLAY 'Enter a number (up to 5 digits): ' NO ADVANCING.
       ACCEPT WS-NUMBER.
       
       COMPUTE WS-NUMBER-SQUARED = WS-NUMBER * WS-NUMBER.

       DISPLAY 'The square of ' WS-NUMBER ' is: ' WS-NUMBER-SQUARED.
       DISPLAY 'Do you want to square another number? (Y/N): ' NO ADVANCING.
       ACCEPT WS-RESPONSE FROM CONSOLE.

       EVALUATE WS-RESPONSE
         WHEN 'Y' OR 'y' GO TO PROCEDURE DIVISION
         WHEN OTHER STOP RUN
       END-EVALUATE.
