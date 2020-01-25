Scriptname bacBlacksmithQuest extends Quest  

Quest Property qBlacksmith Auto
ReferenceAlias Property Alias_NPC1 Auto
ReferenceAlias Property Alias_NPC2 Auto
ReferenceAlias Property Alias_NPC3 Auto
ReferenceAlias Property Alias_NPC4 Auto
ReferenceAlias Property Alias_NPC5 Auto
ReferenceAlias Property Alias_NPC6 Auto
ReferenceAlias Property Alias_NPC7 Auto
ReferenceAlias Property Alias_NPC8 Auto
ReferenceAlias Property Alias_NPC9 Auto

bac_config Property BACConfig Auto
bac_update Property BACUpdate Auto
bac_actor Property BACActor Auto

Faction Property bac_feet Auto
Faction Property bac_hands Auto
Faction Property bac_nose Auto
Faction Property bac_bell Auto
Faction Property bac_mark Auto


 bac_blacksmith_storage property storage Auto	
	

function applyChanges(bool bToAdd, armor oArmor, string sWhere, int iRank)
	
	int Slot =BACActor.isRegistered(Game.getPlayer())
	
	if Slot == -1
		return
	endif
	
	Armor toRemove = None


	if sWhere == "tat"
		if bToAdd == true
			;SlaveTats.simple_add_tattoo(BACActor.npcs_ref[Slot], "Being a cow", "paul")		
			BACActor.npcs_ref[Slot].RemoveFromFaction(bac_mark)
			BACActor.npcs_ref[Slot].AddToFaction(bac_mark)
		BACActor.npcs_ref[Slot].SetFactionRank(bac_mark, iRank)	
		else
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[Slot], "Being a cow", "paul")
			BACActor.npcs_ref[Slot].RemoveFromFaction(bac_mark)	
		endif
	endif
	if sWhere == "tat2"
		if bToAdd == true
			;SlaveTats.simple_add_tattoo(BACActor.npcs_ref[Slot], "Being a cow", "hunters")		
			BACActor.npcs_ref[Slot].RemoveFromFaction(bac_mark)
			BACActor.npcs_ref[Slot].AddToFaction(bac_mark)
		BACActor.npcs_ref[Slot].SetFactionRank(bac_mark, iRank)	
		else
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[Slot], "Being a cow", "hunters")
			BACActor.npcs_ref[Slot].RemoveFromFaction(bac_mark)	
		endif
	endif
	if sWhere == "tat3"
		if bToAdd == true
			;SlaveTats.simple_add_tattoo(BACActor.npcs_ref[Slot], "Being a cow", "hunters-head")		
			BACActor.npcs_ref[Slot].RemoveFromFaction(bac_mark)
			BACActor.npcs_ref[Slot].AddToFaction(bac_mark)
		BACActor.npcs_ref[Slot].SetFactionRank(bac_mark, iRank)	
		else
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[Slot], "Being a cow", "hunters-head")
			BACActor.npcs_ref[Slot].RemoveFromFaction(bac_mark)	
		endif
	endif	
	
	
	if sWhere == "bell"
		toRemove = BACConfig.playerBell
		BACConfig.playerBell = oArmor
		BACActor.npcs_ref[Slot].RemoveFromFaction(bac_bell)
		BACActor.npcs_ref[Slot].AddToFaction(bac_bell)
		BACActor.npcs_ref[Slot].SetFactionRank(bac_bell, iRank)	
		
		if bToAdd == false
			
			BACConfig.playerBell = None
			BACActor.npcs_ref[Slot].RemoveFromFaction(bac_bell)		
		
		endif		
		
	endif	
	
	if sWhere == "nose"
		toRemove = BACConfig.playerNose
		BACConfig.playerNose = oArmor
		BACActor.npcs_ref[Slot].RemoveFromFaction(bac_nose)
		BACActor.npcs_ref[Slot].AddToFaction(bac_nose)
		BACActor.npcs_ref[Slot].SetFactionRank(bac_nose, iRank)	
		
		if bToAdd == false
			
			BACConfig.playerNose = None
			BACActor.npcs_ref[Slot].RemoveFromFaction(bac_nose)		
		
		endif		
		
	endif
	
	if sWhere == "feet"
		
		toRemove = BACConfig.playerFeet
		
		BACConfig.playerFeet = oArmor
		BACActor.npcs_ref[Slot].RemoveFromFaction(bac_feet)
		BACActor.npcs_ref[Slot].AddToFaction(bac_feet)
		BACActor.npcs_ref[Slot].SetFactionRank(bac_feet, iRank)	

		if bToAdd == false
			
			BACConfig.playerFeet = None
			BACActor.npcs_ref[Slot].RemoveFromFaction(bac_feet)		
		
		endif		
	endif
	
	if sWhere == "hands"
		
		toRemove = BACConfig.playerHands
		
		BACConfig.playerHands = oArmor
		BACActor.npcs_ref[Slot].RemoveFromFaction(bac_hands)
		BACActor.npcs_ref[Slot].AddToFaction(bac_hands)
		BACActor.npcs_ref[Slot].SetFactionRank(bac_hands, iRank)	

		if bToAdd == false
			
			BACConfig.playerHands = None
			BACActor.npcs_ref[Slot].RemoveFromFaction(bac_hands)		
		
		endif		
	endif

	;commit changes
	BACUpdate.updateAlways()
	
	;update actor stuff
	BACActor.reequipItems(Slot,true)
	
	if toRemove != None
		Game.GetPlayer().UnequipItem(toRemove,false,true)
		Game.GetPlayer().RemoveItem(toRemove,1,true)
		Game.GetPlayer().RemoveItem(toRemove,1,true)
	endif

	endFunction

