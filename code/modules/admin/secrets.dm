/datum/admins/proc/Secrets()
	if(!check_rights(0))
		return

	var/list/dat = list("<B>The first rule of adminbuse is: you don't talk about the adminbuse.</B><HR>")

	dat +={"
			<B>General Secrets</B><BR>
			<BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=admin_log'>Admin Log</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=show_admins'>Show Admin List</A><BR>
			<BR>
			"}

	if(check_rights(R_ADMIN,0))
		dat += {"
			<B>Admin Secrets</B><BR>
			<BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=clear_virus'>Cure all diseases currently in existence</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=list_bombers'>Bombing List</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=list_signalers'>Show last [length(GLOB.lastsignalers)] signalers</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=list_lawchanges'>Show last [length(GLOB.lawchanges)] law changes</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=showailaws'>Show AI Laws</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=showgm'>Show Game Mode</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=manifest'>Show Crew Manifest</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=DNA'>List DNA (Blood)</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=fingerprints'>List Fingerprints</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=ctfbutton'>Enable/Disable CTF</A><BR><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=tdomereset'>Reset Thunderdome to default state</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=set_name'>Rename Station Name</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=reset_name'>Reset Station Name</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=night_shift_set'>Set Night Shift Mode</A><BR>
			<BR>
			<B>Shuttles</B><BR>
			<BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=moveferry'>Move Ferry</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=togglearrivals'>Toggle Arrivals Ferry</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=moveminingshuttle'>Move Mining Shuttle</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=movelaborshuttle'>Move Labor Shuttle</A><BR>
			<BR>
			"}

	if(check_rights(R_FUN,0))
		dat += {"
			<B>Fun Secrets</B><BR>
			<BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=monkey'>Turn all humans into monkeys</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=anime'>Chinese Cartoons</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=allspecies'>Change the species of all humans</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=power'>Make all areas powered</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=unpower'>Make all areas unpowered</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=quickpower'>Power all SMES</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=tripleAI'>Triple AI mode (needs to be used in the lobby)</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=traitor_all'>Everyone is the traitor</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=guns'>Summon Guns</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=magic'>Summon Magic</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=events'>Summon Events (Toggle)</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=onlyone'>There can only be one!</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=delayed_onlyone'>There can only be one! (40-second delay)</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=stupidify'>Make all players stupid</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=eagles'>Egalitarian Station Mode</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=ancap'>Anarcho-Capitalist Station Mode</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=blackout'>Break all lights</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=whiteout'>Fix all lights</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=floorlava'>The floor is lava! (DANGEROUS: extremely lame)</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=customportal'>Spawn a custom portal storm</A><BR>
			<BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=changebombcap'>Change bomb cap</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=masspurrbation'>Mass Purrbation</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=massremovepurrbation'>Mass Remove Purrbation</A><BR>
			"}

	dat += "<BR>"

	if(check_rights(R_DEBUG,0))
		dat += {"
			<B>Security Level Elevated</B><BR>
			<BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=maint_access_engiebrig'>Change all maintenance doors to engie/brig access only</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=maint_access_brig'>Change all maintenance doors to brig access only</A><BR>
			<A href='?src=[REF(src)];[HrefToken()];secrets=infinite_sec'>Remove cap on security officers</A><BR>
			<BR>
			"}

	usr << browse(dat.Join(), "window=secrets")
	return





/datum/admins/proc/Secrets_topic(item,href_list)
	var/datum/round_event/E
	var/ok = 0
	switch(item)
		if("admin_log")
			var/dat = "<B>Admin Log<HR></B>"
			for(var/l in GLOB.admin_log)
				dat += "<li>[l]</li>"
			if(!GLOB.admin_log.len)
				dat += "No-one has done anything this round!"
			usr << browse(dat, "window=admin_log")

		if("show_admins")
			var/dat = "<B>Current admins:</B><HR>"
			if(GLOB.admin_datums)
				for(var/ckey in GLOB.admin_datums)
					var/datum/admins/D = GLOB.admin_datums[ckey]
					dat += "[ckey] - [D.rank.name]<br>"
				usr << browse(dat, "window=showadmins;size=600x500")
		if("set_name")
			if(!check_rights(R_ADMIN))
				return
			var/new_name = input(usr, "Please input a new name for the station.", "What?", "") as text|null
			if(!new_name)
				return
			set_station_name(new_name)
			log_admin("[key_name(usr)] renamed the station to \"[new_name]\".")
			message_admins(span_adminnotice("[key_name_admin(usr)] renamed the station to: [new_name]."))
			priority_announce("[command_name()] has renamed the station to \"[new_name]\".")
		if("night_shift_set")
			if(!check_rights(R_ADMIN))
				return
			var/val = alert(usr, "What do you want to set night shift to? This will override the automatic system until set to automatic again.", "Night Shift", "On", "Off", "Automatic")
			switch(val)
				if("Automatic")
					if(CONFIG_GET(flag/enable_night_shifts))
						SSnightshift.can_fire = TRUE
						SSnightshift.fire()
					else
						SSnightshift.update_nightshift(FALSE, TRUE)
				if("On")
					SSnightshift.can_fire = FALSE
					SSnightshift.update_nightshift(TRUE, TRUE)
				if("Off")
					SSnightshift.can_fire = FALSE
					SSnightshift.update_nightshift(FALSE, TRUE)

		if("reset_name")
			if(!check_rights(R_ADMIN))
				return
			var/new_name = new_station_name()
			set_station_name(new_name)
			log_admin("[key_name(usr)] reset the station name.")
			message_admins(span_adminnotice("[key_name_admin(usr)] reset the station name."))
			priority_announce("[command_name()] has renamed the station to \"[new_name]\".")

		if("list_bombers")
			if(!check_rights(R_ADMIN))
				return
			var/dat = "<B>Bombing List</B><HR>"
			for(var/l in GLOB.bombers)
				dat += text("[l]<BR>")
			usr << browse(dat, "window=bombers")

		if("list_signalers")
			if(!check_rights(R_ADMIN))
				return
			var/dat = "<B>Showing last [length(GLOB.lastsignalers)] signalers.</B><HR>"
			for(var/sig in GLOB.lastsignalers)
				dat += "[sig]<BR>"
			usr << browse(dat, "window=lastsignalers;size=800x500")

		if("list_lawchanges")
			if(!check_rights(R_ADMIN))
				return
			var/dat = "<B>Showing last [length(GLOB.lawchanges)] law changes.</B><HR>"
			for(var/sig in GLOB.lawchanges)
				dat += "[sig]<BR>"
			usr << browse(dat, "window=lawchanges;size=800x500")

		if("moveminingshuttle")
			if(!check_rights(R_ADMIN))
				return
			SSblackbox.record_feedback("nested tally", "admin_secrets_fun_used", 1, list("Send Mining Shuttle"))
			if(!SSshuttle.toggleShuttle("mining","mining_home","mining_away"))
				message_admins("[key_name_admin(usr)] moved mining shuttle")
				log_admin("[key_name(usr)] moved the mining shuttle")

		if("movelaborshuttle")
			if(!check_rights(R_ADMIN))
				return
			SSblackbox.record_feedback("nested tally", "admin_secrets_fun_used", 1, list("Send Labor Shuttle"))
			if(!SSshuttle.toggleShuttle("laborcamp","laborcamp_home","laborcamp_away"))
				message_admins("[key_name_admin(usr)] moved labor shuttle")
				log_admin("[key_name(usr)] moved the labor shuttle")

		if("moveferry")
			if(!check_rights(R_ADMIN))
				return
			SSblackbox.record_feedback("nested tally", "admin_secrets_fun_used", 1, list("Send CentCom Ferry"))
			if(!SSshuttle.toggleShuttle("ferry","ferry_home","ferry_away"))
				message_admins("[key_name_admin(usr)] moved the CentCom ferry")
				log_admin("[key_name(usr)] moved the CentCom ferry")

		if("togglearrivals")
			if(!check_rights(R_ADMIN))
				return
			var/obj/docking_port/mobile/arrivals/A = SSshuttle.arrivals
			if(A)
				var/new_perma = !A.perma_docked
				A.perma_docked = new_perma
				SSblackbox.record_feedback("nested tally", "admin_toggle", 1, list("Permadock Arrivals Shuttle", "[new_perma ? "Enabled" : "Disabled"]"))
				message_admins("[key_name_admin(usr)] [new_perma ? "stopped" : "started"] the arrivals shuttle")
				log_admin("[key_name(usr)] [new_perma ? "stopped" : "started"] the arrivals shuttle")
			else
				to_chat(usr, "<span class='admin'>There is no arrivals shuttle.</span>")
		if("showgm")
			if(!check_rights(R_ADMIN))
				return
			if(!SSticker.HasRoundStarted())
				alert("The game hasn't started yet!")
			else if (SSticker.mode)
				alert("The game mode is [SSticker.mode.name]")
			else alert("For some reason there's a SSticker, but not a game mode")
		if("manifest")
			if(!check_rights(R_ADMIN))
				return
			var/dat = "<B>Showing Crew Manifest.</B><HR>"
			dat += "<table cellspacing=5><tr><th>Name</th><th>Position</th></tr>"
			for(var/datum/data/record/t in GLOB.data_core.general)
				dat += "<tr><td>[t.fields["name"]]</td><td>[t.fields["rank"]]</td></tr>"
			dat += "</table>"
			usr << browse(dat, "window=manifest;size=440x410")
		if("DNA")
			if(!check_rights(R_ADMIN))
				return
			var/dat = "<B>Showing DNA from blood.</B><HR>"
			dat += "<table cellspacing=5><tr><th>Name</th><th>DNA</th><th>Blood Type</th></tr>"
			for(var/i in GLOB.human_list)
				var/mob/living/carbon/human/H = i
				if(H.ckey)
					dat += "<tr><td>[H]</td><td>[H.dna.unique_enzymes]</td><td>[H.dna.blood_type]</td></tr>"
			dat += "</table>"
			usr << browse(dat, "window=DNA;size=440x410")
		if("fingerprints")
			if(!check_rights(R_ADMIN))
				return
			var/dat = "<B>Showing Fingerprints.</B><HR>"
			dat += "<table cellspacing=5><tr><th>Name</th><th>Fingerprints</th></tr>"
			for(var/i in GLOB.human_list)
				var/mob/living/carbon/human/H = i
				if(H.ckey)
					dat += "<tr><td>[H]</td><td>[md5(H.dna.uni_identity)]</td></tr>"
			dat += "</table>"
			usr << browse(dat, "window=fingerprints;size=440x410")

		if("monkey")
			if(!check_rights(R_FUN))
				return
			SSblackbox.record_feedback("nested tally", "admin_secrets_fun_used", 1, list("Monkeyize All Humans"))
			for(var/i in GLOB.human_list)
				var/mob/living/carbon/human/H = i
				INVOKE_ASYNC(H, TYPE_PROC_REF(/mob/living/carbon, monkeyize))
			ok = 1

		if("allspecies")
			if(!check_rights(R_FUN))
				return
			var/result = input(usr, "Please choose a new species","Species") as null|anything in GLOB.species_list
			if(result)
				SSblackbox.record_feedback("nested tally", "admin_secrets_fun_used", 1, list("Mass Species Change", "[result]"))
				log_admin("[key_name(usr)] turned all humans into [result]", 1)
				message_admins("\blue [key_name_admin(usr)] turned all humans into [result]")
				var/newtype = GLOB.species_list[result]
				for(var/i in GLOB.human_list)
					var/mob/living/carbon/human/H = i
					H.set_species(newtype)

		if("traitor_all")
			if(!check_rights(R_FUN))
				return
			if(!SSticker.HasRoundStarted())
				alert("The game hasn't started yet!")
				return
			var/objective = copytext(sanitize(input("Enter an objective")),1,MAX_MESSAGE_LEN)
			if(!objective)
				return
			SSblackbox.record_feedback("nested tally", "admin_secrets_fun_used", 1, list("Traitor All", "[objective]"))
			for(var/mob/living/H in GLOB.player_list)
				if(H.stat == DEAD || !H.mind)
					continue
				if(is_special_character(H))
					continue
				var/datum/antagonist/traitor/T = new()
				T.give_objectives = FALSE
				var/datum/objective/new_objective = new
				new_objective.owner = H
				new_objective.explanation_text = objective
				T.add_objective(new_objective)
				H.mind.add_antag_datum(T)
			message_admins(span_adminnotice("[key_name_admin(usr)] used everyone is a traitor secret. Objective is [objective]"))
			log_admin("[key_name(usr)] used everyone is a traitor secret. Objective is [objective]")

		if("changebombcap")
			if(!check_rights(R_FUN))
				return
			SSblackbox.record_feedback("nested tally", "admin_secrets_fun_used", 1, list("Bomb Cap"))

			var/newBombCap = input(usr,"What would you like the new bomb cap to be. (entered as the light damage range (the 3rd number in common (1,2,3) notation)) Must be above 4)", "New Bomb Cap", GLOB.MAX_EX_LIGHT_RANGE) as num|null
			if (!CONFIG_SET(number/bombcap, newBombCap))
				return

			message_admins(span_boldannounce("[key_name_admin(usr)] changed the bomb cap to [GLOB.MAX_EX_DEVESTATION_RANGE], [GLOB.MAX_EX_HEAVY_RANGE], [GLOB.MAX_EX_LIGHT_RANGE]"))
			log_admin("[key_name(usr)] changed the bomb cap to [GLOB.MAX_EX_DEVESTATION_RANGE], [GLOB.MAX_EX_HEAVY_RANGE], [GLOB.MAX_EX_LIGHT_RANGE]")

		if("blackout")
			if(!check_rights(R_FUN))
				return
			SSblackbox.record_feedback("nested tally", "admin_secrets_fun_used", 1, list("Break All Lights"))
			message_admins("[key_name_admin(usr)] broke all lights")
			for(var/obj/machinery/light/L in GLOB.machines)
				L.break_light_tube()

		if("anime")
			if(!check_rights(R_FUN))
				return
			var/animetype = alert("Would you like to have the clothes be changed?",,"Yes","No","Cancel")

			var/droptype
			if(animetype =="Yes")
				droptype = alert("Make the uniforms Nodrop?",,"Yes","No","Cancel")

			if(animetype == "Cancel" || droptype == "Cancel")
				return
			SSblackbox.record_feedback("nested tally", "admin_secrets_fun_used", 1, list("Chinese Cartoons"))
			message_admins("[key_name_admin(usr)] made everything kawaii.")
			for(var/i in GLOB.human_list)
				var/mob/living/carbon/human/H = i
				SEND_SOUND(H, sound('sound/blank.ogg'))

				if(H.dna.species.id == "human" || H.dna.species.id == "humen")
					if(H.dna.features["tail_human"] == "None" || H.dna.features["ears"] == "None")
						var/obj/item/organ/ears/cat/ears = new
						var/obj/item/organ/tail/cat/tail = new
						ears.Insert(H, drop_if_replaced=FALSE)
						tail.Insert(H, drop_if_replaced=FALSE)
					var/list/honorifics = list("[MALE]" = list("kun"), "[FEMALE]" = list("chan","tan"), "[NEUTER]" = list("san"), "[PLURAL]" = list("san")) //John Robust -> Robust-kun
					var/list/names = splittext(H.real_name," ")
					var/forename = names.len > 1 ? names[2] : names[1]
					var/newname = "[forename]-[pick(honorifics["[H.gender]"])]"
					H.fully_replace_character_name(H.real_name,newname)
					if(animetype == "Yes")
						var/seifuku = pick(typesof(/obj/item/clothing/under/costume/schoolgirl))
						var/obj/item/clothing/under/costume/schoolgirl/I = new seifuku
						var/olduniform = H.wear_pants
						H.temporarilyRemoveItemFromInventory(H.wear_pants, TRUE, FALSE)
						H.equip_to_slot_or_del(I, SLOT_PANTS)
						qdel(olduniform)
						if(droptype == "Yes")
							ADD_TRAIT(I, TRAIT_NODROP, ADMIN_TRAIT)
				else
					to_chat(H, span_warning("You're not kawaii enough for this!"))

		if("whiteout")
			if(!check_rights(R_FUN))
				return
			SSblackbox.record_feedback("nested tally", "admin_secrets_fun_used", 1, list("Fix All Lights"))
			message_admins("[key_name_admin(usr)] fixed all lights")
			for(var/obj/machinery/light/L in GLOB.machines)
				L.fix()

		if("floorlava")
			SSweather.run_weather(/datum/weather/floor_is_lava)

		if("retardify")
			if(!check_rights(R_FUN))
				return
			SSblackbox.record_feedback("nested tally", "admin_secrets_fun_used", 1, list("Mass Braindamage"))
			for(var/mob/living/carbon/human/H in GLOB.player_list)
				to_chat(H, span_boldannounce("I suddenly feel stupid."))
				H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 60, 80)
			message_admins("[key_name_admin(usr)] made everybody retarded")

		if("ancap")
			if(!check_rights(R_FUN))
				return
			SSblackbox.record_feedback("nested tally", "admin_secrets_fun_used", 1, list("Anarcho-capitalist Station"))
			SSeconomy.full_ancap = !SSeconomy.full_ancap
			message_admins("[key_name_admin(usr)] toggled Anarcho-capitalist mode")
			if(SSeconomy.full_ancap)
				priority_announce("The NAP is now in full effect.", null, 'sound/blank.ogg')
			else
				priority_announce("The NAP has been revoked.", null, 'sound/blank.ogg')

		if("dorf")
			if(!check_rights(R_FUN))
				return
			SSblackbox.record_feedback("nested tally", "admin_secrets_fun_used", 1, list("Dwarf Beards"))
			for(var/i in GLOB.human_list)
				var/mob/living/carbon/human/B = i
				B.facial_hairstyle = "Dward Beard"
				B.update_hair()
			message_admins("[key_name_admin(usr)] activated dorf mode")
		if("masspurrbation")
			if(!check_rights(R_FUN))
				return
			mass_purrbation()
			message_admins("[key_name_admin(usr)] has put everyone on \
				purrbation!")
			log_admin("[key_name(usr)] has put everyone on purrbation.")
		if("massremovepurrbation")
			if(!check_rights(R_FUN))
				return
			mass_remove_purrbation()
			message_admins("[key_name_admin(usr)] has removed everyone from \
				purrbation.")
			log_admin("[key_name(usr)] has removed everyone from purrbation.")

	if(E)
		E.processing = FALSE
		if(E.announceWhen>0)
			switch(alert(usr, "Would you like to alert the crew?", "Alert", "Yes", "No", "Cancel"))
				if("Yes")
					E.announceChance = 100
				if("Cancel")
					E.kill()
					return
				if("No")
					E.announceChance = 0
		E.processing = TRUE
	if (usr)
		log_admin("[key_name(usr)] used secret [item]")
		if (ok)
			to_chat(world, text("<B>A secret has been activated by []!</B>", usr.key))

/proc/portalAnnounce(announcement, playlightning)
	set waitfor = 0
	if (playlightning)
		sound_to_playing_players('sound/blank.ogg')
		sleep(80)
	priority_announce(replacetext(announcement, "%STATION%", station_name()))
	if (playlightning)
		sleep(20)
		sound_to_playing_players('sound/blank.ogg')

/proc/doPortalSpawn(turf/loc, mobtype, numtospawn, portal_appearance, players, humanoutfit)
	for (var/i in 1 to numtospawn)
		var/mob/spawnedMob = new mobtype(loc)
		if (length(players))
			var/mob/chosen = players[1]
			if (chosen.client)
				chosen.client.prefs.copy_to(spawnedMob)
				spawnedMob.key = chosen.key
			players -= chosen
		if (ishuman(spawnedMob) && ispath(humanoutfit, /datum/outfit))
			var/mob/living/carbon/human/H = spawnedMob
			H.equipOutfit(humanoutfit)
	var/turf/T = get_step(loc, SOUTHWEST)
	flick_overlay_static(portal_appearance, T, 15)
	playsound(T, 'sound/blank.ogg', rand(80, 100), TRUE)
