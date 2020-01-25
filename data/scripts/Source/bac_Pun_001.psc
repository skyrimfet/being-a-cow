Scriptname bac_Pun_001 extends ReferenceAlias  

Quest Property thisQuest Auto

SexLabFramework Property SexLabF Auto

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
  ;if akBaseObject as Weapon
   ; Debug.Trace("This actor just equipped a weapon!")
  ;endIf
  ;Debug.Trace("ALIAS:"+akReference)
;  Debug.Trace("ALIAS:"+akBaseObject)
if thisQuest.getStage()==60
	SexLabF.StripActor(Game.GetPlayer(),none,false)
endif

endEvent