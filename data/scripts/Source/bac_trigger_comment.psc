Scriptname bac_trigger_comment extends ObjectReference  

Bool Property removeAfterEnter Auto
Topic Property topicToSay Auto

;ObjectReference Property thisObj Auto
bac_store Property BACStore Auto
Quest Property questTest Auto
Int Property minStage Auto
Int Property maxStage Auto

ObjectReference Property objToShow Auto
ObjectReference Property objToHide Auto

Event onTriggerEnter(objectReference triggerRef)
			
			if triggerRef!=Game.getPlayer()
			return
		endif
		
		
		if removeAfterEnter!=true
			removeAfterEnter = false
		endif
		
			
		if questTest!=None
		
		
		
		
			int stageInt = questTest.getStage()
			
					
			if stageInt>=minStage && stageInt<=maxStage
						else
								return
			endif
			
		endif
		
		Actor ghost = BACStore.ghost
ghost.StopCombat()
			Actor ac = triggerRef as Actor
		ghost.setAlpha(0.0)
		ghost.MoveTo(ac)
		ghost.StopCombat()


		ghost.Say(topicToSay)
ghost.StopCombat()



		if removeAfterEnter==true
						self.disable()
		endif
		
if objToShow!=None
	objToShow.enable()
endif
		
if objToHide!=None
	objToHide.disable()
endif		
		
			
	
		
endEvent