;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname TIF__050418F3 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Int slot = BACActor.isRegistered(Game.getPlayer())
Int opt = bac_random.getValue() as Int

if opt == 1
BACActor.npcs_curvyCow[slot] = true
endif

if opt == 2
BACActor.npcs_fatCow[slot] = true

if BACConfig.slaveTatsPack == true && BACConfig.allowTats == true
BACActor.npcs_celluliteCow[slot] =true
endif

endif

if opt == 3
BACActor.npcs_fatCow2[slot] = true
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Int slot = BACActor.isRegistered(Game.getPlayer())
BACActor.reequipItems(slot,false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property bac_random Auto
bac_actor Property BACActor Auto
bac_config Property BACConfig Auto
