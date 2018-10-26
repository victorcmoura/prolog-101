:- op(900, xfx, [isTypeOf, isA, belongsTo]).

contact("Joe", "000 000 000", 21).
contact("Matthew", "111 111 111", 21).
contact("Sandra", "222 222 222", 20).
contact("Lucy", "333 333 333", 19).

colleague isTypeOf simpleContact.
family isTypeOf specialContact.

"Joe" isA family.
"Matthew" isA colleague.
"Sandra" isA family.
"Lucy" isA colleague.

Someone belongsTo specialContact :- Someone isA KindOfSpecialContact, KindOfSpecialContact isTypeOf specialContact, write(Someone), write(" is a special contact"), nl, fail.

Someone belongsTo simpleContact :- Someone isA KindOfSimpleContact, KindOfSimpleContact isTypeOf simpleContact, write(Someone), write(" is a simple contact"), nl, fail.

findAll(Age, Result) :- findall(Name, contact(Name, _, Age), Result).

getAllTelephones() :- 
    contact(Name, Telephone, _), 
    write(Name), 
    write(": "), 
    write(Telephone), 
    nl, 
    fail.