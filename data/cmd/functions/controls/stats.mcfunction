
#DESC - designated for all controls regarding stats (not gained by armor)

#armor stat id key:
#1 = Power
#2 = Protection
#3 = Vitality/Health
#4 = Movement Speed
#5 = Focus
#6 = Strength

# weapon stat id key:
#1 = damage
#2 = attack speed
#3 = max energy


#==== PLAYER ====
#ENERGY
#"baseRate" is default for energy gained per second.
#"interval" is the time inbetween each energy gain in ticks. (ex: if baseRate is 10, and interval is 10, then the player will gain 5 energy every 10 ticks, because 5 energy per 10 ticks, is equal to 10 energy per 1 second (20 ticks))
#base energy max can be found in controls/armor in statIdentities
data modify storage cmd:controls/stats energy set value {baseRate:20, interval:2}



#==== RATIOS ====
#STRENGTH STAT TO WEAPON STAT RATIO
#controls the ratio of weapon stat points gained per strength stat point
#each strength stat increases the specified weapon stat by numerator/denominator
data modify storage cmd:controls/stats strengthToWeapon.dmg.numerator set value 1
data modify storage cmd:controls/stats strengthToWeapon.dmg.denominator set value 4
data modify storage cmd:controls/stats strengthToWeapon.aspeed.numerator set value 1
data modify storage cmd:controls/stats strengthToWeapon.aspeed.denominator set value 11


#MOVEMENT SPEED RATIO
#controls the ratio of the movement speed stat to actual gained movement speed
#the "multiplier" controls how much movement speed (in percent) a player gains per 10 speed stat.
#the "base" controls the percent movement speed the player moves at by default +100% (0 would be 100% movement speed, or normal MC)
data modify storage cmd:controls/stats moveSpeed set value {base:100, multiplier:15}


#VITALITY HEALTH RATIO
#(Vitality is now a hidden stat, cannot be upgraded, so all players will probably have 0)
#controls the ratio of max health gained per vitality stat (stat_health)
#"base" controls the default max health the player has.
#"multiplier" is how much max health is gained per vitality stat. (<numerator> max health gained per <denominator> stats).
data modify storage cmd:controls/stats maxHealth set value {base:1000, multiplier:{numerator:8,denominator:1}}
