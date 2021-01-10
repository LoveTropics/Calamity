# Called from: nowhere

#---------------------------------------------------------------------------------------------------
# Purpose: Sets the world back to development mode.
#---------------------------------------------------------------------------------------------------
# We're actively develping Calamity, and sometimes that means changing the physical level. The level
#   is stored in structure files which are in this datapack. This means we're able to place
#   structure blocks to both place

# Place structure blocks which reference Calamity's structures

# Saving structure blocks
# Left side always copys to right side
setblock 142 0 110 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:1,mode:"SAVE",posY:0,sizeX:33,posZ:0,integrity:1.0f,showair:0b,name:"moesh:calamity1",sizeY:48,sizeZ:22,showboundingbox:1b}
setblock 142 1 110 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:1,mode:"SAVE",posY:47,sizeX:33,posZ:0,integrity:1.0f,showair:0b,name:"moesh:calamity2",sizeY:22,sizeZ:22,showboundingbox:1b}
setblock 142 0 132 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:1,mode:"SAVE",posY:0,sizeX:33,posZ:0,integrity:1.0f,showair:0b,name:"moesh:calamity3",sizeY:48,sizeZ:48,showboundingbox:1b}
setblock 142 1 132 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:1,mode:"SAVE",posY:47,sizeX:33,posZ:0,integrity:1.0f,showair:0b,name:"moesh:calamity4",sizeY:22,sizeZ:48,showboundingbox:1b}
setblock 142 0 180 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:1,mode:"SAVE",posY:0,sizeX:33,posZ:0,integrity:1.0f,showair:0b,name:"moesh:calamity5",sizeY:48,sizeZ:16,showboundingbox:1b}
setblock 142 1 180 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:1,mode:"SAVE",posY:47,sizeX:33,posZ:0,integrity:1.0f,showair:0b,name:"moesh:calamity6",sizeY:22,sizeZ:16,showboundingbox:1b}
# Entire crosslane structure
setblock 131 0 180 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:-1,mode:"SAVE",posY:0,sizeX:13,posZ:1,integrity:1.0f,showair:0b,name:"moesh:calamity7",sizeY:48,sizeZ:15,showboundingbox:1b}
setblock 131 1 180 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:-1,mode:"SAVE",posY:47,sizeX:13,posZ:1,integrity:1.0f,showair:0b,name:"moesh:calamity8",sizeY:22,sizeZ:15,showboundingbox:1b}
# Starting area
setblock 176 0 109 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:0,mode:"SAVE",posY:0,sizeX:22,posZ:1,integrity:1.0f,showair:0b,name:"moesh:calamity9",sizeY:48,sizeZ:22,showboundingbox:1b}
setblock 176 1 109 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:0,mode:"SAVE",posY:47,sizeX:22,posZ:1,integrity:1.0f,showair:0b,name:"moesh:calamity10",sizeY:22,sizeZ:22,showboundingbox:1b}

