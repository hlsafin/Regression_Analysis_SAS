data homicide;
infile "C:\Users\safin\Downloads\mtgo decks\ch08q04.txt" 
delimiter=",";
input city Y X1 X2 X3;
run;

proc print data=homicide;
run;
proc reg data=homicide;
model Y= X2 X3;

run;


proc glm data=homicide;
model Y=   X1 X2 X3;

run;


proc reg data=homicide;
model Y=  X3;
model Y=  X2 X3;

run;
proc glm data=homicide;
model Y=  X2 X3 (X2 X3);

run;

proc reg data=homicide;
model Y=  X1 X2 X3;
run;
proc reg data=homicide;
model Y=  X3 X2;
run;

data autos;
infile "C:\Users\safin\Downloads\mtgo decks\93cars.txt";
input manufacturer $1-14 model $15-29 type $30-36 min_price mid_pricemax_price city_mpg hwy_mpg air_bags drive_train cylinders engine_size horsepower rpm;
run;
proc print data=autos;
run;

proc glm data=autos;
class type;
model min_price=type engine_size type*engine_size;
run;

proc glm data=autos;
class type;
model min_price= type engine_size/solution;
run;
proc univariate data=autos;
var engine_size;
run;

