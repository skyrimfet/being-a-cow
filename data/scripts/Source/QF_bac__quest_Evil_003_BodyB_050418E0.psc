;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_bac__quest_Evil_003_BodyB_050418E0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY OwnerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OwnerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaitLoc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WaitLoc Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(50)
bac_random.setValue(0)

Int Slot = BACActor.isRegistered(Game.getPlayer())
if Slot >=-0 &&  BACConfig.allowToChangeBodyWeight == true 

  if BACActor.npcs_curvyCow[slot]==false &&  BACConfig.slifPack==true
     bac_random.setValue(1)
  endif

   if BACActor.npcs_fatCow2[slot] == false
     bac_random.setValue(3)
   endif  

  if BACActor.npcs_fatCow[slot] == false
    bac_random.setValue(2)
  endif
endif

Utility.wait(0.5)

;debug.messagebox("random" + bac_random.getValue())


bac__quest_Evil_003_BodyBuildScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
bacc.failQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_4 in script QF_bac__quest_Evil_003_BodyB_050418E0
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
bacc.successQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
bac__quest_Evil_003_BodyBuildScene.stop()
bacc.setWaitingTime()
thisQuest.SetObjectiveDisplayed(50,false)
int slot = BACActor.isRegistered(Game.getPlayer())
bac_random.setValue(0)
thisQuest.SetObjectiveDisplayed(0)
;STANDARD WAIT F.
Bool bBreak = False 
int x = 0

int initWeight = BACActor.npcs_weightMod[slot] as int
float lastKnowWeight = BACActor.npcs_weightMod[slot]


while (x <12*7*24) && !bBreak    
	if thisQuest.getStage()>60
		bBreak = True  
	endif
	Utility.WaitGameTime(1/12 as float)
	if bBreak == false
		if BACActor.npcs_weightMod[slot] < lastKnowWeight 
			debug.notification("your weight is falling, You have to eat more!")
		endif
		lastKnowWeight = BACActor.npcs_weightMod[slot]
	
	
		;debug.notification("Current fat index " + BACActor.getWeightFromActor(slot))
		;debug.notification("Weight "+BACActor.npcs_weightMod[slot])
		if BACActor.npcs_weightMod[slot] > 39 ||  BACActor.npcs_weightMod[slot] > initWeight + 15
			if bac_random.getValue() as int == 0
				thisQuest.SetObjectiveDisplayed(1)
				thisQuest.SetObjectiveDisplayed(0,false)
			endif
			bac_random.setValue(1)

		else

			if bac_random.getValue() as int == 1
				thisQuest.SetObjectiveDisplayed(0)
				thisQuest.SetObjectiveDisplayed(1,false)
			endif
			bac_random.setValue(0)
		endif
		x += 1
	endif
endWhile

if thisQuest.getStage()==60
	thisQuest.setStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property bac__quest_Evil_003_BodyBuildScene Auto
bac_beingacow Property bacc Auto
Quest Property thisQuest Auto
GlobalVariable Property bac_random Auto
bac_actor Property BACActor Auto
bac_config Property BACConfig Auto