# Loading structure blocks
# Right side
setblock 130 0 110 minecraft:structure_block[mode=load]{metadata:"",mirror:"LEFT_RIGHT",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"CLOCKWISE_180",posX:-1,mode:"LOAD",posY:0,sizeX:33,posZ:0,integrity:1.0f,showair:0b,name:"moesh:calamity1",sizeY:48,sizeZ:22,showboundingbox:1b}
setblock 130 1 110 minecraft:structure_block[mode=load]{metadata:"",mirror:"LEFT_RIGHT",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"CLOCKWISE_180",posX:-1,mode:"LOAD",posY:47,sizeX:33,posZ:0,integrity:1.0f,showair:0b,name:"moesh:calamity2",sizeY:22,sizeZ:22,showboundingbox:1b}
setblock 130 0 132 minecraft:structure_block[mode=load]{metadata:"",mirror:"LEFT_RIGHT",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"CLOCKWISE_180",posX:-1,mode:"LOAD",posY:0,sizeX:33,posZ:0,integrity:1.0f,showair:0b,name:"moesh:calamity3",sizeY:48,sizeZ:48,showboundingbox:1b}
setblock 130 1 132 minecraft:structure_block[mode=load]{metadata:"",mirror:"LEFT_RIGHT",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"CLOCKWISE_180",posX:-1,mode:"LOAD",posY:47,sizeX:33,posZ:0,integrity:1.0f,showair:0b,name:"moesh:calamity4",sizeY:22,sizeZ:48,showboundingbox:1b}
setblock 130 0 180 minecraft:structure_block[mode=load]{metadata:"",mirror:"LEFT_RIGHT",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"CLOCKWISE_180",posX:-1,mode:"LOAD",posY:0,sizeX:33,posZ:0,integrity:1.0f,showair:0b,name:"moesh:calamity5",sizeY:48,sizeZ:16,showboundingbox:1b}
setblock 130 1 180 minecraft:structure_block[mode=load]{metadata:"",mirror:"LEFT_RIGHT",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"CLOCKWISE_180",posX:-1,mode:"LOAD",posY:47,sizeX:33,posZ:0,integrity:1.0f,showair:0b,name:"moesh:calamity6",sizeY:22,sizeZ:16,showboundingbox:1b}
# Load crosslane
setblock 131 3 180 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:-1,mode:"LOAD",posY:-3,sizeX:13,posZ:1,integrity:1.0f,showair:0b,name:"moesh:calamity7",sizeY:48,sizeZ:15,showboundingbox:1b}
setblock 131 4 180 minecraft:structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:-1,mode:"LOAD",posY:44,sizeX:13,posZ:1,integrity:1.0f,showair:0b,name:"moesh:calamity8",sizeY:22,sizeZ:15,showboundingbox:1b}
# Starting area
setblock 96 0 109 minecraft:structure_block[mode=load]{metadata:"",mirror:"LEFT_RIGHT",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"CLOCKWISE_180",posX:0,mode:"LOAD",posY:0,sizeX:22,posZ:1,integrity:1.0f,showair:0b,name:"moesh:calamity9",sizeY:48,sizeZ:22,showboundingbox:1b}
setblock 96 1 109 minecraft:structure_block[mode=load]{metadata:"",mirror:"LEFT_RIGHT",ignoreEntities:1b,powered:0b,seed:0L,author:"?",rotation:"CLOCKWISE_180",posX:0,mode:"LOAD",posY:47,sizeX:22,posZ:1,integrity:1.0f,showair:0b,name:"moesh:calamity10",sizeY:22,sizeZ:22,showboundingbox:1b}

# Mirrored crosslane structure
# This structure is special because does not the final data we will send the player. It is only
#   meant to mirror the crosslane so that it is done correctly, and quickly.
setblock 137 0 180 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:0,mode:"SAVE",posY:0,sizeX:6,posZ:1,integrity:1.0f,showair:0b,name:"moesh:mirror_iron_mine1",sizeY:48,sizeZ:15,showboundingbox:1b}
setblock 137 1 180 minecraft:structure_block[mode=save]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"NONE",posX:0,mode:"SAVE",posY:47,sizeX:6,posZ:1,integrity:1.0f,showair:0b,name:"moesh:mirror_iron_mine2",sizeY:22,sizeZ:15,showboundingbox:1b}
setblock 135 0 180 minecraft:structure_block[mode=load]{metadata:"",mirror:"LEFT_RIGHT",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"CLOCKWISE_180",posX:0,mode:"LOAD",posY:0,sizeX:6,posZ:1,integrity:1.0f,showair:0b,name:"moesh:mirror_iron_mine1",sizeY:48,sizeZ:15,showboundingbox:1b}
setblock 135 1 180 minecraft:structure_block[mode=load]{metadata:"",mirror:"LEFT_RIGHT",ignoreEntities:1b,powered:0b,seed:0L,author:"Moesh",rotation:"CLOCKWISE_180",posX:0,mode:"LOAD",posY:47,sizeX:6,posZ:1,integrity:1.0f,showair:0b,name:"moesh:mirror_iron_mine2",sizeY:22,sizeZ:15,showboundingbox:1b}