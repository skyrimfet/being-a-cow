Scriptname bac_capturedcow_chestAlias extends ReferenceAlias  

Quest Property thisQuest Auto

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
  if thisQuest.getStage() > 60
  if !akDestContainer
 ;   Debug.Notification("I dropped " + aiItemCount + "x " + akBaseItem + " into the world")
  elseif akDestContainer == Game.GetPlayer()
 ;   Debug.Notification("I gave the player " + aiItemCount + "x " + akBaseItem)
	thisQuest.setStage(80)
  else
;    Debug.Notification("I gave " + aiItemCount + "x " + akBaseItem + " to another container")
  endIf

endif
endEvent