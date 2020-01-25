Scriptname bac_alias_util_sitOnFurn extends ReferenceAlias  


ReferenceAlias Property furn Auto
Quest Property thisQuest Auto
Int Property jumpToStage Auto

Int Property condFromStage Auto
Int Property condToStage Auto

Event OnSit(ObjectReference akFurniture)

	if thisQuest.getStage() <= condFromStage && condFromStage != -1
		return
	endif

	if thisQuest.getStage() >= condToStage && condToStage != -1
		return
	endif
	

	ObjectReference ref =furn.GetReference() as ObjectReference


      if ref==akFurniture
		thisQuest.setStage(jumpToStage)
	else

	endif

endEvent