function callActors()
	Actor[] actors
	actors = getActors(Game.getPlayer())

	int i = actors.length
	
	ReferenceAlias  refP = qBlacksmith.getAliasByName("bacPlayer") as ReferenceAlias
	ReferenceAlias  refB = qBlacksmith.getAliasByName("bacBlacksmith") as ReferenceAlias
	
	int j = 1
	
	while i > 0
		i -= 1
		if actors[i]!=None
			
			if refP.GetRef() as Actor != actors[i] && refB.GetRef() as Actor != actors[i] && actors[i].isDead() == false
			
			;	debug.notification("Called actor : " + actors[i].GetLeveledActorBase().GetName())
				
				;ReferenceAlias r = qBlacksmith.getAliasByName("npc"+j)   as ReferenceAlias ;.ForceRefTo(actors[i])
				;r.ForceRefTo(actors[i] as ObjectReference)
				;debug.trace( qBlacksmith.getAliasByName("npc"+j))
				;debug.trace( qBlacksmith.getAliasByName("npc"+j)   as ReferenceAlias)
				if j == 1
				debug.trace(j)
					debug.trace(Alias_NPC1)
					Alias_NPC1.ForceRefTo(actors[i])
					debug.trace(Alias_NPC1)
				endif

				if j == 2				
					Alias_NPC2.ForceRefTo(actors[i])					
				endif
				if j == 3				
					Alias_NPC3.ForceRefTo(actors[i])					
				endif
				if j == 4				
					Alias_NPC4.ForceRefTo(actors[i])					
				endif
				if j == 5		
					Alias_NPC5.ForceRefTo(actors[i])					
				endif
				if j == 6		
					Alias_NPC6.ForceRefTo(actors[i])					
				endif
				if j == 7		
					Alias_NPC7.ForceRefTo(actors[i])					
				endif
				if j == 8		
					Alias_NPC8.ForceRefTo(actors[i])					
				endif
				if j == 9		
					Alias_NPC9.ForceRefTo(actors[i])					
				endif				
				j = j + 1
				;Alias_bacFurniture.ForceRefTo(storage.chair)
			endif
			
			
	;		if BACActor.isRegistered(actors[i]) == -1
	;			int slot = BACActor.registerActor(actors[i])	
	;			if slot>-1
	;				BACUtilities.log("BAC::Scanner","Register actor "+actors[i].GetLeveledActorBase().GetName())
	;			endif			
	;		endIf
		endIf		
	endWhile
	
endFunction





Actor[] function getActors(Actor acAktor)

	Actor[] actors
	actors = new Actor[64]

	Actor acActor = acAktor

	float rad = 5000.0
	float posx = acActor.GetPositionX()
	float posy = acActor.GetPositionY()
	float posz = acActor.GetPositionZ()


	int i = 0
	int index = 0
	while i < 64
		
		actor npctoadd = Game.FindRandomActor(posx, posy, posz, rad)

		if actors.find(npctoadd)==-1
		
			if 	npctoadd.getRace() == storage.redguardRace || npctoadd.getRace() == storage.orcRace || npctoadd.getRace() == storage.nordRace || npctoadd.getRace() == storage.khajiitRace || npctoadd.getRace() == storage.imperialRace || npctoadd.getRace() == storage.darkElfRace || npctoadd.getRace() == storage.bretonRace || npctoadd.getRace() == storage.woodElfRace || npctoadd.getRace() == storage.highElfRace || npctoadd.getRace() == storage.argonianRace		
					actors[index] = npctoadd
					index+=1
			
			endif
			
		endif
		
		i+=1
	endWhile

	return actors
endFunction


