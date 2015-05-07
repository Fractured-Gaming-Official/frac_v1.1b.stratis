// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: briefing.sqf

if (!hasInterface) exitWith {};

waitUntil {!isNull player};

player createDiarySubject ["infos", "Infos and Help"];
player createDiarySubject ["changelog", "Changelog"];
player createDiarySubject ["credits", "Credits"];
player createDiarySubject ["admins", "Admin List"];

player createDiaryRecord ["changelog",
[
"v1.1",
"
<br/>[Added] Beacon Detector
<br/>[Changed] Weather Effects
<br/>[Changed] Teammate Icon Size
<br/>[Added] Beacon Detector
<br/>[Changed] Settings on Airdrop
<br/>[Added] More Structures
<br/>[Changed] Stores across map 
<br/>[Added] Bank Money to Spectator for admins
<br/>[Changed] Airdrop Prices
<br/>[Changed] Store Prices
<br/>[Added] Limited Thermals
<br/>[Fixed] TeamKiller Glitch
<br/>[Updated] Mission Boxes
<br/>[Added] New Airdrop System
<br/>[Removed] Airdrop 
<br/>[Added] 3D Markers
<br/>[Fixed] Corpse ejection from non-destroyed vehicles
<br/>[Added] Temp fix for negative wallet glitch
<br/>[Removed] Unused Functions
<br/>[Added] GID structured to map
<br/>[Changed] Mission weight for diving missions
<br/>[Fixed] Briefing
<br/>[Changed] Admin List
<br/>[Added] Masks for Toxic Gas. Shemag=Lesser effect / Pilot helmet=0 effect.
<br/>[Added] Toxic Gas (yellow smoke now kills within radius)
<br/>[Removed] Some Plane and helicopters from stores.
<br/>[Added] Old disabled missions
<br/>[Added] Road Block Mission
<br/>[Added] Sniper Nest Mission
<br/>[Added] HVT Mission (steals from bank accounts of online players)
<br/>[Changed] HUD to Status bar
<br/>[Added] Fast Roping
<br/>[Added] More UAV_Control (group only)
<br/>[Added] Mag Repacker
<br/>[Changed] Texture sizes to lower PBO size
<br/>[Removed] Original Welcome Screen
<br/>[Added] Server Credits as welcome message
<br/>[Added] Sting SMG as starting weapon
<br/>[Removed] Tron Suits from store
<br/>[Changed] Starting Backpack
<br/>[Added] GeoCache Mission 
<br/>[Added] Teleport Player to me for admins
<br/>[Added] Teleport to player for admins
<br/>[Removed] Player Markers from admins 
<br/>[Added] Air Drops
<br/>[Fixed] Player Gear Being removed after restart
<br/>[Updated] Antihack
<br/>[Changed] Only admins can use global voice
<br/>[Added] More UAV_Control (group only)
<br/>[Fixed] Warchest Duping glitch
<br/>[Changed] Made Clean up More aggressive (10min)
<br/>[Changed] Weapon Crate Loadouts. TWS, Nightstalker, OP items moved to them.
<br/>[Added] Vehicles stay locked after restart
<br/>[Added]1.42 patch update
<br/>[Added] ATMs
<br/>[Added] Union Jack vehicle color
<br/>[Added] Skins hidden in gamefiles for MH-9, Mohawk, and Taru
<br/>[Added] Improved admin spectate camera by micovery
<br/>[Added] Earplugs (End key)
<br/>[Changed] Full rewrite of vehicle respawning system
<br/>[Fixed] Player moved to position too early during save restore
<br/>[Fixed] Mission timeout not extending on AI kill
<br/>[Fixed] Admin teamkill unlocking
<br/>[Fixed] Improved FPS fix
<br/>[Fixed] Running animation parachute glitch
<br/>[Fixed] Various other minor bugfixes and optimizations
"
]];

player createDiaryRecord ["changelog",
[
"v1.0c",
"
<br/>[Added] MySQL support via extDB extension
<br/>[Added] Town Invasion mission
<br/>[Added] Chain-reaction player kill tracking
<br/>[Added] Force Save action for purchased and captured vehicles
<br/>[Added] Autokick players previously detected by antihack
<br/>[Added] Entity caching script for headless client
<br/>[Added] Tron suits to general store
<br/>[Added] Red lines on map for AIs wandering away from missions
<br/>[Changed] Mission timeout gets extended on AI kill
<br/>[Changed] Transport Heli mission Taru variant to Bench
<br/>[Changed] Spawn beacon item drop to sleeping bag
<br/>[Fixed] More money exploits
<br/>[Fixed] Scoreboard ordering
<br/>[Fixed] Vehicle repair & refuel sometimes not working
<br/>[Fixed] Injured players' corpses being deleted on disconnect
<br/>[Fixed] Static weapon disassembly prevention
<br/>[Fixed] Excess bought rockets ending up in uniform or vest
<br/>[Fixed] Various other minor bugfixes and optimizations
"
]];

