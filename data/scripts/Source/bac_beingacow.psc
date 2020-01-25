Scriptname bac_beingacow extends Quest  

GlobalVariable Property TimeScale Auto

bac_player    Property BACPlayer Auto
bac_actor     Property BACActor Auto
bac_update    Property BACUpdate Auto
bac_quest_ctr Property bacc Auto
bac_config    Property BACConfig Auto
bac_blacksmith_storage property storage Auto	
bac_crowdQuest Property crowdCtr Auto

ImageSpaceModifier Property effect Auto

ObjectReference Property item1 Auto
ObjectReference Property item2 Auto
ObjectReference Property item3 Auto
ObjectReference Property item4 Auto
ObjectReference Property item5 Auto
ObjectReference Property item6 Auto
ObjectReference Property item7 Auto
ObjectReference Property item8 Auto
ObjectReference Property item9 Auto

Int Property Bounty Auto

Actor Property Owner Auto
Int Property Type Auto
Int Property Debt Auto
Quest Property runningQuest Auto

Quest Property lastQuest Auto

Quest Property thisQuest Auto

Quest Property bac__quest_helper_mech Auto

Quest[] Property BadQ Auto
Quest[] Property NeuQ Auto
Quest[] Property GoodQ Auto
Quest[] Property PunQ Auto

Int Property wait Auto
GlobalVariable Property bac_blacksmith_debt Auto
GlobalVariable Property bac_masterquestrunning Auto
Quest Property bac__quest_Neutral_Introduction Auto

Faction Property CrimeFactionWhiterun Auto
Faction Property CrimeFactionWinterhold Auto
Faction Property CrimeFactionFalkreath Auto
Faction Property CrimeFactionRift Auto
Faction Property CrimeFactionHaafingar Auto
Faction Property CrimeFactionEastmarch Auto
Faction Property CrimeFactionReach Auto

function prepareCrowd()
	crowdCtr.initAll()
	
endFunction

function removeActorFromCrowd(Actor akActor)
	crowdCtr.removeFromCrowd(akActor)
endFunction

function sendMech(int stage = 10)	
	debug.trace("sending mech!")
	if bac__quest_helper_mech.IsRunning()
		debug.trace("stop mech quest")
		bac__quest_helper_mech.stop()
		debug.trace("reset mech quest")
		bac__quest_helper_mech.reset()
		bac__quest_helper_mech.setStage(0)
	endif
	
	
	bac__quest_helper_mech.start()
	
	debug.trace("sending mech 1!")
	
		bac__quest_helper_mech.setStage(10)
	
	debug.trace("sending mech 2!")
	
	if stage!=10
		Utility.wait(0.1)
		bac__quest_helper_mech.setStage(stage)
	endif
endFunction

function addActorToCrowd(Actor akActor)
	crowdCtr.addToCrowd(akActor)
endFunction

function scanForActorsToCrowd(ObjectReference ob, int area = 1000, int limit = 1)
	int i = 0
	while i <= limit
		Actor randomActor = Game.FindRandomActorFromRef(ob, area as float)
		if randomActor!=None && randomActor!=Game.GetPlayer() && validActor(randomActor)==true
			addActorToCrowd(randomActor)
		endif
		i = i + 1
	endwhile
endFunction

function stopCrowd()
	crowdCtr.stopCrowd()
endFunction



function preInit()
	lastQuest = none
	Wait = 24*2

	BACUpdate.updateAlways()
	runningQuest = None
	Owner = bacc.ac_b_bacBlacksmith
	Debt = getDebt()

	Type = Utility.randomInt(-5,5)
	Type = getMood()

endFunction



int function getMood()

	int mod = Type
	if getDebt() > 0
		mod = mod - (getDebt()/5000) as Int
	endif
	
	mod = mod + bacc.getLoveRank()
	return mod

endFunction



function initAll()

endFunction



Quest function runQuest(Quest rQuest = None)

	if runningQuest !=None
		return None
	endif

	bacc.stopBlacksmithQ()

	debug.trace("GET NEW QUIEST")
	debug.trace(rQuest)

	if rQuest == None
		rQuest = getRandomQuest()
	endif

	runQuestP(rQuest)

EndFunction



