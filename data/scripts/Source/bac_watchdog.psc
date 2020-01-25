Scriptname bac_watchdog extends activemagiceffect  

bac_actor Property BACActor Auto
bac_config Property BACConfig Auto
bac_player Property BACPlayer Auto
bac_main Property BACMain Auto
bac_store Property BACStore Auto
bac_utilities Property BACUtilities Auto

Faction Property aroused Auto
bac_blacksmith_storage Property blackStorage Auto

bool isFrostfall

import StorageUtil
import FrostUtil
Int Slot
Actor acActor
Bool enabled

Faction property bac_milkmaid Auto 
Bool speakMode

Topic lastTopic
Actor lastActor

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	lastActor = None
	lastTopic = None
	
	isFrostfall == false
	
	if (Game.GetModbyName("Frostfall.esp") != 255)
		isFrostfall = true
		
	endIf	
	
	speakMode = false;

	Slot = BACActor.isRegistered(akTarget)
	
	if Slot == -1
		enabled = false
		self.dispel()
		
		return
	endIf
	enabled = true
	
	acActor = akTarget
	RegisterForAnimationEvent(acActor, "weaponSwing") 
	RegisterForAnimationEvent(acActor, "WeaponLeftSwing") 
	RegisterForAnimationEvent(acActor, "BowRelease") 
	RegisterForAnimationEvent(acActor, "BeginCastRight") 
	RegisterForAnimationEvent(acActor, "BeginCastLeft") 
	
	
	RegisterForAnimationEvent(acActor, "JumpUp") 
	RegisterForAnimationEvent(acActor, "JumpDown")
	
	RegisterForAnimationEvent(acActor, "FootLeft") 
	RegisterForAnimationEvent(acActor, "FootRight")
    
	RegisterForAnimationEvent(acActor, "tailSneakLocomotion")
	RegisterForAnimationEvent(acActor, "SoundPlay.FSTSwimSwim")	
	
	RegisterForAnimationEvent(acActor, "StartAnimatedCameraDelta")	
	RegisterForAnimationEvent(acActor, "EndAnimatedCameraDelta")	
	
	RegisterForMenu("Dialogue Menu")
	RegisterForMenu("Sleep/Wait Menu")
	RegisterForMenu("Loading Menu")
	
	RegisterForSingleUpdate(BACConfig.updateInterval)	
	acActor = akTarget
	
	if BACConfig.soulGemPack == true
		RegisterForModEvent("SGO.OnMilked","SoulMilk")
	Endif
	
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	enabled = false
EndEvent

