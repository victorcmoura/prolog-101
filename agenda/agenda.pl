:- dynamic contact/4.

:- op(900, xfx, [isTypeOf, isA, belongsTo]).

contact("Joe", "000 000 000", 21, f).
contact("Matthew", "111 111 111", 21, c).
contact("Sandra", "222 222 222", 20, f).
contact("Lucy", "333 333 333", 19, c).

colleague isTypeOf simpleContact.
family isTypeOf specialContact.

f isA family.
f isA colleague.

Someone belongsTo specialContact :- contact(Someone, _, _, Category), Category isA KindOfSpecialContact, KindOfSpecialContact isTypeOf specialContact, write(Someone), write(" is a special contact"), nl, fail.

Someone belongsTo simpleContact :- contact(Someone, _, _, Category), Category isA KindOfSimpleContact, KindOfSimpleContact isTypeOf simpleContact, write(Someone), write(" is a simple contact"), nl, fail.

findAll(Age, Result) :- findall(Name, contact(Name, _, Age, _), Result).

insertContact(Name, Telephone, Age, Type) :- asserta(contact(Name, Telephone, Age, Type)).

getAllTelephones() :- 
    contact(Name, Telephone, _), 
    write(Name), 
    write(": "), 
    write(Telephone),
    nl, 
    fail.