function restoreAlliases()
	int st = bac__quest_helper_mech.getStage()
	if st == 0
		sendMech(100)
	else
		sendMech(st)
	endif
	
	debug.trace("BeingACow:reload alias")
	;TODO: check alias exists or not
	if runningQuest!=None
		ReferenceAlias ref = runningQuest.getAliasByName("OwnerRef") as ReferenceAlias
		ref.ForceRefTo(item1)
		
		ref = runningQuest.getAliasByName("WaitLoc") as ReferenceAlias
		ref.ForceRefTo(item2)
		
		ref = runningQuest.getAliasByName("PlayerRef") as ReferenceAlias
		ref.ForceRefTo(item3)
	
		ref = runningQuest.getAliasByName("Item4") as ReferenceAlias
		ref.ForceRefTo(item4)

		ref = runningQuest.getAliasByName("Item5") as ReferenceAlias
		ref.ForceRefTo(item5)
		
		ref = runningQuest.getAliasByName("Item6") as ReferenceAlias
		ref.ForceRefTo(item6)
		
		ref = runningQuest.getAliasByName("Item7") as ReferenceAlias
		ref.ForceRefTo(item7)
		
		ref = runningQuest.getAliasByName("Item8") as ReferenceAlias
		ref.ForceRefTo(item8)
		
		ref = runningQuest.getAliasByName("Item9") as ReferenceAlias
		ref.ForceRefTo(item9)
	endif
endFunction

function runQuestP(Quest rQuest)
	bac_masterquestrunning.setValue(1)
	debug.trace(rQuest)
	rQuest.Stop()
	rQuest.Reset()
	rQuest.Stop()
	rQuest.Reset()
	Utility.wait(0.5)
	rQuest.Start()
	Utility.wait(0.5)
	
	item1 = None
	item2 = None
	item3 = None
	item4 = None
	item5 = None
	item6 = None
	item7 = None
	item8 = None
	item9 = None
	
	ReferenceAlias ref = rQuest.getAliasByName("OwnerRef") as ReferenceAlias
	ref.ForceRefTo(Owner)
	item1 = Owner
	
	ref = rQuest.getAliasByName("WaitLoc") as ReferenceAlias
	ref.ForceRefTo(bacc.or_b_bacFurniture)
	item1 = bacc.or_b_bacFurniture
	
	ref = rQuest.getAliasByName("PlayerRef") as ReferenceAlias
	ref.ForceRefTo(Game.getPlayer())
	item3 = Game.getPlayer()
	
	rQuest.SetActive(true)
	;rQuest.Owner = Owner
	;rQuest.reloadAlias()
	;rQuest.fillVariables()
	rQuest.setStage(10)		;setup1
	Utility.wait(0.1)
	rQuest.setStage(20)		;setup2
	Utility.wait(0.1)
	
	ref = rQuest.getAliasByName("Item4") as ReferenceAlias
	item4 = ref.GetReference() as ObjectReference

	ref = rQuest.getAliasByName("Item5") as ReferenceAlias
	item5 = ref.GetReference() as ObjectReference
	
	ref = rQuest.getAliasByName("Item6") as ReferenceAlias
	item6 = ref.GetReference() as ObjectReference
	
	ref = rQuest.getAliasByName("Item7") as ReferenceAlias
	item7 = ref.GetReference() as ObjectReference
	
	ref = rQuest.getAliasByName("Item8") as ReferenceAlias
	item8 = ref.GetReference() as ObjectReference
	
	ref = rQuest.getAliasByName("Item9") as ReferenceAlias
	item9 = ref.GetReference() as ObjectReference
	
	
	
	
	
	rQuest.setStage(50)
	
	runningQuest = rQuest
endFunction



function setWaitingTime()

	bacc.setStageQ("blacksmith",100)
	
	;Utility.WaitGameTime(24*days)

endFunction



function closeQuest()
	runningQuest.stop()
	hideAllObiectives(runningQuest)
	runningQuest = None
	;Wait = 24*2
	;runQuestP(PunQ[ Utility.randomInt(0,PunQ.Length )])
endFunction



