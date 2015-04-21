/* format["Welcome to GamersInc. Wasteland"] hintC
[
	"Try different classes from the lobby ( Insurgent, Sniper, Engineer, Diver, Explosive Specialist)",
	"Bought, Mission and Airdrop vehicles automatically save between restarts.",
	"Base objects will save until unlocked or destroyed.",
	"Vehicle repair or re-arm, speak to the vehicle store owner.",
	"Beacons do NOT save!",
	"Have fun and respect other players. Hacking or exploiting will get you banned :)"
	];
	*/
	
sleep 10;
	
_text = "
<t align='center'><t shadow= 1 shadowColor='#000000'><t size='1.2'><t color='#ff0000'>Fractured Gaming Wasteland Stratis</t></t>
<t align='center'><img size='6' shadow = 0 image='mapConfig\marks.paa'/></t>
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'>Join us on TeamSpeak3: ts.Fractured-Gaming.com</t><br /> 
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'>Visit our website and apply to be a member @ www.fractured-gaming.com</t><br />
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'>Press END for Earplugs</t><br />
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'>Better items can be found in mission crates I.E. Night Stalker, Vests and so on. (Random Chances)</t><br />
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'>Vehicle repair or re-arm, speak to the vehicle store owner.</t><br />
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'>Beacons do NOT save!</t><br />
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'>Have fun and respect other players. Hacking, exploiting, and/or trolling will get you banned</t>
<br />
<t align='right'><img size='4' shadow = 0 image='mapConfig\logo.paa'/></t>

";

hint parseText format ["<t align='center'>Welcome %2</t><br />%1",_text, name player];
 