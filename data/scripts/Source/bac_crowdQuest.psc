Scriptname bac_crowdQuest extends Quest  

Actor[] Property qActors Auto
bac_quest_ctr Property bacCtrl Auto
Quest property thisQuest auto
Scene Property bac__quest_helper_crowdScene Auto
ObjectReference Property emptyFill Auto

function initAll()
	debug.trace("BACCrowd::stop scene")
	bac__quest_helper_crowdScene.stop()
	debug.trace("BACCrowd::stop quest")
	thisQuest.reset()
	debug.trace("BACCrowd::start quest")
	
	emptyFill = bacCtrl.or_b_bacCrowdSpot
	
	
	
	int i = 0
	
	
	while i < 16
		
		ReferenceAlias ref 
		if i < 10
			ref = thisQuest.getAliasByName("Pers0"+i) as ReferenceAlias
		else
			ref = thisQuest.getAliasByName("Pers"+i) as ReferenceAlias
		endif
		
		if ref!=None
			ref.ForceRefTo(emptyFill)
		endif
		i = i + 1
	endwhile
	
	thisQuest.start()
	
	bool t = thisQuest.IsRunning()
	 i = 0
	while i < 100
		if t == true
			i = 100
		endif
		if i > 0
		utility.wait(0.1)
		endif
		t = thisQuest.IsRunning()
		debug.trace("WAIT FOR INIT:" + i )
		i = i + 1
	endwhile
	
	bac__quest_helper_crowdScene.start()
	
	
	debug.trace("BACCrowd::current state1"+qActors)
	qActors = new Actor[16]
	debug.trace("BACCrowd::current state2"+qActors)
	i = 0
	
	while i < 16
		debug.trace("reset actor:"+i+" Pers0"+i)
		qActors[i] = None
		ReferenceAlias ref
		if i < 10
			ref = thisQuest.getAliasByName("Pers0"+i) as ReferenceAlias
		else
			ref = thisQuest.getAliasByName("Pers"+i) as ReferenceAlias
		endif
		
		if ref!=None
			ref.ForceRefTo(emptyFill)
		endif
		i = i + 1
	endwhile
	debug.trace("BACCrowd::current state3"+qActors)

endFunction

function stopCrowd()
qActors = new Actor[16]
bac__quest_helper_crowdScene.stop()
thisQuest.stop()
qActors = new Actor[16]
endFunction

function removeFromCrowd(Actor akActor)
		int i = 0
		while i < 16
		
			if akActor == qActors[i] as Actor

				ReferenceAlias ref 
				if i < 10
					ref = thisQuest.getAliasByName("Pers0"+i) as ReferenceAlias
				else
					ref = thisQuest.getAliasByName("Pers"+i) as ReferenceAlias
				endif
				ref.ForceRefTo(emptyFill)
				qActors[i] = None
			endif
			
			i = i + 1
		endwhile
endFunction

function addToCrowd(Actor akActor)

	if qActors.length<5
	initAll()
	endif

	;bac__quest_helper_crowdScene.stop()
	debug.trace("adding "+akActor)
	debug.trace(qActors)
	if (qActors.Find(akActor) < 0)
		int i = 0
		while i < 16
		debug.trace("loop "+i+" around qActors")
			if qActors[i] ==None
				debug.trace("Try to add to actors list")
				qActors[i] = akActor
				debug.trace(qActors)
				ReferenceAlias ref 
				
				if i < 10
					ref = thisQuest.getAliasByName("Pers0"+i) as ReferenceAlias
				else
					ref = thisQuest.getAliasByName("Pers"+i) as ReferenceAlias
				endif
				
				debug.trace("CURRENT ALIAS GET REF"+ref.getReference())
				debug.trace("CURRENT ACTOR GET REF"+akActor)
				ref.ForceRefTo(akActor as Actor)
				actor akActorActor = akActor as Actor
				akActorActor.SetLookAt(Game.GetPlayer())
				
				debug.trace("ALIAS GET REF for PERS0"+i+" - "+ref.getReference())
				
				;bac__quest_helper_crowdScene.start()
				return


				
				
			endif
		i = i + 1
		endwhile
	endIf
	;bac__quest_helper_crowdScene.start()
	debug.trace(qActors)
endFunction