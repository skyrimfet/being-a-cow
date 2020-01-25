Scriptname bac_update extends Quest  

bac_utilities Property BACUtilities Auto
bac_main Property BACMain Auto
bac_config Property BACConfig Auto
bac_actor Property BACActor Auto
bac_store Property BACStore Auto

bac_blacksmith_storage Property BACBlacksmithStorage Auto 

Quest Property bac_blacksmith Auto
Quest Property bac_unownedq Auto
Quest Property bac_tears1 Auto
Quest Property bac_afterstorm Auto
Quest Property bac_beingacowq Auto

Scene Property bac_blacksmith_mainscene Auto
bac_quest_ctr Property BACQuestCtrl Auto

GlobalVariable Property bac_cat_inplace Auto
GlobalVariable Property bac_blacksmith_debt Auto

zbfConfig Property zaz Auto

Potion Property bac_mutator Auto

Faction Property bac_mark Auto

Quest Property bac_capturedcow2 Auto
Quest Property bac_capturedcow Auto

bac_beingacow Property bac_beingacowProp Auto

function update()

	if BACConfig.modVersion < 1.0
		BACUtilities.log("BAC::Update","Update to 1.0",2,true)
		updateTo10()
	endIf
	
	if BACConfig.modVersion < 1.1
		BACUtilities.log("BAC::Update","Update to 1.1",2,true)
		updateTo11()
	endIf

	if BACConfig.modVersion < 1.3
		BACUtilities.log("BAC::Update","Update to 1.3",2,true)
		updateTo13()
	endIf	

	if BACConfig.modVersion < 1.7
		BACUtilities.log("BAC::Update","Update to 1.7",2,true)
		updateTo17()
	endIf	
	
	if BACConfig.modVersion < 1.8
		BACUtilities.log("BAC::Update","Update to 1.8",2,true)
		updateTo18()
	endIf	
	
	if BACConfig.modVersion < 1.9
		BACUtilities.log("BAC::Update","Update to 1.9",2,true)
		updateTo19()
	endIf	

	if BACConfig.modVersion < 2.0
		BACUtilities.log("BAC::Update","Update to 2.0",2,true)
		updateTo20()
	endIf

	if BACConfig.modVersion < 2.1
		BACUtilities.log("BAC::Update","Update to 2.1",2,true)
		updateTo21()
	endIf
	
	if BACConfig.modVersion < 2.2
		BACUtilities.log("BAC::Update","Update to 2.2",2,true)
		updateTo22()
	endIf
	if BACConfig.modVersion < 2.3
		BACUtilities.log("BAC::Update","Update to 2.3",2,true)
		updateTo23()
	endIf	
	
	if BACConfig.modVersion < 2.4
		BACUtilities.log("BAC::Update","Update to 2.4",2,true)
		updateTo24()
	endIf	

	if BACConfig.modVersion < 2.5
		BACUtilities.log("BAC::Update","Update to 2.5",2,true)
		updateTo25()
	endIf	
	
	if BACConfig.modVersion < 2.6
		BACUtilities.log("BAC::Update","Update to 2.6",2,true)
		updateTo26()
	endIf	
	
	if BACConfig.modVersion < 2.7
		BACUtilities.log("BAC::Update","Update to 2.7",2,true)
		updateTo27()
	endIf	

	if BACConfig.modVersion < 2.8
		BACUtilities.log("BAC::Update","Update to 2.8",2,true)
		updateTo28()
	endIf	

	if BACConfig.modVersion < 2.9
		BACUtilities.log("BAC::Update","Update to 2.9",2,true)
		updateTo29()
	endIf	

	if BACConfig.modVersion < 3.0
		BACUtilities.log("BAC::Update","Update to 3.0",2,true)
		updateTo30()
	endIf	
	
	if BACConfig.modVersion < 3.1
		BACUtilities.log("BAC::Update","Update to 3.1",2,true)
		updateTo31()
	endIf	
	
	if BACConfig.modVersion < 3.2
		BACUtilities.log("BAC::Update","Update to 3.2",2,true)
		updateTo32()
	endIf

	if BACConfig.modVersion < 3.3
		BACUtilities.log("BAC::Update","Update to 3.3",2,true)
		updateTo33()
	endIf	
	if BACConfig.modVersion < 3.4
		BACUtilities.log("BAC::Update","Update to 3.4",2,true)
		updateTo34()
	endIf			
	if BACConfig.modVersion < 3.5
		BACUtilities.log("BAC::Update","Update to 3.5",2,true)
		updateTo35()
	endIf		
	if BACConfig.modVersion < 3.6
		BACUtilities.log("BAC::Update","Update to 3.6",2,true)
		updateTo36()
	endIf			
	if BACConfig.modVersion < 3.7
		BACUtilities.log("BAC::Update","Update to 3.7",2,true)
		updateTo37()
	endIf		
	if BACConfig.modVersion < 3.8
		BACUtilities.log("BAC::Update","Update to 3.8",2,true)
		updateTo38()
	endIf		
	if BACConfig.modVersion < 4.0
		BACUtilities.log("BAC::Update","Update to 4.0",2,true)
		updateTo40()
	endIf	
	if BACConfig.modVersion < 4.1
		BACUtilities.log("BAC::Update","Update to 4.1",2,true)
		updateTo41()
	endIf		
	if BACConfig.modVersion < 4.2
		BACUtilities.log("BAC::Update","Update to 4.2",2,true)
		updateTo42()
	endIf	
	
	if BACConfig.modVersion < 4.3
		BACUtilities.log("BAC::Update","Update to 4.3",2,true)
		updateTo43()
	endIf	
	
	if BACConfig.modVersion < 4.4
		BACUtilities.log("BAC::Update","Update to 4.4",2,true)
		updateTo44()
	endIf		
	if BACConfig.modVersion < 4.5
		BACUtilities.log("BAC::Update","Update to 4.5",2,true)
		updateTo45()
	endIf		
	if BACConfig.modVersion < 4.6
		BACUtilities.log("BAC::Update","Update to 4.6",2,true)
		updateTo46()
	endIf		
	if BACConfig.modVersion < 4.7
		BACUtilities.log("BAC::Update","Update to 4.7",2,true)
		updateTo47()
	endIf	
	if BACConfig.modVersion < 4.8
		BACUtilities.log("BAC::Update","Update to 4.8",2,true)
		updateTo48()
	endIf		
	if BACConfig.modVersion < 4.9
		BACUtilities.log("BAC::Update","Update to 4.9",2,true)
		updateTo49()
	endIf	
	if BACConfig.modVersion < 5.0
		BACUtilities.log("BAC::Update","Update to 5.0",2,true)
		updateTo50()
	endIf
	if BACConfig.modVersion < 5.1
		BACUtilities.log("BAC::Update","Update to 5.1",2,true)
		updateTo51()
	endIf	
	
	if BACConfig.modVersion < 5.2
		BACUtilities.log("BAC::Update","Update to 5.2",2,true)
		updateTo52()
	endIf
	if BACConfig.modVersion < 5.3
		BACUtilities.log("BAC::Update","Update to 5.3",2,true)
		updateTo53()
	endIf	
	if BACConfig.modVersion < 5.5
		BACUtilities.log("BAC::Update","Update to 5.5",2,true)
		updateTo55()
	endIf
	if BACConfig.modVersion < 5.6
		BACUtilities.log("BAC::Update","Update to 5.6",2,true)
		updateTo56()
	endIf
	if BACConfig.modVersion < 5.7
		BACUtilities.log("BAC::Update","Update to 5.7",2,true)
		updateTo57()
	endIf			
	updateAlways()
	
	if BACConfig.modVersion	!= BACMain.getVersion()
		Debug.notification("Being a Cow is updated! ( From compVer.: "+BACConfig.modVersion+" to "+BACMain.getVersion()+ " )")
	endif
	BACConfig.modVersion	= BACMain.getVersion()

	
