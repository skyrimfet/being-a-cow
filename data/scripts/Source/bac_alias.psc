Scriptname bac_alias  extends ReferenceAlias   

bac_utilities Property BACUtilities Auto
bac_update Property BACUpdate Auto
bac_main Property BACMain Auto
bac_quest_ctr Property BacQuestCtrl Auto
bac_unowned Property BacUnownedCtrl Auto
Quest Property bac_huntersgonnahunt2 Auto
QF_bac_capturedcow2_050266C0 Property captured2 Auto

bac_beingacow Property bacc Auto 

bac_tears_c Property bactearsc Auto

Quest Property bac_blacksmith Auto
Quest Property bac_capturedcow2 Auto

ObjectReference Property fixPaul Auto
ObjectReference Property fixPoint Auto
Location Property stableLocation Auto

Event OnPlayerLoadGame()

	BacQuestCtrl.startTick()
	BacQuestCtrl.fillAlias("blacksmith")
	
	BacUnownedCtrl .reloadQuest()
	captured2.regenerateAliases()

	bactearsc.reloadTearsAlias()
	if bac_huntersgonnahunt2.getStage()>0
		bactearsc.reloadAlias()
	endif

	bacc.restoreAlliases()

	BACUtilities.log("BAC::OnLoadGame","Start onload procedure")
	BACUpdate.update()
	BACMain.onLocationChange()
	BACUtilities.log("BAC::OnLoadGame","Stop onload procedure")
	

EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

	BACUtilities.log("BAC::OnLocationChange","Start LocationChange procedure")
	BACMain.onLocationChange()
	BACUtilities.log("BAC::OnLocationChange","Stop LocationChange procedure")
	fixStupidPaul(akNewLoc)
endEvent

function fixStupidPaul(Location akNewLoc)

if bac_blacksmith.getStage()<20 || bac_capturedcow2.IsRunning()==true
	return
endif



debug.trace("LocationChanged")
debug.trace(akNewLoc)
debug.trace(stableLocation)
debug.trace(fixPoint.GetParentCell())
debug.trace( Game.GetPlayer().GetParentCell())
debug.trace(fixPaul.GetParentCell())
;IF IF IF !
debug.notification("cellChanged")
if (fixPoint.GetParentCell() == Game.GetPlayer().GetParentCell() || fixPoint.GetParentCell() != fixPaul.GetParentCell() )
debug.trace("TELEPORT!")
 fixPaul.moveTo(fixPoint)
 Quest testQuest = bacc.thisQuest
	if testQuest == None || testQuest.getStage()!=50
		bacc.setWaitingTime()
	endif
	
	
endIf






endFunction