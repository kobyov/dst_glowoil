PrefabFiles = {
	"glowoil",
}

local Ingredient = GLOBAL.Ingredient
local RecipeTabs = GLOBAL.RECIPETABS
local Tech = GLOBAL.TECH

AddRecipe("glowoil", {Ingredient("lightbulb", 4), Ingredient("rocks", 2), Ingredient("silk", 2), Ingredient("pigskin", 1)}, RecipeTabs.REFINE, Tech.SCIENCE_TWO, nil, nil, nil, 2, nil, "images/inventoryimages/glowoil.xml", "glowoil.tex")

GLOBAL.STRINGS.NAMES.GLOWOIL = "Glow Oil"
GLOBAL.STRINGS.RECIPE_DESC.GLOWOIL = "Longer lasting lamp fuel"