endFunction

function updateTo57()

BACActor.npcs_slowMetabolism = new bool[32]
BACActor.npcs_fastMetabolism = new bool[32]
BACConfig.enabled_npcs_slowMetabolism  = true
BACConfig.enabled_npcs_fastMetabolism  = true

int i = 0
	while i < BACActor.getArrayCount()
		BACActor.npcs_slowMetabolism[i] = false
		BACActor.npcs_fastMetabolism[i] = false		
		i+=1
	endwhile

endFunction
function updateTo56()
	BACActor.npcs_shortBody = new bool[32]
	BACActor.npcs_tallBody = new bool[32]
	BACActor.npcs_pregStratches = new bool[32]
	BACActor.npcs_assStratches = new bool[32]
	BACActor.npcs_breastStratches = new bool[32]
	BACConfig.enabled_npcs_shortBody  = true 
	BACConfig.enabled_npcs_tallBody  = true 
	BACConfig.enabled_npcs_pregStratches  = true 
	BACConfig.enabled_npcs_assStratches  = true 
	BACConfig.enabled_npcs_breastStratches  = true 
	
	int i = 0
	while i < BACActor.getArrayCount()
		BACActor.npcs_tallBody[i] = false
		BACActor.npcs_shortBody[i] = false
		BACActor.npcs_pregStratches[i] = false
		BACActor.npcs_assStratches[i] = false
		BACActor.npcs_breastStratches[i] = false
		i+=1
	endwhile
endFunction
function updateTo55()
	
	BACActor.npcs_celluliteCow2 = new bool[32]
	BACActor.npcs_cowAsBreasts2 = new bool[32]
	BACConfig.enabled_npcs_celluliteCow2  = true 
	BACConfig.enabled_npcs_cowAsBreasts2  = true 
	
	int i = 0
	while i < BACActor.getArrayCount()
		BACActor.npcs_celluliteCow2[i] = false
		BACActor.npcs_cowAsBreasts2[i] = false
		i+=1
	endwhile
endFunction

function updateTo53()	
	BACConfig.allowHornsAndEars = true
	BACConfig.allowTails = true
	BACConfig.allowHooves = true
	BACConfig.allowHandHooves = true
	BACConfig.allowPhaseTats = true
endfunction

function updateTo52()	
	BACActor.npcs_orgWeight = new float[32]
	int i = 0
	
	while i < BACActor.getArrayCount()
		BACActor.npcs_orgWeight[i] = 0
		i+=1
	endwhile
endFunction

function updateTo51()
	BACConfig.enabled_npcs_wetCow  = true
	BACConfig.enabled_npcs_hornyCow  = true 
	BACConfig.enabled_npcs_pregCow  = true 
	BACConfig.enabled_npcs_bigUdders  = true 
	BACConfig.enabled_npcs_dirtCow  = true
	BACConfig.enabled_npcs_celluliteCow  = true 
	BACConfig.enabled_npcs_veinsCow  = true 
	BACConfig.enabled_npcs_veinsCow2  = true 
	BACConfig.enabled_npcs_untamedMilk  = true
	BACConfig.enabled_npcs_cowAsBreasts  = true 
	BACConfig.enabled_npcs_openassfurCow  = true
	BACConfig.enabled_npcs_fatCow  = true 
	BACConfig.enabled_npcs_fatCow2  = true 
	BACConfig.enabled_npcs_slimCow  = true
	BACConfig.enabled_npcs_slimCow2  = true
	BACConfig.enabled_npcs_lymphedema  = true
	BACConfig.enabled_npcs_curvyCow  = true
	BACConfig.enabled_npcs_faceCow  = true 
	BACConfig.enabled_npcs_faceCow2  = true
	BACConfig.enabled_npcs_faceCow3  = true
	BACConfig.enabled_npcs_cowNose = true

endFunction

function updateTo50()

	bac_beingacowProp.Bounty = 0

	BACActor.npcs_punishItem = new int[32]
	
	int i = 0
	
	while i < BACActor.getArrayCount()
		BACActor.npcs_punishItem[i] = 0
		i+=1
	endwhile
endFunction

function updateTo49()
	BACConfig.questPause = 7
endFunction

function updateTo48()
BACConfig.commentEnable = true
endFunction

function updateTo47()
	
	BACActor.npcs_cowAsBreasts = new bool[32]
	int i = 0
	while i < BACActor.getArrayCount()
		BACActor.npcs_cowAsBreasts[i] = false
		i+=1
	endwhile

	if bac_capturedcow2.getStage() == 100 || bac_afterstorm.getStage()==90
		bac_beingacowq.start()
		bac_beingacowq.setStage(10)
		updateAlways()
	endif

endFunction

function updateTo46()
	if BACConfig.allowToChangeBodyWeight ==true
		BACConfig.supportDynamicWeight = true
	endif
	
	BACActor.npcs_needTuUpdate = new bool[32]
	BACActor.npcs_cowNose = new bool[32]
	BACActor.npcs_weightMod = new float[32]
	BACActor.npcs_activityPoints = new int[32]
	BACActor.npcs_foodPoints = new int[32]
	int i = 0
	while i < BACActor.getArrayCount()
		BACActor.npcs_weightMod[i] = 0
		BACActor.npcs_activityPoints[i] = 0
		BACActor.npcs_foodPoints[i] = 0
		BACActor.npcs_needTuUpdate[i] = false
		BACActor.npcs_cowNose[i] = false
		i+=1
	endwhile
endFunction


function updateTo45()
	BACConfig.solveDirt = true
endFunction


function updateTo44()
	BACActor.npcs_untamedMilk = new bool[32]
	int i = 0
	while i < BACActor.getArrayCount()
		BACActor.npcs_untamedMilk[i] = false
		i+=1
	endwhile
endFunction

function updateTo43()

BACActor.npcs_lymphedema = new bool[32]
	int i = 0
	while i < BACActor.getArrayCount()
		BACActor.npcs_lymphedema[i] = false
		i+=1
	endwhile
endFunction


function updateTo42()
	BACConfig.teammate = None

endFunction


