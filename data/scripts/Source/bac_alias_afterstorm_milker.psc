Scriptname bac_alias_afterstorm_milker extends ReferenceAlias  

ObjectReference Property furn Auto
Quest Property thisQuest Auto

Event OnSit(ObjectReference akFurniture)
	if akFurniture==furn
	if thisQuest.getStage()==63
		thisQuest.setStage(64)
	endif
	endif
endEvent

Event OnGetUp(ObjectReference akFurniture)
	if akFurniture==furn
		Utility.wait(10.0)
Form p= Game.GetFormFromFile(0x04016364, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04016368, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04016369, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x040168CE, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x040168D0, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04016E34, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04017398, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x0401739A, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x0401739E, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04017901, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04017905, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04017907, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04017909, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x0401790B, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x0401790D, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x0401790F, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04017911, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04017913, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04017915, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04017917, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04017919, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x0401791B, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x0401791D, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x0401791F, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04017921, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04017923, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04017925, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04017927, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x040183ED, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x040183EF, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x040183F1, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x040183F3, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x040183F5, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x040183F7, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x040183F9, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x040183FB, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x040183FF, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)

p= Game.GetFormFromFile(0x04018401, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04018403, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04018405, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04018407, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04018409, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x0401840B, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x0401840F, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)

p= Game.GetFormFromFile(0x04018411, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04018413, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04018415, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)

p= Game.GetFormFromFile(0x04038F5A, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04038F5B, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x040394C2, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)

p= Game.GetFormFromFile(0x040581F5, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x040581F7, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x040581F9, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x040581FB, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x040581FD, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x040581FF, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)


p= Game.GetFormFromFile(0x04058201, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04058203, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04058204, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04058206, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x0405820A, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)

p= Game.GetFormFromFile(0x04059236, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04059237, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)
p= Game.GetFormFromFile(0x04059239, "MilkModNEW.esp") as Form
Game.GetPlayer().RemoveItem(p,50)




	endif
endEvent




;[ALCH:0x040168D0]
;[ALCH:0x04016E34]
;[ALCH:0x04017398]
;[ALCH:0x0401739A]
;[ALCH:0x0401739E]
;[ALCH:0x04017901]
;[ALCH:0x04017905]
;[ALCH:0x04017907]
;[ALCH:0x04017909]
;[ALCH:0x0401790B]
;[ALCH:0x0401790D]
;[ALCH:0x0401790F]
;[ALCH:0x04017911]
;[ALCH:0x04017913]
;[ALCH:0x04017915]
;[ALCH:0x04017917]
;[ALCH:0x04017919]
;[ALCH:0x0401791B]
;[ALCH:0x0401790D]
;[ALCH:0x0401791F]

;[ALCH:0x04017921]
;[ALCH:0x04017923]
;[ALCH:0x04017925]
;[ALCH:0x04017927]

;[ALCH:0x040183ED]
;[ALCH:0x040183EF]
;[ALCH:0x040183F1]
;[ALCH:0x040183F3]
;[ALCH:0x040183F5]
;[ALCH:0x040183F7]
;[ALCH:0x040183F9]
;[ALCH:0x040183FB]
;[ALCH:0x040183FD]
;[ALCH:0x040183FF]

;[ALCH:0x04018401]
;[ALCH:0x04018403]
;[ALCH:0x04018405]
;[ALCH:0x04018407]
;[ALCH:0x04018409]
;[ALCH:0x0401840B]
;[ALCH:0x0401840F]

;[ALCH:0x04018411]
;[ALCH:0x04018413]
;[ALCH:0x04018415]

;[ALCH:0x04038F5A]
;[ALCH:0x04038F5B]
;[ALCH:0x040394C2]

;[ALCH:0x040581F5]
;[ALCH:0x040581F7]
;[ALCH:0x040581F9]
;[ALCH:0x040581FB]
;[ALCH:0x040581FD]
;[ALCH:0x040581FF]

;[ALCH:0x04058201]
;[ALCH:0x04058203]
;[ALCH:0x04058204]
;[ALCH:0x04058206]
;[ALCH:0x0405820A]

;[ALCH:0x04059236]
;[ALCH:0x04059237]
;[ALCH:0x04059239]