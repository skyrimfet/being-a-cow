;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_bac_beingacow_0503ED01 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;init
thisQuestCtrl.initAll()
thisQuestCtrl.runQuest(bac__quest_Neutral_Introduction)
thisQuest.setStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Bool bBreak = False

While !bBreak    
  thisQuestCtrl.loop()
  Utility.WaitGameTime(0.5)
;utility.wait(0.5)
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;init
thisQuestCtrl.preInit()
thisQuest.setStage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

bac_beingacow Property thisQuestCtrl Auto
Quest Property thisQuest Auto
Quest Property bac__quest_Neutral_Introduction Auto
