



data modify storage cmd:var get.keysuffix set from storage cmd:process/array/cycleto out[0].keybind

#sign parse
data merge block 0 0 0 {Text1:'[{"text":"<","color":"dark_aqua","bold":true,"italic":false},{"nbt":"get.keysuffix","storage":"cmd:var","interpret":true,"color":"dark_aqua","bold":false,"italic":false},{"text":">","color":"dark_aqua","bold":true,"italic":false}]'}
data modify storage cmd:var get.keysuffix set from block 0 0 0 Text1