player createDiaryRecord ["credits",
[
"Credits",
"
<br/><font size='16' color='#BBBBBB'>Developed by A3Wasteland.com:</font>
<br/>	* AgentRev (TeamPlayerGaming)
<br/>	* JoSchaap (GoT/Tweakers.net)
<br/>	* MercyfulFate
<br/>	* His_Shadow (KoS/KillonSight)
<br/>	* Bewilderbeest (KoS/KillonSight)
<br/>	* Torndeco
<br/>	* Del1te (404Games)
<br/>
<br/><font size='16' color='#BBBBBB'>Original Arma 2 Wasteland missions by:</font>
<br/>	* Tonic
<br/>	* Sa-Matra
<br/>	* MarKeR
<br/>
<br/><font size='16' color='#BBBBBB'>Improved and ported to Arma 3 by 404Games:</font>
<br/>	* Deadbeat
<br/>	* Costlyy
<br/>	* Pulse
<br/>	* Domuk
<br/>
<br/><font size='16' color='#BBBBBB'>Other contributors:</font>
<br/>	* 82ndab-Bravo17 (GitHub)
<br/>	* afroVoodo (Armaholic)
<br/>	* Austerror (GitHub)
<br/>	* AWA (OpenDayZ)
<br/>	* bodybag (Gameaholic.se)
<br/>	* code34 (iniDBI)
<br/>	* Das Attorney (Jump MF)
<br/>	* Ed! (404Games forums)
<br/>	* Farooq (GitHub)
<br/>	* HatchetHarry (GitHub)
<br/>	* Hub (TeamPlayerGaming)
<br/>	* k4n30 (GitHub)
<br/>	* Krunch (GitHub)
<br/>	* madbull (R3F)
<br/>	* Mainfrezzer (Magnon)
<br/>	* meat147 (GitHub)
<br/>	* micovery (GitHub)
<br/>	* Na_Palm (BIS forums)
<br/>	* red281gt (GitHub)
<br/>	* RockHound (BierAG)
<br/>	* s3kShUn61 (GitHub)
<br/>	* Sa-Matra (BIS forums)
<br/>	* Sanjo (GitHub)
<br/>	* SCETheFuzz (GitHub)
<br/>	* Shockwave (A3W forums)
<br/>	* SicSemperTyrannis (iniDB)
<br/>	* SPJESTER (404Games forums)
<br/>	* spunFIN (BIS forums)
<br/>	* Tonic (BIS forums)
<br/>	* wiking.at (A3W forums)
<br/>	* Zenophon (BIS Forums)
<br/>
<br/><font size='16'>Thanks A LOT to everyone involved for the help and inspiration!</font>
"
]];


player createDiaryRecord ["infos",
[
"Hints and Tips",
"
<br/><font size='18'>A3Wasteland</font>
<br/>
<br/>* At the start of the game, spread out and find supplies before worrying about where to establish a meeting place or a base, supplies are important and very valuable.
<br/>
<br/>* When picking a base location, it is best advised to pick a place that is out of the way and not so obvious such as airports, cities, map-bound bases, etc. remember, players randomly spawn in and around towns and could even spawn inside your base should you set it up in a town.
<br/>
<br/>* If you spawn in an area with no vehicles or supplies in the immediate area, DO NOT just click respawn from the pause menu, chances are if you search an area of a few hundred meters, you will find something.
<br/>
<br/>* Always be on the lookout for nightvision. they are located in the ammo crates, and there are pairs scattered throughout vehicles. You can also purchase them from the gunstores. Nighttime without them SUCKS, and if you have them, you can conduct stealth raids on enemy bases under the cover of complete darkness.
<br/>
<br/>* When you set up a base, never leave your supplies unguarded, one guard will suffice, but it is recommended you have at least 2, maybe 3 guards at base at all times.
<br/>
<br/>* There are very aggressive AI characters that spawn with most missions and will protect the mission objectives with deadly force, be aware of them.
"
]];

player createDiaryRecord ["admins",
[
"Admin List",
"
<br/><font color='#00FFEF' size='18'>Super Admins</font>
<br/> * Mokey
<br/> * Archangel
<br/> * Lenymo
<br/> * Korimer
<br/> * TexasOutlaw
<br/> * BadColonel
<br/> * KroNiC
<br/> * Huskey622
<br/> * Ghostyy
<br/> * Blinkky
<br/>
<br/><font color='#0066FF' size='18'>High Admins</font>
<br/> * Droid
<br/> * M4GHOST45
<br/>
<br/><font color='#002FFF' size='18'>Low Admins</font>
<br/>

"
]];