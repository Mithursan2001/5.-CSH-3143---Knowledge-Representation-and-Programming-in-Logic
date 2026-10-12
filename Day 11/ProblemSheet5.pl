car(toyota, model(corolla), engine(1600), color(blue, white, yellow)).
car(honda, model(civic), engine(1800), color(red)).
car(nissan, model(altima), engine(2000), color(black, grey)).

car(Make, Model, Engine, color(blue, _, _)).
/* output 1
?- car(Make, Model, Engine, color(blue, _, _)).
Make = toyota,
Model = model(corolla),
Engine = engine(1600) ;
true.
*/

car(toyota, _, engine(Capacity), _).

/*output 2
?- car(toyota, _, engine(Capacity), _).
Capacity = 1600 ;
true .
*/


/*output 3

Compound structures like color(blue, white, yellow) are useful because:
They group related information under one functor (color).
This keeps the database organized and easy to read.
They allow Prolog to match or extract parts using pattern matching.
They can represent complex objects (like cars) in a structured way.
You can nest compound terms to build multi-level information.
Example: color(blue, white, yellow)
"color" is the functor
blue, white, yellow are the arguments
Together they form one structured piece of data about the car

*/