Quest function getRandomQuest()

	
	Int Kind = Utility.randomInt(-2,2) + getMood()
	
	Quest[] ToGet
	
	if Kind < -2 
		ToGet = BadQ		
	endif
	if Kind >= -2 && Kind <= 2
		ToGet = NeuQ
	endif
	if Kind > 2
		ToGet = GoodQ
	endif
	
	
	debug.trace("QUESTS:")
	debug.trace(BadQ)
	debug.trace(NeuQ)
	debug.trace(GoodQ)
	debug.trace("FIND QUEST - QUESTS PACK SELECTED:")
	debug.trace(ToGet)
	
	debug.trace("FIND QUEST - OWNER MOOD " + getMood() + " / debt "+getDebt()+" / love "+getLove()+" / CALC kind "+Kind)
	 
	
	
	Debug.Notification("Current Owner's mood: " +getMoodString(getMood()))
	
	int indexToRun = Utility.randomInt(0,ToGet.Length - 1)
	
	bool pass = false
	
	int slot = BACActor.isRegistered(Game.getPlayer())
	
	debug.trace("FIND QUEST - START: "+indexToRun)
	
	while !pass
		pass = true
		debug.trace("FIND QUEST - LOOKING...")
		;body build quest 
		if ToGet == BadQ && indexToRun == 2	
			debug.trace("FIND QUEST - BODY BUILD")
			if BACActor.npcs_weightMod[slot] <= 25 && BACConfig.supportDynamicWeight==true && BACActor.npcs_slimCow[slot] == false
				;is ok
				debug.trace("FIND QUEST - BODY BUILD IS OK")
			else
				indexToRun = Utility.randomInt(0,ToGet.Length - 1)
				pass = false
				debug.trace("FIND QUEST - BODY BUILD SKIP")
			endif
		endif
	
		if ToGet == GoodQ && indexToRun == 3
			if BACActor.npcs_punishItem[slot] > 0 && Type > 5
			else
				indexToRun = Utility.randomInt(0,ToGet.Length - 1)
				pass = false
			endif
		endif
	
		;prevent to run 2times same quest
		if pass == true && lastQuest == ToGet[indexToRun]
			indexToRun = Utility.randomInt(0,ToGet.Length - 1)
			pass = false
		endif
	
	endwhile
	
	debug.trace("FIND QUEST - RESULT: "+ToGet+" : "+ indexToRun)
	
	;return NeuQ[1]
	lastQuest = ToGet[indexToRun]
	return ToGet[indexToRun]
	
	;return BadQ
	
endFunction



;level -1	;only notification
;level 0
;level 1
;level 2
;level 3
function punishCow(Int level,int waitValue = -1)
    
	;debug.notification("PUNISH LEVEL "+ level)
	int Slot = BACActor.isRegistered(Game.getPlayer())

	if level == -1
		Debug.notification("I need to back to my Master")
		BACPlayer.playBell(Slot)
	endif

	if level == 0
		bacc.addMilk(Game.getPlayer(),Utility.randomInt(5,10) as float)
		Debug.notification("I noticed that my breast are heavier. My master call me!")
		BACPlayer.playMoo(Slot)
		Game.ShakeCamera(None,0.1,3)
	endif

	if level == 1
		Debug.notification("I'm crazy, my eyes, my breasts!. My master call me!")
		bacc.addMilk(Game.getPlayer(),Utility.randomInt(10,15) as float)
		effect.Apply(1.0)
		BACPlayer.playMoo(Slot)
		Game.ShakeCamera(None,0.3,50)
		
		Type = Type - Utility.randomInt(0,1)
		
		if Utility.randomInt(0,8)==0
			if bac__quest_helper_mech.IsRunning() == false
				sendMech(10)
				if runningQuest!= None && runningQuest.getStage() == 50
					failQuest()
					getRandomQuest()
				endif
			endif
		endif
	endif
	if level == 2
		Debug.notification("I'm crazy, my eyes, my breasts!. My master call me!")
		bacc.addMilk(Game.getPlayer(),Utility.randomInt(15,20) as float)
		effect.Apply(1.0)
		BACPlayer.playBell(Slot)
		Game.ShakeCamera(None,0.3,50)
		

		;debug.notification("Paul sent a warrant!")
		Type = Type - 1

		if waitValue == 1
			debug.messagebox("Your Owner has sent an arrest warrant.!")
			addToBounty(500)
		endif
		if Utility.randomInt(0,4)==0
			if bac__quest_helper_mech.IsRunning() == false
				sendMech(10)
				if runningQuest!= None && runningQuest.getStage() == 50
					failQuest()
					getRandomQuest()
				endif
			endif
		endif

	endif
	


endFunction


