Scriptname bacAliasPlayerBlacksmith extends ReferenceAlias  


Quest Property qBlacksmith Auto
bac_blacksmith_storage Property qStorage Auto
ReferenceAlias Property aFurniture Auto

bac_quest_ctr Property qCtr Auto

Event OnSit(ObjectReference akFurniture)
;  Debug.Notification("SITTT")
;  Debug.Notification(akFurniture)
  
  if qBlacksmith.getStage()==30
;	Debug.Notification("Sit on correct stage")
	
	ReferenceAlias  ref = aFurniture ; qBlacksmith.getAliasByName("bacFurniture") as ReferenceAlias
;	debug.trace("SIT!")
;	debug.trace(akFurniture )
;	debug.trace( ref.GetRef() as ObjectReference )
;	debug.trace( ref.GetReference() as ObjectReference )
;	debug.trace( ref.GetRef() )
;	debug.trace( ref.GetReference() )
;	debug.trace( ref )
;	debug.trace("END SIT!")



	if akFurniture == ref.GetRef() as ObjectReference 
;		Debug.Notification("Sit is correct!")
		;qBlacksmith.setStage(qBlacksmith.getStage()+10)
		qCtr.setStageQ("blacksmith",40)
	endif
  endif
endEvent