function updateTo41()
	
	debug.notification("BAC will now remove old tats - Start")
	;remove all known textures
	int i = 0
	while i < BACActor.getArrayCount()
		;remove std tats
		;BACActor.removeTats(i,-1,BACActor.getColorName(0))
		;BACActor.removeTats(i,-1,BACActor.getColorName(1))
		;BACActor.removeTats(i,-1,BACActor.getColorName(2))
		;BACActor.removeTats(i,-1,BACActor.getColorName(3))
		;BACActor.removeTats(i,-1,BACActor.getColorName(4))
		;BACActor.removeTats(i,-1,BACActor.getColorName(5))		
		SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "brown connect")
		SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "brown connect h")	
		SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "BMutation1")
		SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "BMutation2")			
		SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "Cellulite")			
		SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "DirtHands")			
		SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "DirtFeet")			
		SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "DirtFace")			
		SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "DirtBody")			
		SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "hunters-head")			
		SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "hunters")			
		SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "paul")		
		int j = 0
		while j < 10
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "White phase "+j+" - body")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "White phase "+j+" - feet")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "White phase "+j+" - hands")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "White phase "+j+" - head")				
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "Spots phase "+j+" - body")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "Spots phase "+j+" - feet")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "Spots phase "+j+" - hands")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "Spots phase "+j+" - head")				
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "Brown phase "+j+" - body")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "Brown phase "+j+" - feet")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "Brown phase "+j+" - hands")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "Brown phase "+j+" - head")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "White open phase "+j+" - body")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "White open phase "+j+" - feet")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "White open phase "+j+" - hands")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "White open phase "+j+" - head")				
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "Spots open phase "+j+" - body")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "Spots open phase "+j+" - feet")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "Spots open phase "+j+" - hands")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "Spots open phase "+j+" - head")				
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "Brown open phase "+j+" - body")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "Brown open phase "+j+" - feet")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "Brown open phase "+j+" - hands")		
			SlaveTats.simple_remove_tattoo(BACActor.npcs_ref[i], "Being a cow", "Brown open phase "+j+" - head")					
			j = j + 1
		endwhile
		i+=1
	endwhile
	debug.notification("BAC will now remove old tats - Finish")
	;BACConfig.showConsoleOutput = true
	;BACConfig.showTraceOutput = true
	;BACActor.ActorOverlayGetSlot(Game.getPlayer(), "body")
	;BACActor.ActorOverlayGetSlot(Game.getPlayer(), "hand")
	;BACActor.ActorOverlayGetSlot(Game.getPlayer(), "feet")
	;BACActor.ActorOverlayGetSlot(Game.getPlayer(), "face")
	

	
	;repair tat faction
	
	;debug.messagebox("cow rank is: "+Game.getPlayer().getFactionRank(bac_mark))
	;debug.messagebox("capt1: "+bac_capturedcow.getStage())
	;debug.messagebox("capt2: "+bac_capturedcow2.getStage())
	
	if (Game.getPlayer().getFactionRank(bac_mark)>0)
		Game.getPlayer().setFactionRank(bac_mark,1)
		if bac_capturedcow.getStage() > 30
			Game.getPlayer().setFactionRank(bac_mark,2)
		endif
		if bac_capturedcow2.getStage() > 30
			Game.getPlayer().setFactionRank(bac_mark,3)
		endif		
	endif
	
	;debug.messagebox("cow rank is: "+Game.getPlayer().getFactionRank(bac_mark))
	
endFunction

function updateTo40()
	BACConfig.commentProb=30
endFunction

function updateTo38()
	BACConfig.playerHands = None
	
	
	BACActor.npcs_bigUdders = new bool[32]
	int i = 0
	while i < BACActor.getArrayCount()
		BACActor.npcs_bigUdders[i]  = false
		i+=1
	endwhile
endFunction


function updateTo37()

BACActor.npcs_veinsCow1 = new bool[32]
BACActor.npcs_veinsCow2 = new bool[32]

	int i = 0
	while i < BACActor.getArrayCount()
		BACActor.npcs_veinsCow1[i]  = false
		BACActor.npcs_veinsCow2[i]  = false
		i+=1
	endwhile
	
endFunction


function updateTo36()
	BACConfig.buildInLevelSystem = true
endFunction

function updateTo35()
	BACConfig.bellyMultFakePreg = 4.0
	;BACActor.npcs_pregCowCount = new Float[32]	
endFunction

function updateTo34()
BACConfig.showNotifications = false
	BACActor.npcs_pregCow = new bool[32]
	BACActor.npcs_openassfurCow = new bool[32]
	int i = 0
	while i < BACActor.getArrayCount()
		BACActor.npcs_pregCow[i]  = false
		BACActor.npcs_openassfurCow[i]  = false
		i+=1
	endwhile
endfunction


