animal(dog).
fruit(kiwi).
weapon(gun).
hardware(keyboard).
androidphone(samsung).
male(kamal).
student(kamal).
black(elephant).
shape(circle).
vehicle(bus).
studies(charlie.ai).
teaches(collins,cs).
loves(vincent,mia).
next_month(october,septemper).
student(jane,roy).
color(elephant,black).

month(january).
month(february).
month(march).
month(april).
month(may).
month(june).
month(july).
month(august).
month(september).
month(october).
month(november).
month(december).

date31(january).
date31(march).
date31(may).
date31(july).
date31(august).
date31(october).
date31(december).

date30(april).
date30(june).
date30(september).
date30(november).

date28(february).

likes(john,ann).
likes(kamala,mia).
likes(kamala,mary).
likes(mia,mary).
likes(john,colin).
likes(roy,mary).
likes(mary,roy).

friends(X,Y):-likes(X,Y);likes(Y,X).
