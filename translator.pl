/*
Name: Bing Bhakdibhumi
Date: 16 Feb 2021
Description: This program consults a Japanese language database, accepts a user input in English, then returns the Japanese word for it. If the database does not have the translation for the English word, the program will ask for the user to manually input the translation, then add that translation to the database.
*/

main :- 
    dynamic(japanese/2),
    dynamic(mandarin/2),
    consult('D:/School/Comp Sci/AI/Programs/japanese.pl'),
    %consult('D:/School/Comp Sci/AI/mandarin.pl'),
    showinstructions,
    process_query.

showinstructions :-
    write("Welcome to the translator!"), nl,
    write("All entries have to be in lower-case."), nl,
    write("Enter 'addjapanese.' or 'addmandarin.' to add a new entry. This feature is still in development."), nl,
    write("Enter 'stop.' to quit."), nl, nl.
    
process_query :-
    write("Please enter an English word: "), nl,
    read(Input),
    answer(Input).

answer(stop) :- 
    write("Saving the knowledge base..."),
    nl,
    tell('D:/School/Comp Sci/AI/Programs/japanese.pl'),
    listing(japanese),
    told,
    write("Goodbye!").

answer(addjapanese) :-
    nl,
    write("What is the English word? "),
    read(English),
    write("What is the Japanese word? "),
    read(Japanese),
    write("Thank you."), nl, nl,
    assertz(japanese(English, Japanese)),
    process_query.
    
answer(English) :- japanese(English, Japanese), %mandarin(English, Mandarin),
    write("The Japanese word for "),
    write(English),
    write(" is "),
    write(Japanese), nl, nl, 
    /*write("The Mandarin word for "),
    write(English),
    write(" is "),
    write(Mandarin), nl, nl,*/
    process_query.
/* 
Please enter an English word: 
|: spring.
The Japanese word for spring is haru
*/

answer(English) :- \+ japanese(English, _),
    write("I do not know the Japanese word for "), 
    write(English), 
    write("."), nl, nl,
    write("What is the Japanese word for "),
    write(English),
    write("? "),
    read(Japanese),
    assertz(japanese(English, Japanese)),
    write("Thank you."),
    nl, nl,
    process_query.
/*
 delicious.
I do not know the Japanese word for delicious.

What is the Japanese word for delicious? |: oishii.
Thank you.

Please enter an English word: 
|: delicious.
The Japanese word for delicious is oishii
*/
    
/*answer(English) :- \+ mandarin(English, _),
    write("I do not know the Mandarin word for "), 
    write(English), 
    write("."), nl, nl,
    write("What is the Mandarin word for "),
    write(English),
    write("? "),
    read(Mandarin),
    assertz(mandarin(English, Mandarin)),
    write("Thank you."),
    nl, nl,
    process_query.*/



    





