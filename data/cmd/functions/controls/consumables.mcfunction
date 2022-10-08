
#DESC - designated for all controls regarding consumables, notably the main consumable array.
#IMPORTANT NOTE - make sure to not have any duplicate "id" keys in any array.










#DEV NOTE - Consumable descriptions are to be stored in a different array (will do later). I want everything to be finalized before i create descriptions.
#MAIN CONSUMABLE ARRAY
#refer to ability array
data modify storage cmd:controls/consumables array set value []
data modify storage cmd:controls/consumables array append value {id:-1,name:"Test Consumable 1", devName:"test_consumable1",buyCost:100}
data modify storage cmd:controls/consumables array append value {id:-2, name:"Test Consumable 2", devName:"test_consumable2",buyCost:200}
data modify storage cmd:controls/consumables array append value {id:-3,name:"Test Consumable 3", devName:"test_consumable3",buyCost:300}
data modify storage cmd:controls/consumables array append value {id:-4,name:"Test Consumable 4", devName:"test_consumable4",buyCost:400}
