
#IN - A (ticks2sec.ticks -> var) | ticks to display
#OUT - A [out -> cmd:process/text/ticks2sec ; JsonString] | Display in seconds
#CONTEXT - N/A

#DESC - Converts the amount of ticks specified in [A] to a decimal display in seconds to [OUT A] with 1 decimal precision

#EX: [A] = 50, | [OUT A] = {"text":"2.5"}


#WHOLE NUMBER
scoreboard players operation ticks2sec.whole var = ticks2sec.ticks var
scoreboard players operation ticks2sec.whole var /= 20 const

#DECIMAL
scoreboard players operation ticks2sec.ticks var %= 20 const
scoreboard players operation ticks2sec.ticks var /= 2 const

#parse
data merge block 0 0 0 {Text1:'[{"score":{"name":"ticks2sec.whole","objective":"var"}},{"text":"."},{"score":{"name":"ticks2sec.ticks","objective":"var"}}]'}

#out
data modify storage cmd:process/text/ticks2sec out set from block 0 0 0 Text1



#RESETS
scoreboard players remove ticks2sec.ticks var
scoreboard players remove ticks2sec.decimal var
