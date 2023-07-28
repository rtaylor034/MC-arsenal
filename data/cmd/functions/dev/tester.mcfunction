

scoreboard players remove test.i var 1


data modify storage cmd:var display.list.items prepend value {Count:1b,id:"minecraft:stone",tag:{menu:{playerbox:{s1:2}}}}
data modify block 0 0 0 front_text.messages[0] set value '{"score":{"name":"test.i","objective":"var"},"italic":true}'
data modify storage cmd:var display.list.items[0].tag.display.Name set from block 0 0 0 front_text.messages[0]

execute if score test.i var matches 1.. run function cmd:dev/tester