Event OnUpdate()

	if isFrostfall == true
		
		if BACActor.npcs_ref[Slot]==Game.getPlayer()
			bool doSound = false
			if BACActor.npcs_phase[Slot] >= 3 && BACActor.npcs_phase[Slot] < 5 && FrostUtil.GetPlayerExposure() >= 100
				FrostUtil.ModPlayerExposure(-10.0, 80.0)
				doSound=true
			endif
			if BACActor.npcs_phase[Slot] >= 5 && BACActor.npcs_phase[Slot] < 10 && FrostUtil.GetPlayerExposure() >= 80
				FrostUtil.ModPlayerExposure(-10.0, 60.0)
				doSound=true

			endif
			if BACActor.npcs_phase[Slot] >= 10 && BACActor.npcs_phase[Slot] < 15 && FrostUtil.GetPlayerExposure() >= 60
				FrostUtil.ModPlayerExposure(-10.0, 40.0)
				doSound = true

			endif
			if BACActor.npcs_phase[Slot] >= 15 &&  FrostUtil.GetPlayerExposure() >= 40
				FrostUtil.ModPlayerExposure(-10.0, 40.0)
				doSound = true				
			endif
			
			if doSound == true
				facialBreathStart(Slot)
				BACPlayer.playBreath(Slot)
				Utility.Wait(0.5)				
				facialBreathStop(Slot)
			endif
			
		endif
		
	endif
	
	if BACActor.npcs_ref[Slot]==Game.getPlayer()
		emitRandomComment(BACActor.npcs_ref[Slot],0)
	endif


	if BACActor.npcs_hornyCow[Slot]==true
		int fvalue = BACActor.npcs_ref[Slot].GetFactionRank(aroused)
		if fvalue < 50
			fvalue = fvalue + 5
			BACActor.npcs_ref[Slot].SetFactionRank(aroused,fvalue)
		endif
	endIf

	int phase = BACActor.npcs_phase[Slot]
	
	
	if Utility.RandomInt(1,  5 + BACMain.setMaxPhase() as Int - phase) == 1
		facialBreathStart(Slot)
		BACPlayer.playBreath(Slot)
		Utility.Wait(0.5)
		facialBreathStop(Slot)
	endIf

	
	if BACConfig.painLevelEnabled == true
		float milkLevel = GetFloatValue(BACActor.npcs_ref[Slot],"MME.MilkMaid.MilkCount")
		
			
		float painPoint = BACConfig.painLevel
		if (painPoint == 5)
			painPoint = painPoint+0.01
		endIf
		;float facialprob = (milkLevel - 5) * 100 / (painPoint - 5)	; for pain point 20 -> milk level 20 = 100   ; 5 - 5 * 100   / 10 = 0    / 10 = 0
		;loat facialprob = (milkLevel - 5) * 100 / (painPoint - 5)	; for pain point 20 -> milk level 20 = 100   ; 10 - 5 * 100  / 10 = 500  / 10 = 50
		;float prob = (milkLevel - 5) * 100 / (painPoint - 5)	; for pain point 20 -> milk level 20 = 100		 ; 15 - 5 * 100  / 10 = 1000 / 10 = 100
		float prob = (milkLevel - 5) * 100 / (painPoint - 5)	; for pain point 20 -> milk level 20 = 100		 ; 30 - 5 * 100  / 10 = 2500 / 10 = 250
		
		if prob > 200
			prob = 200.0
		endif
		
		BACUtilities.log("Watchdog::Pain","Prob is "+prob+" becouse MilkLevel:"+milkLevel+" and painPoint"+painPoint)
		
		int moo = prob as int / 2 as int
		
		float probFacial = prob / 200
		
		BACUtilities.log("Watchdog::Pain","Recalc MooFactor is"+moo)
		
		
		if moo>=50
			BACUtilities.log("Watchdog::npcs_milkWearBonus","add before"+BACActor.npcs_milkWearBonus[Slot] )
			BACActor.npcs_milkWearBonus[Slot] = BACActor.npcs_milkWearBonus[Slot] + 0.005
			if Utility.RandomInt(0,  1)==1
				BACActor.npcs_milkWearBonus[Slot] = BACActor.npcs_milkWearBonus[Slot] + 0.005
			endif
			if moo >= 100
				BACActor.npcs_milkWearBonus[Slot] = BACActor.npcs_milkWearBonus[Slot] + 0.005
			endif
			BACUtilities.log("Watchdog::npcs_milkWearBonus","add after"+BACActor.npcs_milkWearBonus[Slot] )
		endif
		
		
		if Utility.RandomInt(0,  101 - moo) == 0 && milkLevel > 5
		
				facialMooStart(Slot,prob,probFacial)
				
				BACPlayer.playMoo(Slot)
				if Utility.RandomInt(0,  4) == 1
					BACActor.npcs_timesLast[Slot] = BACActor.npcs_timesLast[Slot] - 1 ;add some magic ;)
				endif
				Utility.Wait(1.0)
					
				facialMooStop(Slot)
			
		
		endif
		
		;
		;	20 = 100		
		;   x = ?
		;
		;   x 
		;
		;
		if milkLevel > 5	
			if BACConfig.addFacialExp == true		
				BACActor.npcs_ref[Slot].SetExpressionOverride(11, ( prob as int / 2 ) as int )
				if milkLevel>= BACConfig.painLevel	
					BACActor.npcs_ref[Slot].setexpressionphoneme(0, probFacial/4 )
				endif
				;BACActor.npcs_ref[Slot].SetExpressionModifier(14, probFacial )
				BACActor.npcs_ref[Slot].SetExpressionModifier(2, probFacial / 4)
				BACActor.npcs_ref[Slot].SetExpressionModifier(3, probFacial / 4)
			endif			
		endIf

	endif

	
	
	if speakMode == true
		int rank = BACActor.npcs_ref[Slot].getFactionRank(bac_milkmaid)
		int maxrank = BACMain.setMaxPhase()
		if rank >=5
	
			if Utility.randomInt(0, maxrank + 5 - rank) == 0
				Debug.notification("You lost control on your voice for a moment")
				facialMooStart(Slot,100,1)
				BACPlayer.playMoo(Slot)
				Utility.Wait(1.0)
					
				facialMooStop(Slot)
			else
				facialBreathStart(Slot)
				BACPlayer.playBreath(Slot)
				Utility.Wait(0.5)				
				facialBreathStop(Slot)
			Endif
		else
			if Utility.randomInt(0, maxrank - rank) == 0
				;Debug.notification("You lost control of your voice for a moment")
				facialBreathStart(Slot)
				BACPlayer.playBreath(Slot)	
				Utility.Wait(0.5)				
				facialBreathStop(Slot)
			Endif
		endif
	
	endif
	
	if enabled == true
		RegisterForSingleUpdate(BACConfig.updateInterval )
	endif
