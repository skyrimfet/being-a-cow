Scriptname bac_goCowgo extends ObjectReference  

Quest Property thisQuest Auto
Int Property triggerOnStage Auto
Int Property switchToStage auto

Event onTriggerEnter(objectReference triggerRef)

if triggerRef == Game.getPlayer()
  if thisQuest.getStage()==triggerOnStage
    thisQuest.setStage(switchToStage)
  endif

endif


endEvent