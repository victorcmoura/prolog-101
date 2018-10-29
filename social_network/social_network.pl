:- dynamic user/4.

:- op(900, xfx, [isFriendWith, isA, isTypeOf, friendedWith, relatedTo]).

user("Victor", 21, m, c).
user("Lucas", 43, f, c).
user("Luiz", 34, m, f).
user("Ana", 61, f, f).
user("Fabio", 25, m, c).
user("Caio", 22, m, f).

"Victor" isFriendWith "Lucas".
"Victor" isFriendWith "Luiz".
"Victor" isFriendWith "Ana".

"Ana" isFriendWith "Fabio".
"Ana" isFriendWith "Caio".

"Caio" isFriendWith "Victor".

Someone friendedWith Other :- Other isFriendWith Someone, write("Are friends"), nl, !; Someone isFriendWith Other, write("Are friends"), nl, !; write("Are not friends"), nl, !.

Someone relatedTo Other :- Other isFriendWith Someone; Someone isFriendWith Other.

allFriends(Someone, Result) :- findall(Friend, Someone relatedTo Friend, Result).

allUsers() :- user(Name, Age, _, _), write("Name: "), write(Name), write(", "), write(Age), nl, fail.

createUser(Name, Age, Gender, Type) :- asserta(user(Name, Age, Gender, Type)).