Scriptname bac_utilities extends Quest  

import MiscUtil
import MfgConsoleFunc

bac_config Property BACConfig Auto

function log(String Context, String Msg, int level = 2, bool showAlways = false)

	logOutput(Context+" - "+Msg,level, showAlways)

endFunction

function logOutput(String Msg, int level = 2, bool showAlways = false)
	
	if BACConfig.showConsoleOutput == true || showAlways == true
		PrintConsole("BAC: "+ Msg)
	endIf
	
	if BACConfig.showTraceOutput == true || showAlways == true
		debug.trace("BAC: "+ Msg)
	endIf
endFunction