function updateTo33()
			BACActor.npcs_wetCow = new bool[32]
			BACActor.npcs_hornyCow = new bool[32]
			BACActor.npcs_dirtCow = new bool[32]
			BACActor.npcs_fatCow = new bool[32]
			BACActor.npcs_fatCow2 = new bool[32]
			BACActor.npcs_slimCow = new bool[32]
			BACActor.npcs_slimCow2 = new bool[32]
			
			BACActor.npcs_curvyCow = new bool[32]
			BACActor.npcs_faceCow = new bool[32]
			BACActor.npcs_faceCow2 = new bool[32]
			BACActor.npcs_faceCow3 = new bool[32]
			BACActor.npcs_celluliteCow = new bool[32]
			BACActor.npcs_color = new int[32]
	int i = 0
	while i < BACActor.getArrayCount()
	
	BACActor.npcs_wetCow[i]  = false
	BACActor.npcs_hornyCow[i]  = false
	BACActor.npcs_dirtCow[i]   = false
	BACActor.npcs_fatCow[i]   = false
	BACActor.npcs_fatCow2[i]   = false
	BACActor.npcs_slimCow[i]   = false
	BACActor.npcs_slimCow2[i]   = false	
	BACActor.npcs_curvyCow[i]   = false
	BACActor.npcs_faceCow[i]   = false
	BACActor.npcs_faceCow2[i]   = false
	BACActor.npcs_faceCow3[i]   = false
	BACActor.npcs_celluliteCow[i]   = false
	BACActor.npcs_color[i]   =  BACConfig.tatsColorInt
	
		if BACActor.npcs_ref[i]!=None	
			;if BACActor.npcs_phase[i] > 16
			;	BACActor.npcs_phase[i] = 16
			;endif
			
			if BACActor.npcs_phase[i] > 10
				BACActor.npcs_ref[i].addItem(bac_mutator,BACActor.npcs_phase[i] - 10)
				if BACActor.npcs_ref[i] != Game.getPlayer()
					;todo				
					int j = 0
					while j <= (BACActor.npcs_phase[i] - 10)
					BACActor.npcs_ref[i].EquipItem(bac_mutator)
						j = j + 1
					endwhile
				endif
			endif
			
			
			BACMain.addTransformations(i)
			
			if BACActor.npcs_ref[i] != Game.getPlayer()
				BACActor.npcs_color[i] = Utility.randomInt(0,2)
			else
				BACActor.npcs_color[i] = BACConfig.tatsColorInt
			endif
			
			NiOverride.RemoveNodeTransformScale(BACActor.npcs_ref[i],False,True,"NPC L UpperArm [LUar]","BAC")    
			NiOverride.RemoveNodeTransformScale(BACActor.npcs_ref[i],False,True,"NPC L Forearm [LLar]","BAC")
			NiOverride.RemoveNodeTransformScale(BACActor.npcs_ref[i],False,True,"NPC R UpperArm [RUar]","BAC")
			NiOverride.RemoveNodeTransformScale(BACActor.npcs_ref[i],False,True,"NPC R Forearm [RLar]","BAC")

			NiOverride.RemoveNodeTransformScale(BACActor.npcs_ref[i],False,True,"NPC R Calf [RClf]","BAC")    
			NiOverride.RemoveNodeTransformScale(BACActor.npcs_ref[i],False,True,"NPC L Calf [LClf]","BAC")
			NiOverride.RemoveNodeTransformScale(BACActor.npcs_ref[i],False,True,"NPC L Thigh [LThg]","BAC")
			NiOverride.RemoveNodeTransformScale(BACActor.npcs_ref[i],False,True,"NPC R Thigh [RThg]","BAC")

			NiOverride.UpdateNodeTransform(BACActor.npcs_ref[i], false, True, "NPC R Calf [RClf]")
			NiOverride.UpdateNodeTransform(BACActor.npcs_ref[i], false, True, "NPC L Calf [LClf]") 
			NiOverride.UpdateNodeTransform(BACActor.npcs_ref[i], false, True, "NPC L Thigh [LThg]") 
			NiOverride.UpdateNodeTransform(BACActor.npcs_ref[i], false, True, "NPC R Thigh [RThg]") 
			NiOverride.UpdateNodeTransform(BACActor.npcs_ref[i], false, True, "NPC L UpperArm [LUar]")
			NiOverride.UpdateNodeTransform(BACActor.npcs_ref[i], false, True, "NPC L Forearm [LLar]")
			NiOverride.UpdateNodeTransform(BACActor.npcs_ref[i], false, True, "NPC R UpperArm [RUar]")
			NiOverride.UpdateNodeTransform(BACActor.npcs_ref[i], false, True, "NPC R Forearm [RLar]")	
			SLIF_Main.unregisterNode(BACActor.npcs_ref[i], "slif_belly", "BAC")
			SLIF_Main.unregisterNode(BACActor.npcs_ref[i], "slif_butt", "BAC")
			

		endif
		i+=1
	endwhile
endFunction

function updateTo32()
	if bac_unownedq.getStage()==100		
		bac_afterstorm.setStage(10)		
	endif
	bac_blacksmith_debt.setValueInt(30000)
endFunction

function updateTo31()
	BACConfig.hpTriggerHit = 25
endFunction

function updateTo30()
	BACConfig.fatFactor1 = 0.2
	BACConfig.fatFactor2 = 1.1
	BACConfig.PlayerfatFactor1 = BACConfig.fatFactor1
	BACConfig.PlayerfatFactor2 = BACConfig.fatFactor2
	BACConfig.slifExtraValue = true
	BACConfig.hpTriggerHit = 25

endFunction

function updateTo29()
endfunction

function updateTo28()
	
	if bac_unownedq.getStage()==250		
		bac_tears1.setStage(10)		
	endif
	
	
	

	
endFunction


function updateTo27()

	bac_cat_inplace.setValueInt(0)

	updateAlways()
	
	BACConfig.solveHands = true
	BACConfig.bellVolume = 70
	BACConfig.horseshoeVolume = 70
	
	if bac_blacksmith_mainscene.IsPlaying() == false
		BACQuestCtrl.or_b_bacFurniture =  BACBlacksmithStorage.altfurniture
		
		Debug.notification("Being a cow debug msg: reconfigure blacksmith scene")
		
		if bac_blacksmith.getStage() < 10
			BACQuestCtrl.setStageQ("blacksmith",1)
			BACQuestCtrl.setStageQ("blacksmith",0)
		endif
		if bac_blacksmith.getStage() == 10
			BACQuestCtrl.setStageQ("blacksmith",11)
			BACQuestCtrl.setStageQ("blacksmith",10)
		endif
		if bac_blacksmith.getStage() == 20
			BACQuestCtrl.setStageQ("blacksmith",21)
			BACQuestCtrl.setStageQ("blacksmith",20)
		endif
		
		if bac_blacksmith.getStage()>20
			BACQuestCtrl.setStageQ("blacksmith",20)
		endif
		
		if bac_blacksmith_mainscene.IsPlaying() == false
			Debug.notification("Being a cow debug msg: scene is not running.")
		else
			Debug.notification("Being a cow debug msg: scene is running, all ok!.")
		endif
	else
		Debug.notification("Being a cow debug msg: Nothing to do with scene (good!)")
	endif



endfunction

function updateTo26()
	if zaz.GetVersion()>610
		debug.messagebox("Being a cow: I Said that this mod requied Zaz Animation pack 8.0 - I made back compatibility fix but I don't give any guaranty that mod will work's correctly with your version. Ignore this message or upgrade Zaz to 8.0 and try again...")
	endif
endFunction


function updateTo25()
	BACConfig.playerFeet = None
	
	if bac_blacksmith.IsRunning()

	else

		bac_blacksmith.Reset()
		bac_blacksmith.Start()
		bac_blacksmith.SetStage(0)
		
	endif
	;Utility.wait(5.0)
	if bac_blacksmith_mainscene.IsPlaying()
		
	else
		
		bac_blacksmith_mainscene.Start()

		if bac_blacksmith_mainscene.IsPlaying() == false
			bac_blacksmith_mainscene.ForceStart()
			if bac_blacksmith_mainscene.IsPlaying() == false
			;debug.messagebox("error, scene is dead")
			endif
		endif
	endif	
	
endFunction

function updateTo24()
	BACConfig.allowTailSound = true
endFunction

function updateTo23()
	int i = 0	
		
	while i < BACActor.getArrayCount()
	
		if BACActor.npcs_ref[i]!=None			
			 if BACConfig.buildInLevelSystem == false
				BACActor.npcs_timesLast[i] = -1
			endif
		endif
		
	i+=1
	endwhile
endfunction

function updateTo22()
	BACConfig.allowToSpreadColours = true
	BACConfig.allowToChangeBodyWeight = true
	BACConfig.allowToLegsDeformation = true
	BACConfig.tatsColor = "Brown"
	BACConfig.tatsColorInt = 0
	BACConfig.bodyButt = 2.0
	BACConfig.bodyBelly = 2.0
	
	int i = 0
	while i < BACActor.getArrayCount()
		if BACActor.npcs_ref[i]!=None			
			debug.notification("Being a cow - reset progress")	
			
			;BACActor.npcs_lastLevel[i] = 0
			BACActor.npcs_phase[i] = 0
			BACActor.npcs_lastKnownTato[i] = ""
			BACActor.npcs_times[i] = 0
			BACActor.npcs_timesLast[i] = 0
			BACActor.clearEffects(i)
		endif
		i+=1
	endwhile
	
