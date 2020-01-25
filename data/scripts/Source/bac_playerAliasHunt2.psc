Scriptname bac_playerAliasHunt2 extends ReferenceAlias  

ReferenceAlias Property h_bacHunt001 Auto
ReferenceAlias Property h_bacHunt002 Auto
ReferenceAlias Property h_bacHunt003 Auto
ReferenceAlias Property h_bacHunt004 Auto
ReferenceAlias Property h_bacHunt005 Auto

;Quest Property bac_hunt_capture Auto

bac_config property bacconfig Auto
bac_tears_c property unownctrl auto


EVENT OnHit(ObjectReference akAggressor, Form akSource, Projectile akProj, Bool b1, Bool b2, Bool b3, Bool b4)

	quest q = self.GetOwningQuest()
	actor aRef = self.GetActorReference()     
	actorBase AB = aRef.GetActorBase()
	
 ;      thisQuest.stop()
;	 bac_hunt_capture.start()
	if q.getStage()<10 || q.getStage()>30
		return
	endif

	if akAggressor as Actor == h_bacHunt001.getActorReference() || akAggressor as Actor == h_bacHunt002.getActorReference()  || akAggressor as Actor == h_bacHunt003.getActorReference() || akAggressor as Actor == h_bacHunt004.getActorReference()  || akAggressor as Actor == h_bacHunt005.getActorReference() 
		Float fPlayerHealth = aRef.GetActorValue("Health")

 Float CurrentHealth = aRef.GetActorValue( "health")
  Float BaseHealth = aRef.GetBaseActorValue( "health")
 
  Float HealthPercent = (CurrentHealth / BaseHealth) * 100


;debug.notification(fPlayerHealth +" / "+ HealthPercent )
		if fPlayerHealth <=85 || HealthPercent < bacconfig.hpTriggerHit
   		      aRef.SetActorValue("Health",250)
;			if bac_hunt_capture.isStarting()==false && bac_hunt_capture.isRunning()==false
				 aRef.SetActorValue("Health",250)
					unownctrl.initCapturedCow()
   		      aRef.SetActorValue("Health",250)

;			endif
		endif
		
	endif
  
ENDEVENT