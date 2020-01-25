;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_bac__quest_Evil_001_Mobil_0503F28D Extends Quest Hidden

;BEGIN ALIAS PROPERTY WaitLoc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WaitLoc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OwnerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OwnerRef Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
bac__quest_Evil_001_MobileMilkingServiceScene.Stop()
;thisQuest.setStage(300)

bacc.setWaitingTime()
;return
thisQuest.SetObjectiveDisplayed(60)
bac_counter.setValue(0)

;STANDARD WAIT F.
Bool bBreak = False 
int x = 0
while (x < 3*24) && !bBreak    
debug.trace("BAC - mobilemilking tick 60 , 1" )
debug.trace(bBreak)
debug.trace(thisQuest.getStage())
debug.trace(x)
  if thisQuest.getStage()>60 || thisQuest.getStage()==0
   bBreak = True  
  endif
 ; Utility.wait(0.5)
  Utility.WaitGameTime(1)
  x += 1
endWhile

;STANDARD RETURN WAIT

;STANDARD WAIT F.
if thisQuest.getStage()==60
 bacc.showBackInfo()
  bBreak = False 
  x = 0
  while (x < 24) && !bBreak    
debug.trace("BAC - mobilemilking tick 60 , 2")

   if thisQuest.getStage()>60 || thisQuest.getStage()==0
     bBreak = True  
    endif
     if bBreak == false
     ;do something
     bacc.punishCow(-1)
     endif
;  Utility.wait(0.5)
    Utility.WaitGameTime(1)
    x += 1
  endWhile
endif
if thisQuest.getStage()==60
thisQuest.setStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
thisQuest.SetObjectiveDisplayed(50)
bac__quest_Evil_001_MobileMilkingServiceScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
bacc.reduceDebt( bac_counter.getValue() as int * 200 )
bacc.failQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
bacc.reduceDebt( bac_counter.getValue() as int * 200 )
bacc.successQuest()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property thisQuest Auto
Scene Property bac__quest_Evil_001_MobileMilkingServiceScene Auto
GlobalVariable Property bac_counter Auto
bac_beingacow Property bacc Auto