function loop()

	; quest works - just do nothing
	if runningQuest!=None &&  runningQuest.getStage() >= 60 && runningQuest.getStage() < 200
		effect.Remove()
		effect.Remove()
		effect.Remove()
		effect.Remove()
		effect.Remove()
		sendMech(100)
		if Bounty > 0 
			addToBounty(-1 * Bounty)
		
		endif
		return
	endif
	;intro quest - no stress
	if runningQuest == bac__quest_Neutral_Introduction
		return 
	endif

	;debug.notification("wait:" + wait)
  ;fail
	;if quest is running and is failed or is in waiting stage - do some stress!
	if runningQuest!=None && ( runningQuest.getStage()==300 ||  ( runningQuest.getStage()>=50 &&  runningQuest.getStage() < 60 ) )
		if wait < 48 && wait > 32
			punishCow(0 , wait)
		endif

		if wait <= 32 && wait > 8
			punishCow(1, wait)
		endif
		
		if wait <= 8
			punishCow(2, wait)	
		endif
	endif
	
	if runningQuest!=None && runningQuest.getStage() >= 60 && runningQuest.getStage() <=200
		effect.Remove()
		effect.Remove()
		effect.Remove()
		effect.Remove()
		effect.Remove()
		sendMech(100)
		if Bounty > 0 
			addToBounty(-1 * Bounty)
			
		endif
	endif
	
	
	if runningQuest!=None 
		debug.trace("DEBUG QUEST " + runningQuest + " / " + wait + " / " + runningQuest.getStage())
	endif
	
	;if wait == 0 && runningQuest.getStage()==300
	;		debug.trace("DEBUG QUEST - STOP1")
	;		debug.messagebox("Clear old quest")
	;		;runningQuest.CompleteQuest()
	;		;runningQuest=None
	;	endif	

  

  
 ; if wait == 0 && runningQuest==None
;	;run quest
;  endif
  
  if wait > 0 
	wait = wait - 1
  endif
  if wait < 0 
	wait = 0
	endif

	
	if runningQuest==None && wait == 0
	debug.trace("DEBUG QUEST - reRun")
		runQuest()
		Wait = 24*2
	endif
	
endFunction

function breakQuest()
  
  debug.trace("BREAK QUEST "+runningQuest)
  thisQuest.SetObjectiveDisplayed(30)  
  thisQuest.SetObjectiveDisplayed(20,false)
  thisQuest.SetObjectiveDisplayed(10,false)
  utility.wait(0.1)
  thisQuest.SetObjectiveDisplayed(30,false)  
	  Type = Type - 3
	  If Type < -15
		Type = -15
	  endif
	 Wait = 24*2
	runningQuest.FailAllObjectives()
	hideAllObiectives(runningQuest)
	runningQuest.CompleteQuest()
	runningQuest.reset()
	 Wait = 24*2
	 ;hideAllObiectives(runningQuest)
	runningQuest=None
	 Wait = 24*2
	 
	 
	 cleanUpQuests()
	 ;runQuest(PunQ[1])
	 ;return
	 runPunishQuest()
	 
endFunction

function runPunishQuest()
	int punishQuestIndex = Utility.randomInt(0,PunQ.Length - 1 )
	if punishQuestIndex==2 || punishQuestIndex==3
		int slot = BACActor.isRegistered(Game.getPlayer())
		if BACActor.npcs_punishItem[slot]<3 && Type < -5
			runQuest(PunQ[punishQuestIndex])
			return	
		else
			runPunishQuest()
			return
		endif
	endif
	
	runQuest(PunQ[punishQuestIndex])
	
	
endFunction

function showBackInfo()
  thisQuest.SetObjectiveDisplayed(10)
  thisQuest.SetObjectiveDisplayed(20,false)
  thisQuest.SetObjectiveDisplayed(30,false)
  utility.wait(0.1)
  thisQuest.SetObjectiveDisplayed(10,false)  
endFunction

function successQuest(bool finishedPunish = false)

	
	
	int i = 0
	while i < 128
    	effect.Remove()		
    i += 1
	endwhile
		
  thisQuest.SetObjectiveDisplayed(20)
  thisQuest.SetObjectiveDisplayed(10,false)
  thisQuest.SetObjectiveDisplayed(30,false)
  utility.wait(0.1)
  thisQuest.SetObjectiveDisplayed(20,false)  
  Type = Type + 1
  If Type > 15
    Type = 15
  endif
  
  runningQuest.CompleteAllObjectives()
  hideAllObiectives(runningQuest)
  runningQuest.reset()
  runningQuest.stop()
  runningQuest.CompleteQuest()
  Wait = BACConfig.questPause*24*2 + Utility.RandomInt(0,12)
  ;Debug
  ;Wait = 1
  
  runningQuest = None
  bac_masterquestrunning.setValue(0)
  bacc.setStageQ("blacksmith",20)
  ;runQuest()
  cleanUpQuests()
  
  if finishedPunish == false
  debug.trace("finished punish"+finishedPunish)
	int slot = BACActor.isRegistered(Game.getPlayer())
	if BACActor.npcs_punishItem[slot] > 0 
		int prob = Type / 2
		if prob < 0
			prob = prob * -1
		endif
		if prob < 3
			prob = 3
		endif
		debug.trace("finished punish type "+prob)
		if Utility.randomInt(0,prob) == 0
		debug.trace("finished exec quest ")
			runQuest(GoodQ[3])
		endif
	endif
  endif
  
endFunction

