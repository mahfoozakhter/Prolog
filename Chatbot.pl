go:-hypothesis(Disease),
format('I belive you have a ~w',[Disease]),
nl,
undo.
hypothesis(cold) :- cold,!.
hypothesis(flu) :- flu, !.
hypothesis(ebola):- ebola, !.
hypothesis(pneumonia):- pneumonia,!.
hypothesis(covid):- covid,!.
hypothesis(malaria):- malaria,!.
hypothesis(typhoid):- typhoid,!. 
hypothesis(unknown).
cold:-
verify(stuffy_nose),
verify(sore_throat),
verify(cough),
verify(congestion),
verify(body_ache),
verify(sneezing),
verify(fever).
flu:-
verify(fever),
verify(cough),
verify(fatigue),
verify(sore_throat),
verify(stuffy_nose),
verify(body_ache),
verify(head_ache).
ebola:-
verify(fever),
verify(head_ache),
verify(fatigue),
verify(vomitting),
verify(stomach_pain),
verify(bleeding).
pneumonia:-
verify(cough),
verify(fever),
verify(short_breath),
verify(chest_pain),
verify(fatigue),
verify(nausea).
covid:-
verify(fever),
verify(cough),
verify(fatigue),
verify(sore_throat),
verify(head_ache),
verify(short_breath),
verify(chest_pain).
malaria:-
verify(fever),
verify(chills),
verify(head_ache),
verify(fatigue),
verify(nausea),
verify(vomitting),
verify(body_ache),
verify(fever).
ask(Question) :-
write('Does the patient have the following symptoms '),
write(Question),
write('?'),
read(Response),
nl,
((Response == yes; Response == y)
-> 
asserta(yes(Question));
asserta(no(Question)), fail).
:- dynamic(yes/1,no/1).
verify(S):-
(yes(S)
->
true ;
(no(S)
->
fail;
ask(S) )).
undo:- retract(yes(_)),fail.
undo:- retract(no(_)),fail.
undo.