EndEvent


event OnMenuOpen(String asMenuName)
	

	
	if asMenuName == "Dialogue Menu"
		speakMode = true
		
		int rank = Game.getPlayer().getFactionRank(bac_milkmaid)
		int maxrank = BACMain.setMaxPhase()
		if rank >=5
			
			if Utility.randomInt(0, maxrank+5 - rank) == 0
				Debug.notification("You lost control on your voice for a moment")
				facialMooStart(Slot,100,1)
				BACPlayer.playMoo(Slot)
				Utility.Wait(0.5)				
				facialBreathStop(Slot)
			Endif
		endif
	endif
endevent



event OnMenuClose(String asMenuName)
	
	
	BACUtilities.log("Watchdog::OnMenuClose","Triggered by " +asMenuName)
	if asMenuName == "Dialogue Menu"
		speakMode = false
	endif
	
	
	;support for update weight and changes on body in not crittical moments
	
	if BACConfig.supportDynamicWeight==true && BACActor.npcs_ref[Slot] == Game.getPlayer()
		If asMenuName == "Sleep/Wait Menu" || asMenuName == "Loading Menu"
	
			;after close loading menu wait a while before update
			If asMenuName == "Loading Menu"
				Utility.wait(2.0)
			endif
		
			int i = 0
			while i < 	BACActor.getArrayCount()
    
				if BACActor.npcs_ref[i] != None
					;without (i,false) - we dont need quick update, just full update with weight calculation etc
					BACActor.reequipItems(i)
				endif
				i+=1
			endWhile	
		Endif
	EndIf
	
endevent


Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
 	int rank = Game.getPlayer().getFactionRank(bac_milkmaid)
	int maxrank = BACMain.setMaxPhase()
	if rank >=5
			
		if Utility.randomInt(0, maxrank+5 - rank) == 0
			;Debug.notification("You lost control of your voice for a moment")
			facialMooStart(Slot,100,1)
				BACPlayer.playMoo(Slot)
				Utility.Wait(0.5)				
				facialBreathStop(Slot)
		Endif
	endif
EndEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	
	
	if BACConfig.hardcoreMode == true && BACActor.npcs_ref[Slot].WornHasKeyword(BACStore.bac_hooves_hand)
		weapon testWeapon  = akBaseObject as weapon
		if testWeapon 
			BACActor.npcs_ref[Slot].UnequipItem(akBaseObject)
		endif
	endif
	
	armor test = akBaseObject as armor
	if test
		reequpItems()
		return
	endif
	
	potion pot = akBaseObject as potion
	
	if pot
		if BACConfig.allowToChangeBodyWeight==true && BACConfig.supportDynamicWeight==true
			BACActor.npcs_foodPoints[Slot] = BACActor.npcs_foodPoints[Slot] + 1
		endif
		if pot.haskeyword(BACConfig.mme_milk) 
			BACUtilities.log("Watchdog::OnObjectEquipped","Potion!")
			BACActor.npcs_milkWearBonus[Slot] =  BACActor.npcs_milkWearBonus[Slot] + 1.0001
			return
		endif
	endif
	
	
	
	
EndEvent

Event OnObjectUnEquipped(Form akBaseObject, ObjectReference akReference)
	armor test = akBaseObject as armor
	if test
		reequpItems()
	endif
EndEvent

function reequpItems()	
		BACActor.reequipItems(Slot,true)