endFunction

function updateTo21()
	
	BACConfig.onePer360 = 1/360
	
	int i = 0	
	BACActor.npcs_milkWearBonus = new Float[32]
	
	while i < BACActor.getArrayCount()
	
		if BACActor.npcs_ref[i]!=None			
			 BACActor.npcs_ref[i].AddToFaction(BACStore.bac_milkmaid)
			 BACActor.npcs_ref[i].SetFactionRank(BACStore.bac_milkmaid, 0)
			 BACActor.npcs_milkWearBonus[i] = 0
		endif
		
	i+=1
	endwhile
endfunction


function updateTo20()
	BACConfig.solveUdders = true
	BACConfig.buildInLevelSystem = true
	bool tmpEnabled = BACConfig.modEnabled
	BACConfig.modEnabled = false

	if BACConfig.painLevel < 10
		BACConfig.painLevel = 10
	endif
		
	BACConfig.transformationTempo = 1	;normal

	int i = 0
	while i < BACActor.getArrayCount()
		if BACActor.npcs_ref[i]!=None			
				
			;BACActor.npcs_lastLevel[i] = 0
			BACActor.npcs_phase[i] = 0
			BACActor.npcs_lastKnownTato[i] = ""
			BACActor.npcs_times[i] = 0
			BACActor.npcs_timesLast[i] = 0
			BACActor.clearEffects(i)
		endif
		i+=1
	endwhile

	if tmpEnabled == true
		BACConfig.modEnabled = true
		BACMain.reEnableMod()
	endif
		
endFunction

function updateTo19()
	BACConfig.painLevel = 15
	BACConfig.painLevelEnabled = true
	BACConfig.addSounds = true
	BACConfig.addFacialExp = true
endFunction

function updateTo18()

BACActor.npc_sound1 = new int[32]
BACActor.npc_sound2 = new int[32]
BACActor.npc_sound3 = new int[32]
BACActor.npc_sound4 = new int[32]
BACActor.npc_sound5 = new int[32]
BACActor.npcs_lastSound = new int[32]

int i = 0
	
	while i < 32
	
		BACActor.npc_sound1[i] = 0
		BACActor.npc_sound2[i] = 0
		BACActor.npc_sound3[i] = 0
		BACActor.npc_sound4[i] = 0
		BACActor.npc_sound5[i] = 0
		BACActor.npcs_lastSound[i] = 0
		
		i+=1
	endwhile


endFunction

function updateTo17()
	BACConfig.showConsoleOutput = true
	BACConfig.hardcoreMode = false
	BACConfig.equipJob = false
	updateActorEquip()
endFunction

function updateTo13()	
	
	int i = 0
	while i < BACActor.getArrayCount()
		if BACActor.npcs_ref[i]!=None			
			BACActor.unregisterActor(i)	
		endif
		i+=1
	endwhile
	
	BACMain.onLocationChange()
	
endFunction



function updateTo11()
	BACConfig.maintenance = false
	
	BACConfig.allowTats = true
	
endFunction

function updateTo10()


	

	BACConfig.updateInterval = 5.0
	
	
	BACActor.npcs_ref = new actor[32]
	;BACActor.npcs_lastLevel = new int[32]
	BACActor.npcs_phase = new int[32]
	BACActor.npcs_lastKnownTato = new String[32]
	BACActor.npcs_times = new Int[32]
	BACActor.npcs_timesLast = new Int[32]
	int i = 0
	
	while i < 32
		BACActor.npcs_ref[i] = None
		;BACActor.npcs_lastLevel[i] = 0
		BACActor.npcs_phase[i] = 0
		BACActor.npcs_lastKnownTato[i] = ""
		BACActor.npcs_times[i] = 0
		BACActor.npcs_timesLast[i] = 0
		i+=1
	endwhile

endFunction


function updateAlways()

	bac_beingacowProp.cleanUpQuests()
    
	bac_beingacowProp.NeuQ = new Quest[2]
	bac_beingacowProp.NeuQ[0] = BACStore.bac__quest_Neutral_001_farmHelp
	bac_beingacowProp.NeuQ[1] = BACStore.bac__quest_Neutral_002_MilkBottle


	bac_beingacowProp.BadQ = new Quest[5]
	bac_beingacowProp.BadQ[0] = BACStore.bac__quest_Evil_001_MobileMilkingService
	bac_beingacowProp.BadQ[1] = BACStore.bac__quest_Evil_002_FreakShow001
	bac_beingacowProp.BadQ[2] = BACStore.bac__quest_Evil_003_BodyBuild
	bac_beingacowProp.BadQ[3] = BACStore.bac__quest_Evil_004_RunCowRun
	bac_beingacowProp.BadQ[4] = BACStore.bac__quest_Evil_005_ShakeYourAssCow
	
	bac_beingacowProp.GoodQ = new Quest[4]
	bac_beingacowProp.GoodQ[0] = BACStore.bac__quest_Good_001_GiveMeBreast
	bac_beingacowProp.GoodQ[1] = BACStore.bac__quest_Neutral_001_farmHelp
	bac_beingacowProp.GoodQ[2] = BACStore.bac__quest_Neutral_002_MilkBottle
	bac_beingacowProp.GoodQ[3] = BACStore.bac__quest_Good_002_LetMeFreeYou
	
	bac_beingacowProp.PunQ = new Quest[4]
	bac_beingacowProp.PunQ[0] = BACStore.bac__quest_Pun_001_BeNaked
	bac_beingacowProp.PunQ[1] = BACStore.bac__quest_Pun_002_StocksShow
	bac_beingacowProp.PunQ[2] = BACStore.bac__quest_Pun_003_WearIt
	bac_beingacowProp.PunQ[3] = BACStore.bac__quest_Pun_003_WearIt
	
	debug.trace(" - Update Alawys BAC: Quests START -")
	debug.trace(bac_beingacowProp)
	debug.trace(bac_beingacowProp.BadQ)
	debug.trace(" - Update Alawys BAC: Quests END -")
	
	BACUtilities.log("Update::updateAlways","Zaz version:"+zaz.GetVersion())
;	Furniture t1 = BACBlacksmithStorage.chair as Furniture
	if BACBlacksmithStorage.chair == NONE && BACBlacksmithStorage.altfurniture != NONE
