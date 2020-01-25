Scriptname bac_playerAliasHunt extends ReferenceAlias  

ReferenceAlias Property h_bacHunt001 Auto
ReferenceAlias Property h_bacHunt002 Auto
ReferenceAlias Property h_bacHunt003 Auto

;Quest Property bac_hunt_capture Auto

bool property stop auto
bac_unowned property unownctrl auto
bac_config Property bacconfig auto

EVENT OnHit(ObjectReference akAggressor, Form akSource, Projectile akProj, Bool b1, Bool b2, Bool b3, Bool b4)

debug.trace("paral:"+Game.getPlayer().GetActorValue("Paralysis"))
 if stop == true
   return
  endif

	quest q = self.GetOwningQuest()
	actor aRef = self.GetActorReference()     
	actorBase AB = aRef.GetActorBase()
	
 ;      thisQuest.stop() 
;	 bac_hunt_capture.start()
	if q.getStage()<20 || q.getStage()>40
		return
	endif

	if akAggressor as Actor == h_bacHunt001.getActorReference() || akAggressor as Actor == h_bacHunt002.getActorReference()  || akAggressor as Actor == h_bacHunt003.getActorReference() 
		Float fPlayerHealth = aRef.GetActorValue("Health")
Float CurrentHealth = aRef.GetActorValue( "health")
  Float BaseHealth = aRef.GetBaseActorValue( "health")
 
  Float HealthPercent = (CurrentHealth / BaseHealth) * 100

		if fPlayerHealth <=50 || HealthPercent  < bacconfig.hpTriggerHit
		stop = true
   		      aRef.SetActorValue("Health",250)
;			if bac_hunt_capture.isStarting()==false && bac_hunt_capture.isRunning()==false
				 aRef.SetActorValue("Health",250)				 
					unownctrl.prepareCaptureQuest() 
;			endif
		endif
		
	endif
  
ENDEVENT