endFunction



			



Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	
	if asEventName == "FootLeft" || asEventName == "FootRight" || asEventName == "JumpDown" || asEventName == "JumpUp"

		if BACConfig.allowToChangeBodyWeight == true
		BACActor.npcs_activityPoints[Slot] = BACActor.npcs_activityPoints[Slot] + 1
		endif
		
		;if asEventName != "JumpUp"
		;	if BACActor.npcs_ref[Slot].IsEquipped(BACStore.bac_hooves_hs) ||  BACActor.npcs_ref[Slot].IsEquipped(BACStore.bac_hooves_heavy)
		;		if asEventName == "FootLeft"		
		;			BACPlayer.playPonyL(Slot)
		;		else
		;			BACPlayer.playPonyR(Slot)
		;		endif
		;	endif
		;endif
		
		;if BACActor.npcs_ref[Slot].IsEquipped(BACStore.bac_cowbell) || BACActor.npcs_ref[Slot].IsEquipped(BACStore.bac_cowbellbig) || BACActor.npcs_ref[Slot].IsEquipped(BACStore.bac_cowbell_ring_44) || BACActor.npcs_ref[Slot].IsEquipped(BACStore.bac_cowbell_ring_45) || BACActor.npcs_ref[Slot].IsEquipped(BACStore.bac_cowbell_ring_big_44) || BACActor.npcs_ref[Slot].IsEquipped(BACStore.bac_cowbell_ring_big_45) || BACActor.npcs_ref[Slot].IsEquipped(BACStore.bac_cowbell_ring_big_47) || BACActor.npcs_ref[Slot].IsEquipped(BACStore.bac_cowbell_ring_47)
		;	if asEventName == "FootLeft"		
		;		if Utility.randomInt(0,2)!=0
		;			BACPlayer.playBell(Slot)
		;		endif
		;	else
		;		if Utility.randomInt(0,2)==0
		;			BACPlayer.playBell(Slot)
		;		endif
		;	endif
		;endif
		
		
		
		
		if BACActor.npcs_ref[Slot].IsEquipped(BACConfig.tails[0]) ||  BACActor.npcs_ref[Slot].IsEquipped(BACConfig.tails[1])
			if BACConfig.allowTailSound == true
				BACPlayer.playTail(Slot)
			endif
		endIf
	
	
	
	
		;if BACActor.npcs_ref[Slot].IsEquipped(BACConfig.hooves[1]) || BACActor.npcs_ref[Slot].IsEquipped(BACConfig.hooves[2])
		;	BACPlayer.playStep(Slot)
		;endIf
		
	endIf
EndEvent

function facialBreathStart(int sSlot)
	if BACConfig.addFacialExp == true
		BACActor.npcs_ref[sSlot].setexpressionphoneme(0, 0.2)
		BACActor.npcs_ref[sSlot].SetExpressionOverride(12)
	endif
endFunction

function facialBreathStop(int sSlot)
	if BACConfig.addFacialExp == true
		BACActor.npcs_ref[sSlot].resetexpressionoverrides()
	endif
endFunction

function facialMooStart(int sSlot, float prob = 200.0 , float probFacial = 1.0)
	if BACConfig.addFacialExp == true		
		BACActor.npcs_ref[sSlot].SetExpressionOverride(12)
		BACActor.npcs_ref[sSlot].setexpressionphoneme(1,  prob / 200 )					
		BACActor.npcs_ref[sSlot].SetExpressionModifier(0,  probFacial / 8 )
		BACActor.npcs_ref[sSlot].SetExpressionModifier(1,  probFacial / 8 )
		BACActor.npcs_ref[sSlot].SetExpressionModifier(11,  probFacial /1.5 )
	endif
endFunction

function facialMooStop(int sSlot)
	if BACConfig.addFacialExp == true	
		BACActor.npcs_ref[sSlot].setexpressionphoneme(1,  0 )
	
		BACActor.npcs_ref[sSlot].SetExpressionModifier(0, 0 )
		BACActor.npcs_ref[sSlot].SetExpressionModifier(1, 0)
		BACActor.npcs_ref[sSlot].SetExpressionModifier(11,  0 )
		BACActor.npcs_ref[sSlot].resetexpressionoverrides()
	endif
endFunction


function emitRandomComment(Actor target,int recur)

	if	BACConfig.commentEnable == false
		return
	endif

	debug.trace("recursive:"+recur)

	if recur>5 || BACConfig.commentProb==0 || speakMode == true
		return
	endif

	Topic TopicToSay = None
	Actor randomActor = Game.FindRandomActorFromRef(target, 512.0)
	
	if randomActor == lastActor
		emitRandomComment(target,1+recur)
		return
	endif
	
	if randomActor!=None && randomActor != BACStore.Paul && randomActor!=target && randomActor.GetRelationshipRank(target) < 3 && randomActor.isDead() == false && randomActor.isGhost() == false && randomActor.isInCombat()==false && randomActor.HasLOS(target) && randomActor.getFactionRank(bac_milkmaid) < 2
	
		 if randomActor.getRace() == blackStorage.redguardRace || randomActor.getRace() == blackStorage.orcRace || randomActor.getRace() == blackStorage.nordRace || randomActor.getRace() == blackStorage.khajiitRace || randomActor.getRace() == blackStorage.imperialRace || randomActor.getRace() == blackStorage.darkElfRace || randomActor.getRace() == blackStorage.bretonRace || randomActor.getRace() == blackStorage.woodElfRace || randomActor.getRace() == blackStorage.highElfRace || randomActor.getRace() == blackStorage.argonianRace		
	
		int max = 0
		