;	if  (!t1)
		;debug.messagebox("Being a cow: I Said that this mod requied Zaz Animation pack 8.0 - I'm going to fix your ignorance but I don't give a guaranty that mod will work's correctly. Ignore this message or upgrade Zaz to 8.0 and try again...")
		BACBlacksmithStorage.chair =  BACBlacksmithStorage.altfurniture
		BACBlacksmithStorage.stock = BACBlacksmithStorage.altfurniture
		BACBlacksmithStorage.stockVert = BACBlacksmithStorage.altfurniture
		BACBlacksmithStorage.bitchLession = BACBlacksmithStorage.altfurniture
		BACUtilities.log("Update::updateAlways","Zaz 8.0 not installed. WTF")
	else
		BACBlacksmithStorage.chair =  BACBlacksmithStorage.orgchair
		BACBlacksmithStorage.stock = BACBlacksmithStorage.orgstock
		BACBlacksmithStorage.stockVert = BACBlacksmithStorage.orgstockVert
		BACBlacksmithStorage.bitchLession = BACBlacksmithStorage.orgbitchLession
		BACUtilities.log("Update::updateAlways","Zaz 8.0 it's good!")
	endif


	BACConfig.PlayerSlot = BACActor.registerActor(Game.GetPlayer())

	if Game.GetModbyName("SexLab Inflation Framework.esp") != 255
		BACConfig.slifPack = true
		BACUtilities.log("Update::updateAlways","check for SLIF OK")
	else
		BACConfig.slifPack = false
		BACUtilities.log("Update::updateAlways","check for SLIF NONE")
	endif
	
	if (Game.GetModbyName("SlaveTats.esp") != 255)
		BACConfig.slaveTatsPack = true		
		BACUtilities.log("Update::updateAlways","check for SlaveTats OK")
	else
		BACUtilities.log("Update::updateAlways","check for SlaveTats NONE")
		BACConfig.slaveTatsPack = false
	endIf
	
	if (Game.GetModbyName("dcc-soulgem-oven-000.esm") != 255)
		BACConfig.soulGemPack = true		
		BACUtilities.log("Update::updateAlways","check for Soulgem Oven OK")
		BACMain.registerSoulGemOven()
	else
		BACUtilities.log("Update::updateAlways","check for Soulgem Oven NONE")
		BACConfig.soulGemPack = false
	endIf	
	
	BACConfig.soulGemPack = false ;TODO

	if (Game.GetModbyName("MilkModNEW.esp") != 255)
		BACConfig.milkModPack = true		
		BACUtilities.log("Update::updateAlways","check for Milk Mod Economy OK")
	else
		BACUtilities.log("Update::updateAlways","check for Milk Mod Economy  NONE")
		BACConfig.milkModPack = false
	endIf	
	
	if BACConfig.milkModPack == false
		BACConfig.modEnabled = false
		debug.MessageBox("Being A Cow will not run without Milk Mod Economy: Install MME and then enable this mod in MCM!")
	
	else
		BACConfig.mme_milk = Game.GetFormFromFile(0x0406D61F, "MilkModNEW.esp") as Keyword		
	endIf
	
	BACConfig.bell = new Armor[3]
	BACConfig.bell[0] = BACConfig.playerBell
	BACConfig.bell[1] = BACStore.bac_cowbell
	BACConfig.bell[2] = BACStore.bac_cowbellbig
	
	
	BACConfig.noserings = new Armor [4]
	BACConfig.noserings[0] = BACConfig.playerNose
	BACConfig.noserings[1] = BACStore.bac_nosering02
	BACConfig.noserings[2] = BACStore.bac_nosering02
	BACConfig.noserings[3] = BACStore.bac_nosering03
	
	BACConfig.horns = new Armor [4]
	BACConfig.horns[0] = BACStore.bac_horns01
	BACConfig.horns[1] = BACStore.bac_horns02
	BACConfig.horns[2] = BACStore.bac_horns03
	BACConfig.horns[3] = BACStore.bac_marged_horns_ears_42

	BACConfig.ears = new Armor [4]
	BACConfig.ears[0] = BACStore.bac_ears01
	BACConfig.ears[1] = BACStore.bac_ears02
	BACConfig.ears[2] = BACStore.bac_ears03
	BACConfig.ears[3] = BACStore.bac_marged_horns_ears_55
	
	BACConfig.tails = new Armor [2]
	BACConfig.tails[0] = BACStore.bac_tail01
	BACConfig.tails[1] = BACStore.bac_tail02
	;BACConfig.tails[2] = BACStore.bac_tail03		
	
	BACConfig.wet = new Armor [2]
	BACConfig.wet[0] = BACStore.bac_wet01
	BACConfig.wet[1] = BACStore.bac_wet02
	
	BACConfig.hooves = new Armor [4]
	BACConfig.hooves[0] = BACStore.bac_hooves01
	BACConfig.hooves[1] = BACStore.bac_hooves02	
	BACConfig.hooves[2] = BACStore.bac_hooves03
	BACConfig.hooves[3] = BACConfig.playerFeet	;quest line

	
	BACConfig.hoovesHands = new Armor [2]
	BACConfig.hoovesHands[0] = BACStore.bac_hooves_hands01
	BACConfig.hoovesHands[1] = BACConfig.playerHands
		
	
	BACConfig.udders = new Armor [3]
	BACConfig.udders[0] = BACStore.bac_udders01
	BACConfig.udders[1] = BACStore.bac_udders02
	BACConfig.udders[2] = BACStore.bac_udders03

	BACConfig.generalComments = new Topic [3] 
	BACConfig.generalComments[0] = BACStore.bac_commentsG1
	BACConfig.generalComments[1] = BACStore.bac_commentsG2
	BACConfig.generalComments[2] = BACStore.bac_commentsG3	
	
	BACConfig.generalComments1 = new Topic [6] 
	BACConfig.generalComments1[0] = BACStore.bac_commentsG1
	BACConfig.generalComments1[1] = BACStore.bac_commentsG2
	BACConfig.generalComments1[2] = BACStore.bac_commentsG3
	BACConfig.generalComments1[3] = BACStore.bac_commentsGM1
	BACConfig.generalComments1[4] = BACStore.bac_commentsGM2
	BACConfig.generalComments1[5] = BACStore.bac_commentsGM3

	BACConfig.generalComments2 = new Topic [9] 
	BACConfig.generalComments2[0] = BACStore.bac_commentsG1
	BACConfig.generalComments2[1] = BACStore.bac_commentsG2
	BACConfig.generalComments2[2] = BACStore.bac_commentsG3
	BACConfig.generalComments2[3] = BACStore.bac_commentsGM1
	BACConfig.generalComments2[4] = BACStore.bac_commentsGM2
	BACConfig.generalComments2[5] = BACStore.bac_commentsGM3
	BACConfig.generalComments2[6] = BACStore.bac_commentsGH1
	BACConfig.generalComments2[7] = BACStore.bac_commentsGH2
	BACConfig.generalComments2[8] = BACStore.bac_commentsGH3

	BACConfig.generalCommentsFR = new Topic [3] 
	BACConfig.generalCommentsFR[0] = BACStore.bac_commentsFR1
	BACConfig.generalCommentsFR[1] = BACStore.bac_commentsFR2
	BACConfig.generalCommentsFR[2] = BACStore.bac_commentsFR3	

	BACConfig.generalCommentsEN = new Topic [3] 
	BACConfig.generalCommentsEN[0] = BACStore.bac_commentsEN1
	BACConfig.generalCommentsEN[1] = BACStore.bac_commentsEN2
	BACConfig.generalCommentsEN[2] = BACStore.bac_commentsEN3	


	BACConfig.generalCommentsFat = new Topic [2] 
	BACConfig.generalCommentsFat[0] = BACStore.bac_comments_Fat1
	BACConfig.generalCommentsFat[1] = BACStore.bac_comments_Fat2

	BACConfig.generalCommentsStink = new Topic [2] 
	BACConfig.generalCommentsStink[0] = BACStore.bac_comments_stink1
	BACConfig.generalCommentsStink[1] = BACStore.bac_comments_stink1

	BACConfig.generalCommentsCelFem = new Topic [2] 
	BACConfig.generalCommentsCelFem[0] = BACStore.bac_comments_CelFem1
	BACConfig.generalCommentsCelFem[2] = BACStore.bac_comments_CelFem2
	
	BACConfig.generalCommentsCelMal = new Topic [2] 
	BACConfig.generalCommentsCelMal[0] = BACStore.bac_comments_CelMal1
	BACConfig.generalCommentsCelMal[1] = BACStore.bac_comments_CelMal2

	BACConfig.generalCommentsFace = new Topic [1] 
	BACConfig.generalCommentsFace[0] = BACStore.bac_comments_Face1
	
	BACConfig.generalCommentsWet = new Topic [1] 
	BACConfig.generalCommentsWet[0] = BACStore.bac_comments_wet1
	
	BACConfig.generalCommentsPreg = new Topic [2] 
	BACConfig.generalCommentsPreg[0] = BACStore.bac_comments_preg1
	BACConfig.generalCommentsPreg[1] = BACStore.bac_comments_preg2
	

	BACConfig.allItems = new Armor[64]
	BACConfig.allItems[0] = BACStore.bac_horns01
	BACConfig.allItems[1] = BACStore.bac_horns02
	BACConfig.allItems[2] = BACStore.bac_horns03
	BACConfig.allItems[3] = BACStore.bac_nosering01
	BACConfig.allItems[4] = BACStore.bac_nosering02
	BACConfig.allItems[5] = BACStore.bac_nosering03
	BACConfig.allItems[6] = BACStore.bac_ears01
	BACConfig.allItems[7] = BACStore.bac_ears02
	BACConfig.allItems[8] = BACStore.bac_ears03
	BACConfig.allItems[9] = BACStore.bac_tail01
	BACConfig.allItems[10] = BACStore.bac_tail02
	BACConfig.allItems[11] = BACStore.bac_cowbell
	BACConfig.allItems[12] = BACStore.bac_cowbellbig
	BACConfig.allItems[13] = BACStore.bac_hooves_hands01
	BACConfig.allItems[14] = BACStore.bac_hooves_hands_heavy
	BACConfig.allItems[15] = BACStore.bac_wet01
	BACConfig.allItems[16] = BACStore.bac_wet02
	BACConfig.allItems[17] = BACStore.bac_hooves01
	BACConfig.allItems[18] = BACStore.bac_hooves02
	BACConfig.allItems[19] = BACStore.bac_hooves03
	BACConfig.allItems[20] = BACStore.bac_hooves_hs
	BACConfig.allItems[21] = BACStore.bac_hooves_heavy
	BACConfig.allItems[22] = BACStore.bac_marged_horns_ears_42
	BACConfig.allItems[23] = BACStore.bac_marged_horns_ears_55
	BACConfig.allItems[24] = BACStore.bac_cowbell_ring_44
	BACConfig.allItems[25] = BACStore.bac_cowbell_ring_45
	BACConfig.allItems[26] = BACStore.bac_cowbell_ring_47
	BACConfig.allItems[27] = BACStore.bac_cowbell_ring_big_44
	BACConfig.allItems[28] = BACStore.bac_cowbell_ring_big_45
	BACConfig.allItems[29] = BACStore.bac_cowbell_ring_big_47
	BACConfig.allItems[30] = BACStore.bac_udders01
	BACConfig.allItems[31] = BACStore.bac_udders02
	BACConfig.allItems[32] = BACStore.bac_udders03
	BACConfig.allItems[33] = BACStore.bac_punish01
	BACConfig.allItems[34] = BACStore.bac_punish02
	BACConfig.allItems[35] = BACStore.bac_punish03
	

	
	BACConfig.milks = new Form[63]

	BACConfig.milks[0] =  Game.GetFormFromFile(0x04016364, "MilkModNEW.esp") as Form
	BACConfig.milks[1] =  Game.GetFormFromFile(0x04016368, "MilkModNEW.esp") as Form
	BACConfig.milks[2] =  Game.GetFormFromFile(0x04016369, "MilkModNEW.esp") as Form
	BACConfig.milks[3] =  Game.GetFormFromFile(0x040168CE, "MilkModNEW.esp") as Form
	BACConfig.milks[4] =  Game.GetFormFromFile(0x040168D0, "MilkModNEW.esp") as Form
	BACConfig.milks[5] =  Game.GetFormFromFile(0x04016E34, "MilkModNEW.esp") as Form
	BACConfig.milks[6] =  Game.GetFormFromFile(0x04017398, "MilkModNEW.esp") as Form
	BACConfig.milks[7] =  Game.GetFormFromFile(0x0401739A, "MilkModNEW.esp") as Form
	BACConfig.milks[8] =  Game.GetFormFromFile(0x0401739E, "MilkModNEW.esp") as Form
	BACConfig.milks[9] =  Game.GetFormFromFile(0x04017901, "MilkModNEW.esp") as Form
	BACConfig.milks[10] = Game.GetFormFromFile(0x04017905, "MilkModNEW.esp") as Form
	BACConfig.milks[11] = Game.GetFormFromFile(0x04017907, "MilkModNEW.esp") as Form
	BACConfig.milks[12] = Game.GetFormFromFile(0x04017909, "MilkModNEW.esp") as Form
	BACConfig.milks[13] = Game.GetFormFromFile(0x0401790B, "MilkModNEW.esp") as Form
	BACConfig.milks[14] = Game.GetFormFromFile(0x0401790D, "MilkModNEW.esp") as Form
	BACConfig.milks[15] = Game.GetFormFromFile(0x0401790F, "MilkModNEW.esp") as Form
	BACConfig.milks[16] = Game.GetFormFromFile(0x04017911, "MilkModNEW.esp") as Form
	BACConfig.milks[17] = Game.GetFormFromFile(0x04017913, "MilkModNEW.esp") as Form
	BACConfig.milks[18] = Game.GetFormFromFile(0x04017915, "MilkModNEW.esp") as Form
	BACConfig.milks[19] = Game.GetFormFromFile(0x04017917, "MilkModNEW.esp") as Form
	BACConfig.milks[20] = Game.GetFormFromFile(0x04017919, "MilkModNEW.esp") as Form
	BACConfig.milks[21] = Game.GetFormFromFile(0x0401791B, "MilkModNEW.esp") as Form
	BACConfig.milks[22] = Game.GetFormFromFile(0x0401791D, "MilkModNEW.esp") as Form
	BACConfig.milks[23] = Game.GetFormFromFile(0x0401791F, "MilkModNEW.esp") as Form
	BACConfig.milks[24] = Game.GetFormFromFile(0x04017921, "MilkModNEW.esp") as Form
	BACConfig.milks[25] = Game.GetFormFromFile(0x04017923, "MilkModNEW.esp") as Form
	BACConfig.milks[26] = Game.GetFormFromFile(0x04017925, "MilkModNEW.esp") as Form
	BACConfig.milks[27] = Game.GetFormFromFile(0x04017927, "MilkModNEW.esp") as Form
	BACConfig.milks[28] = Game.GetFormFromFile(0x040183ED, "MilkModNEW.esp") as Form
	BACConfig.milks[29] = Game.GetFormFromFile(0x040183EF, "MilkModNEW.esp") as Form
	BACConfig.milks[30] = Game.GetFormFromFile(0x040183F1, "MilkModNEW.esp") as Form
	BACConfig.milks[31] = Game.GetFormFromFile(0x040183F3, "MilkModNEW.esp") as Form
	BACConfig.milks[32] = Game.GetFormFromFile(0x040183F5, "MilkModNEW.esp") as Form
	BACConfig.milks[33] = Game.GetFormFromFile(0x040183F7, "MilkModNEW.esp") as Form
	BACConfig.milks[34] = Game.GetFormFromFile(0x040183F9, "MilkModNEW.esp") as Form
	BACConfig.milks[35] = Game.GetFormFromFile(0x040183FB, "MilkModNEW.esp") as Form
	BACConfig.milks[36] = Game.GetFormFromFile(0x040183FF, "MilkModNEW.esp") as Form
	BACConfig.milks[37] = Game.GetFormFromFile(0x04018401, "MilkModNEW.esp") as Form
	BACConfig.milks[38] = Game.GetFormFromFile(0x04018403, "MilkModNEW.esp") as Form
	BACConfig.milks[39] = Game.GetFormFromFile(0x04018405, "MilkModNEW.esp") as Form
	BACConfig.milks[40] = Game.GetFormFromFile(0x04018407, "MilkModNEW.esp") as Form
	BACConfig.milks[41] = Game.GetFormFromFile(0x04018409, "MilkModNEW.esp") as Form
	BACConfig.milks[42] = Game.GetFormFromFile(0x0401840F, "MilkModNEW.esp") as Form
	BACConfig.milks[43] = Game.GetFormFromFile(0x04018411, "MilkModNEW.esp") as Form
	BACConfig.milks[44] = Game.GetFormFromFile(0x04018413, "MilkModNEW.esp") as Form
	BACConfig.milks[45] = Game.GetFormFromFile(0x04018415, "MilkModNEW.esp") as Form
	BACConfig.milks[46] = Game.GetFormFromFile(0x04038F5A, "MilkModNEW.esp") as Form
	BACConfig.milks[47] = Game.GetFormFromFile(0x04038F5B, "MilkModNEW.esp") as Form
	BACConfig.milks[48] = Game.GetFormFromFile(0x040394C2, "MilkModNEW.esp") as Form
	BACConfig.milks[49] = Game.GetFormFromFile(0x040581F5, "MilkModNEW.esp") as Form
	BACConfig.milks[50] = Game.GetFormFromFile(0x040581F7, "MilkModNEW.esp") as Form
	BACConfig.milks[51] = Game.GetFormFromFile(0x040581F9, "MilkModNEW.esp") as Form
	BACConfig.milks[52] = Game.GetFormFromFile(0x040581FB, "MilkModNEW.esp") as Form
	BACConfig.milks[53] = Game.GetFormFromFile(0x040581FD, "MilkModNEW.esp") as Form
	BACConfig.milks[54] = Game.GetFormFromFile(0x040581FF, "MilkModNEW.esp") as Form
	BACConfig.milks[55] = Game.GetFormFromFile(0x04058201, "MilkModNEW.esp") as Form
	BACConfig.milks[56] = Game.GetFormFromFile(0x04058203, "MilkModNEW.esp") as Form
	BACConfig.milks[57] = Game.GetFormFromFile(0x04058204, "MilkModNEW.esp") as Form
	BACConfig.milks[58] = Game.GetFormFromFile(0x04058206, "MilkModNEW.esp") as Form
	BACConfig.milks[59] = Game.GetFormFromFile(0x0405820A, "MilkModNEW.esp") as Form
	BACConfig.milks[60] = Game.GetFormFromFile(0x04059236, "MilkModNEW.esp") as Form
	BACConfig.milks[61] = Game.GetFormFromFile(0x04059237, "MilkModNEW.esp") as Form
	BACConfig.milks[62] = Game.GetFormFromFile(0x04059239, "MilkModNEW.esp") as Form


	
	
	BACConfig.slotMask = new Int[65]
	BACConfig.slotMask[30] = 0x00000001
	BACConfig.slotMask[31] = 0x00000002
	BACConfig.slotMask[32] = 0x00000004
	BACConfig.slotMask[33] = 0x00000008
	BACConfig.slotMask[34] = 0x00000010
	BACConfig.slotMask[35] = 0x00000020
	BACConfig.slotMask[36] = 0x00000040
	BACConfig.slotMask[37] = 0x00000080
	BACConfig.slotMask[38] = 0x00000100
	BACConfig.slotMask[39] = 0x00000200
	BACConfig.slotMask[40] = 0x00000400
	BACConfig.slotMask[41] = 0x00000800
	BACConfig.slotMask[42] = 0x00001000
	BACConfig.slotMask[43] = 0x00002000
	BACConfig.slotMask[44] = 0x00004000
	BACConfig.slotMask[45] = 0x00008000
	BACConfig.slotMask[46] = 0x00010000
	BACConfig.slotMask[47] = 0x00020000
	BACConfig.slotMask[48] = 0x00040000
	BACConfig.slotMask[49] = 0x00080000
	BACConfig.slotMask[50] = 0x00100000
	BACConfig.slotMask[51] = 0x00200000
	BACConfig.slotMask[52] = 0x00400000
	BACConfig.slotMask[53] = 0x00800000
	BACConfig.slotMask[54] = 0x01000000
	BACConfig.slotMask[55] = 0x02000000
	BACConfig.slotMask[56] = 0x04000000
	BACConfig.slotMask[57] = 0x08000000
	BACConfig.slotMask[58] = 0x10000000
	BACConfig.slotMask[59] = 0x20000000
	BACConfig.slotMask[60] = 0x40000000
	BACConfig.slotMask[61] = 0x80000000
	
	

	
	if BACConfig.modVersion	!= BACMain.getVersion()
	
	updateActorEquip()
	
	endif
	
	
	

	
	
	
endFunction

function updateActorEquip()

	
	BACConfig.maintenance = true
	
	Debug.notification("Being a cow - update actors - START")
	
	int i = 0
	while i < BACActor.getArrayCount()
		if BACActor.npcs_ref[i]!=None
			
				BACActor.removeItems(i)
			
			BACActor.reequipItems(i)
		endif
		
	i+=1
	endwhile
	
	Debug.notification("Being a cow - update actors - END")
	
	BACMain.onLocationChange()
	BACConfig.maintenance = false
endFunction