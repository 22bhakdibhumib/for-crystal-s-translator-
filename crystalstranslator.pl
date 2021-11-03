main:- 
    dynamic(latin/2),
    consult('D:/School/Comp Sci/AI/Programs/latin.pl'),
    showinstructions,
    process_query.
    
showinstructions :-
    write('Welcome to the Latin translator!'), nl,
    write('All entries should be lower-case.'), nl,
    write('Enter addtranslation to add a new entry.'), nl,
    write('Enter stop to quit.'), nl, nl.
    
process_query :-
    write('Please enter English word: '),nl,
    read(Input),
    answer(Input).
    
answer(stop) :-
    write('Saving the knowledge base . . .'),
    nl,
    tell('H:/Artificial Intelligence/latin.pl'),
    listing(latin),
    told,
    write('Goodbye!').
    
answer(addLatin) :-
    write('What is the English word? '),
    read(English),
    write('What is the Latin word? '),
    read(Latin),
    write('Thank you.'), nl, nl,
    assertz(latin(English,Latin)),
    process_query.
    
    
    
answer(English) :- latin(English, Latin), 
    write('The Latin word for'),
    write(English),
    write('is'),
    write(Latin), nl, nl, 
    process_query.
    
    /* 
    Please enter an English word: 
    |: always.
    The Latin word for spring is semper
    */
    
answer(English) :- \+ latin(English, _),
    write("I do not know the Latin word for "), 
    write(English), 
    write("."), nl, nl,
    write("What is the Latin word for "),
    write(English),
    write("? "),
    read(Latin),
    assertz(latin(English, Latin)),
    write("Thank you."),
    nl, nl,
    process_query.
    
    /*
    winter.
    I do not know the Latin word for winter.
    What is the Latin word for winter? 
    |: hiems.
    Thank you.
    Please enter an English word: 
    |: winter.
    The Latin word for winter is hiems.
    */
    
answer(stop) :-
    write('Saving the knowledge base . . .'),
    nl,
    tell('D:/School/Comp Sci/AI/Programs/latin.pl'),
    listing(latin),
    told,
    write('Goodbye!').
    