debug.trace(BACConfig.generalComments)
debug.trace(BACConfig.generalComments1)
debug.trace(BACConfig.generalComments2)
debug.trace("random comment pla"+BACActor.npcs_phase[Slot])
debug.trace("random comment act"+randomActor )


		max = BACConfig.generalComments.Length 
		TopicToSay = BACConfig.generalComments[Utility.randomInt(0, max - 1 ) ]
		
		if BACActor.npcs_phase[Slot] >= 9
			max = BACConfig.generalComments1.Length 
			TopicToSay = BACConfig.generalComments1[Utility.randomInt(0, max - 1 ) ]
		endif

		if BACActor.npcs_phase[Slot] >= 16
			max = BACConfig.generalComments2.Length 
			TopicToSay = BACConfig.generalComments2[Utility.randomInt(0, max - 1 ) ]
		endif
		
		
		;attr comments
		
		int count = 6
		count = count * 2
		
		if BACActor.npcs_fatCow[Slot] == true && Utility.randomInt(0,count) == 0
			max = BACConfig.generalCommentsFat.Length 
			TopicToSay = BACConfig.generalCommentsFat[Utility.randomInt(0, max - 1 ) ]
		endif

		if BACConfig.solveDirt == true && BACActor.npcs_dirtCow[Slot] == true && Utility.randomInt(0,count) == 0
			max = BACConfig.generalCommentsStink.Length 
			TopicToSay = BACConfig.generalCommentsStink[Utility.randomInt(0, max - 1 ) ]
		endif		

		if BACActor.npcs_celluliteCow[Slot] == true && Utility.randomInt(0,count) == 0
			ActorBase randomActorBase = randomActor.GetBaseObject() as ActorBase
			if randomActorBase.getSex() == 0
				max = BACConfig.generalCommentsCelMal.Length 
				TopicToSay = BACConfig.generalCommentsCelMal[Utility.randomInt(0, max - 1 ) ]
			else
				max = BACConfig.generalCommentsCelFem.Length 
				TopicToSay = BACConfig.generalCommentsCelFem[Utility.randomInt(0, max - 1 ) ]
			endif
		endif		

		if BACActor.npcs_faceCow3[Slot] == true && Utility.randomInt(0,count) == 0
			max = BACConfig.generalCommentsFace.Length 
			TopicToSay = BACConfig.generalCommentsFace[Utility.randomInt(0, max - 1 ) ]
		endif		

		if BACActor.npcs_hornyCow[Slot] == true && Utility.randomInt(0,count) == 0
			max = BACConfig.generalCommentsWet.Length 
			TopicToSay = BACConfig.generalCommentsWet[Utility.randomInt(0, max - 1 ) ]
		endif	
		
		if BACActor.npcs_pregCow[Slot] == true && Utility.randomInt(0,count) == 0
			max = BACConfig.generalCommentsPreg.Length 
			TopicToSay = BACConfig.generalCommentsPreg[Utility.randomInt(0, max - 1 ) ]
		endif			
		
		if BACActor.npcs_phase[Slot] > 7
			if randomActor.GetRelationshipRank(target) < 0
				max = BACConfig.generalCommentsEN.Length 
				TopicToSay = BACConfig.generalCommentsEN[Utility.randomInt(0, max - 1 ) ]
			endif
			
			if randomActor.GetRelationshipRank(target) > 0  && Utility.randomInt(0,1)==0
				max = BACConfig.generalCommentsFR.Length 
				TopicToSay = BACConfig.generalCommentsFR[Utility.randomInt(0, max - 1 ) ]
			endIf
		
		endif
	
		if TopicToSay == lastTopic
			emitRandomComment(target,1+recur)
			return
		endif
	
		if TopicToSay != None
			if Utility.randomInt(0,100) <= BACConfig.commentProb
				randomActor.Say(TopicToSay)
				lastTopic = TopicToSay
				lastActor = randomActor
			endif
			return
		endif
	
	else
		emitRandomComment(target,1+recur)
	endIf
	
	else
		emitRandomComment(target,1+recur)
	endif
endFunction