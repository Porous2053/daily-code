       IDENTIFICATION DIVISION.
       PROGRAM-ID. BookManager.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01 BOOKS-TABLE.
          05 BOOK-COUNT              PIC 9(3)  VALUE 0.
          05 BOOK                   OCCURS 100 TIMES.
             10 BOOK-TITLE          PIC X(50).
             
       01 CHOICE                   PIC 9      VALUE 0.
       01 NEW-TITLE                PIC X(50).
       01 DELETE-CHOICE            PIC 9(3).
       01 INDEX                   PIC 9(3).

       PROCEDURE DIVISION.
       MAIN-PARAGRAPH.
           DISPLAY 'BOOK MANAGER'.
           DISPLAY '1. Add Book'.
           DISPLAY '2. List Books'.
           DISPLAY '3. Delete Book'.
           DISPLAY '4. Exit'.
           DISPLAY 'Choose an option (1-4): ' NO ADVANCING.
           ACCEPT CHOICE.

           EVALUATE CHOICE
               WHEN 1 PERFORM ADD-BOOK-PARAGRAPH
               WHEN 2 PERFORM LIST-BOOKS-PARAGRAPH
               WHEN 3 PERFORM DELETE-BOOK-PARAGRAPH
               WHEN 4 GO TO END-PARAGRAPH
               WHEN OTHER DISPLAY 'Invalid option!'
           END-EVALUATE.
           GO TO MAIN-PARAGRAPH.

       ADD-BOOK-PARAGRAPH.
           IF BOOK-COUNT NOT LESS THAN 100
               DISPLAY 'Book list is full!'
               GO TO MAIN-PARAGRAPH
           END-IF.
           
           DISPLAY 'Enter book title (max 50 chars): ' NO ADVANCING.
           ACCEPT NEW-TITLE.
           ADD 1 TO BOOK-COUNT.
           MOVE NEW-TITLE TO BOOK(BOOK-COUNT).
           DISPLAY 'Book added!'.
           GO TO MAIN-PARAGRAPH.

       LIST-BOOKS-PARAGRAPH.
           IF BOOK-COUNT IS ZERO
               DISPLAY 'No books added yet!'
               GO TO MAIN-PARAGRAPH
           END-IF.
           
           DISPLAY 'List of books:'.
           PERFORM VARYING INDEX FROM 1 BY 1 UNTIL INDEX > BOOK-COUNT
               DISPLAY INDEX ' ' BOOK(INDEX)
           END-PERFORM.
           GO TO MAIN-PARAGRAPH.

       DELETE-BOOK-PARAGRAPH.
           IF BOOK-COUNT IS ZERO
               DISPLAY 'No books to delete!'
               GO TO MAIN-PARAGRAPH
           END-IF.
           
           DISPLAY 'Enter the number of the book to delete: ' NO ADVANCING.
           ACCEPT DELETE-CHOICE.
           
           IF DELETE-CHOICE < 1 OR DELETE-CHOICE > BOOK-COUNT
               DISPLAY 'Invalid choice!'
               GO TO MAIN-PARAGRAPH
           END-IF.
           
           PERFORM VARYING INDEX FROM DELETE-CHOICE BY 1 UNTIL INDEX >= BOOK-COUNT
               MOVE BOOK(INDEX + 1) TO BOOK(INDEX)
           END-PERFORM.
           SUBTRACT 1 FROM BOOK-COUNT.
           DISPLAY 'Book deleted!'.
           GO TO MAIN-PARAGRAPH.

       END-PARAGRAPH.
           DISPLAY 'Thanks for using Book Manager!'.
           STOP RUN.
