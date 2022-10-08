#IN - [in -> cmd:process/math/rgbtodecimal = Obj{r:<int>, g:<int>, b:<int>}] | RGB value
#OUT - (rgbtodecimal.out -> var) | decimal value
#USE - converts (IN) RGB values to a decimal number. (#RRGGBB -> decimal integer).

#NOTE - (IN) value ranges from -255 to 255. an example would be {r:255, g:0, b:128}.


#STORE
execute store result score red var run data get storage cmd:process/math/rgbtodecimal in.r 65536
execute store result score green var run data get storage cmd:process/math/rgbtodecimal in.g 256
execute store result score blue var run data get storage cmd:process/math/rgbtodecimal in.b 1
#ADD
scoreboard players operation rgbtodecimal.out var = red var
scoreboard players operation rgbtodecimal.out var += green var
scoreboard players operation rgbtodecimal.out var += blue var





#RESETS
data remove storage cmd:process/math/rgbtodecimal in
scoreboard players reset red var
scoreboard players reset blue var
scoreboard players reset green var
