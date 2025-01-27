/obj/item/storage/lockbox
	name = "lockbox"
	desc = ""
	icon_state = "lockbox+l"
	item_state = "syringe_kit"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	req_access = list(ACCESS_ARMORY)
	var/broken = FALSE
	var/open = FALSE
	var/icon_locked = "lockbox+l"
	var/icon_closed = "lockbox"
	var/icon_broken = "lockbox+b"

/obj/item/storage/lockbox/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_combined_w_class = 14
	STR.max_items = 4
	STR.locked = TRUE

/obj/item/storage/lockbox/attackby(obj/item/W, mob/user, params)
	locked = SEND_SIGNAL(src, COMSIG_IS_STORAGE_LOCKED)
	if(W.GetID())
		if(broken)
			to_chat(user, span_danger("It appears to be broken."))
			return
		if(allowed(user))
			SEND_SIGNAL(src, COMSIG_TRY_STORAGE_SET_LOCKSTATE, !locked)
			locked = SEND_SIGNAL(src, COMSIG_IS_STORAGE_LOCKED)
			if(locked)
				icon_state = icon_locked
				to_chat(user, span_danger("I lock the [src.name]!"))
				SEND_SIGNAL(src, COMSIG_TRY_STORAGE_HIDE_ALL)
				return
			else
				icon_state = icon_closed
				to_chat(user, span_danger("I unlock the [src.name]!"))
				return
		else
			to_chat(user, span_danger("Access Denied."))
			return
	if(!locked)
		return ..()
	else
		to_chat(user, span_danger("It's locked!"))

/obj/item/storage/lockbox/emag_act(mob/user)
	if(!broken)
		broken = TRUE
		SEND_SIGNAL(src, COMSIG_TRY_STORAGE_SET_LOCKSTATE, FALSE)
		desc += "It appears to be broken."
		icon_state = src.icon_broken
		if(user)
			visible_message(span_warning("\The [src] has been broken by [user] with an electromagnetic card!"))
			return

/obj/item/storage/lockbox/Entered()
	. = ..()
	open = TRUE
	update_icon()

/obj/item/storage/lockbox/Exited()
	. = ..()
	open = TRUE
	update_icon()

/obj/item/storage/lockbox/clusterbang
	name = "lockbox of clusterbangs"
	desc = ""
	req_access = list(ACCESS_SECURITY)

/obj/item/storage/lockbox/clusterbang/PopulateContents()
	new /obj/item/grenade/clusterbuster(src)

/obj/item/storage/lockbox/medal
	name = "medal box"
	desc = ""
	icon_state = "medalbox+l"
	item_state = "syringe_kit"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	req_access = list(ACCESS_CAPTAIN)
	icon_locked = "medalbox+l"
	icon_closed = "medalbox"
	icon_broken = "medalbox+b"

/obj/item/storage/lockbox/medal/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_SMALL
	STR.max_items = 10
	STR.max_combined_w_class = 20
	STR.set_holdable(list(/obj/item/clothing/accessory/medal))

/obj/item/storage/lockbox/medal/examine(mob/user)
	. = ..()
	if(!SEND_SIGNAL(src, COMSIG_IS_STORAGE_LOCKED))
		. += span_notice("Alt-click to [open ? "close":"open"] it.")

/obj/item/storage/lockbox/medal/AltClick(mob/user)
	if(user.canUseTopic(src, BE_CLOSE))
		if(!SEND_SIGNAL(src, COMSIG_IS_STORAGE_LOCKED))
			open = (open ? FALSE : TRUE)
			update_icon()
		..()

/obj/item/storage/lockbox/medal/PopulateContents()
	new /obj/item/clothing/accessory/medal/gold/captain(src)
	new /obj/item/clothing/accessory/medal/silver/valor(src)
	new /obj/item/clothing/accessory/medal/silver/valor(src)
	new /obj/item/clothing/accessory/medal/silver/security(src)
	new /obj/item/clothing/accessory/medal/bronze_heart(src)
	new /obj/item/clothing/accessory/medal/plasma/nobel_science(src)
	new /obj/item/clothing/accessory/medal/plasma/nobel_science(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/accessory/medal/conduct(src)

/obj/item/storage/lockbox/medal/update_icon()
	cut_overlays()
	locked = SEND_SIGNAL(src, COMSIG_IS_STORAGE_LOCKED)
	if(locked)
		icon_state = "medalbox+l"
		open = FALSE
	else
		icon_state = "medalbox"
		if(open)
			icon_state += "open"
		if(broken)
			icon_state += "+b"
		if(contents && open)
			for (var/i in 1 to contents.len)
				var/obj/item/clothing/accessory/medal/M = contents[i]
				var/mutable_appearance/medalicon = mutable_appearance(initial(icon), M.medaltype)
				if(i > 1 && i <= 5)
					medalicon.pixel_x += ((i-1)*3)
				else if(i > 5)
					medalicon.pixel_y -= 7
					medalicon.pixel_x -= 2
					medalicon.pixel_x += ((i-6)*3)
				add_overlay(medalicon)

/obj/item/storage/lockbox/medal/sec
	name = "security medal box"
	desc = ""
	req_access = list(ACCESS_HOS)

/obj/item/storage/lockbox/medal/sec/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/clothing/accessory/medal/silver/security(src)

/obj/item/storage/lockbox/medal/cargo
	name = "cargo award box"
	desc = ""
	req_access = list(ACCESS_QM)

/obj/item/storage/lockbox/medal/cargo/PopulateContents()
		new /obj/item/clothing/accessory/medal/ribbon/cargo(src)

/obj/item/storage/lockbox/medal/service
	name = "service award box"
	desc = ""
	req_access = list(ACCESS_HOP)

/obj/item/storage/lockbox/medal/service/PopulateContents()
		new /obj/item/clothing/accessory/medal/silver/excellence(src)

/obj/item/storage/lockbox/medal/sci
	name = "science medal box"
	desc = ""
	req_access = list(ACCESS_RD)

/obj/item/storage/lockbox/medal/sci/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/clothing/accessory/medal/plasma/nobel_science(src)