function failQuest()
  thisQuest.SetObjectiveDisplayed(30)  
  thisQuest.SetObjectiveDisplayed(20,false)
  thisQuest.SetObjectiveDisplayed(10,false)
  utility.wait(0.1)
  thisQuest.SetObjectiveDisplayed(30,false)  
  Type = Type - 3
  If Type < -15
    Type = -15
  endif
  ;runningQuest.FailAllObjectives()
  hideAllObiectives(runningQuest)
  ;runningQuest.reset()
  runningQuest.stop()
  
  ;runningQuest = None
  Wait = 24*2
  ;runQuest()
endFunction


String Function getMoodString(int scale)

	if scale < -10
		return "Cruel"
	endif
	
	if scale >= -10 && scale < -2 
		return "Crude"
	endif

	if scale >= -2 && scale < 2 
		return "Variable"
	endif
	
	if scale >= 2 && scale < 8
		return "Mostly gently"
	endif
	
	if scale >= 8
		return "Gently"
	endif

EndFunction

function timeScale()
	TimeScale.setValueInt(120)
endFunction

function resetTimeScale()
	TimeScale.setValueInt(20)
endFunction


bool function validActor(Actor npctoadd)

	if 	npctoadd.getRace() == storage.redguardRace || npctoadd.getRace() == storage.orcRace || npctoadd.getRace() == storage.nordRace || npctoadd.getRace() == storage.khajiitRace || npctoadd.getRace() == storage.imperialRace || npctoadd.getRace() == storage.darkElfRace || npctoadd.getRace() == storage.bretonRace || npctoadd.getRace() == storage.woodElfRace || npctoadd.getRace() == storage.highElfRace || npctoadd.getRace() == storage.argonianRace
		if npctoadd.isDead()== false && npctoadd.isGhost()==false && npctoadd.isChild() == false && npctoadd.IsInCombat() == false && npctoadd.IsAlarmed() == false && npctoadd.IsHostileToActor(Game.getPlayer()) == false
			return true
		endif
	endif
return false
endFunction

function reduceDebt(int toRed)
	bac_blacksmith_debt.setValue(getDebt() - toRed)
	if getDebt()>0
		Debug.notification("Debt was reduced by: " + toRed + ", is still: "+getDebt() + " Septims")
	endif
endFunction

int function getDebt()
	return bac_blacksmith_debt.getValue() as Int
endFunction

function updateLove(int toLove)
	bacc.setLoveRank(toLove)
endFunction

int function getLove()
	return bacc.getLoveRank()
endFunction


function cleanUpQuests()
return 
;Quest[] Property BadQ Auto
;Quest[] Property NeuQ Auto
;Quest[] Property GoodQ Auto
;Quest[] Property PunQ Auto
;
debug.trace("clean up quests")
int i = 0
while i < BadQ.length
	
	if BadQ[i] != runningQuest || (runningQuest!=None && runningQuest.IsStopped() && runningQuest.getStage() == 0)
		debug.trace("cleaning: "+BadQ[i])
		BadQ[i].CompleteAllObjectives()
		BadQ[i].CompleteQuest()
		BadQ[i].reset()
		BadQ[i].stop()
		BadQ[i].setStage(500)
	endif
	
	i = i + 1
endwhile

endFunction

function addToBounty(int value)
;;return
		CrimeFactionWhiterun.SetCrimeGold(CrimeFactionWhiterun.GetCrimeGold()+value);
		CrimeFactionWinterhold.SetCrimeGold(CrimeFactionWinterhold.GetCrimeGold()+value);
		CrimeFactionFalkreath.SetCrimeGold(CrimeFactionFalkreath.GetCrimeGold()+value);
		CrimeFactionRift.SetCrimeGold(CrimeFactionRift.GetCrimeGold()+value);
		CrimeFactionHaafingar.SetCrimeGold(CrimeFactionHaafingar.GetCrimeGold()+value);
		CrimeFactionEastmarch.SetCrimeGold(CrimeFactionEastmarch.GetCrimeGold()+value);
		CrimeFactionReach.SetCrimeGold(CrimeFactionReach.GetCrimeGold()+value);
		Bounty = Bounty + value
endfunction

function hideAllObiectives(Quest q)
	debug.trace("DEAR USER - THIS SECTION WILL SPAM LOG FILES I KNOW IT - I NOT FOUND BETTER WAY TO CLEAN UP THIS SHIT")
	int i = 0
	while i < 110
		if q.IsObjectiveDisplayed(i)==true
			q.SetObjectiveDisplayed(i,false,true)
		endif
		i = i + 1
	endwhile
	debug.trace("DEAR USER - OK, THATS ALL - CLEANED ;D ")
endFunction