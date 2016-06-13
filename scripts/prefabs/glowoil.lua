local assets =
{
    Asset("ANIM", "anim/boomerang.zip"),

    Asset( "IMAGE", "images/inventoryimages/junkerang.tex" ),
	Asset( "ATLAS", "images/inventoryimages/junkerang.xml" ),
}


local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("boomerang")
    inst.AnimState:SetBuild("boomerang")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("glowoil")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM

    inst:AddComponent("tradable")

    inst:AddComponent("inspectable")

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.MED_LARGE_FUEL
    inst.components.fuel.fueltype = FUELTYPE.CAVE

    MakeSmallBurnable(inst, TUNING.TINY_BURNTIME)
    MakeSmallPropagator(inst)
    MakeHauntableLaunchAndIgnite(inst)

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "junkerang"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/junkerang.xml"

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = TUNING.HEALING_MED * -1
    inst.components.edible.hungervalue = 10
    inst.components.edible.sanityvalue = TUNING.SANITY_MEDLARGE * -1
    inst.components.edible.foodtype = FOODTYPE.VEGGIE

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_PRESERVED)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

    return inst
end

return Prefab("common/inventory/glowoil", fn, assets)