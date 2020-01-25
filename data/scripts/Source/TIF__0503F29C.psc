;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0503F29C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
bac_counter.setValue(bac_counter.getValue()+1)
bac__quest_Evil_001_MobileMilkingService.SetObjectiveCompleted(50+(bac_counter.getValue() as int *10))
bac__quest_Evil_001_MobileMilkingService.SetObjectiveDisplayed(60+(bac_counter.getValue() as int *10))


actor[] sexActors = new actor[2]
sexActors[0] = SexLab.PlayerRef
sexActors[1] = akSpeakerRef as Actor

sslBaseAnimation[] anims
anims = new sslBaseAnimation[1]
anims[0] = SexLab.AnimSlots.GetbyRegistrar("zjBreastFeedingVar")
SexLab.StartSex(sexActors, anims)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property bac_counter Auto
Quest Property bac__quest_Evil_001_MobileMilkingService Auto
SexLabFramework property SexLab auto
