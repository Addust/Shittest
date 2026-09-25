/obj/item/grenade/spawnergrenade
	desc = "It will unleash an unspecified anomaly in the surrounding vicinity."
	name = "delivery grenade"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "delivery"
	item_state = "flashbang"
	var/spawner_type = null // must be an object path
	var/deliveryamt = 1 // amount of type to deliver
	var/flash = TRUE //flash on detonation?

/obj/item/grenade/spawnergrenade/prime()// Prime now just handles the two loops that query for people in lockers and people who can see it.
	. = ..()
	update_mob()
	if(spawner_type && deliveryamt)
		// Make a quick flash
		var/turf/T = get_turf(src)
		playsound(T, 'sound/effects/phasein.ogg', 100, TRUE)
		if(flash)
			for(var/mob/living/carbon/C in viewers(T, null))
				C.flash_act()

		// Spawn some hostile syndicate critters and spread them out
		var/list/spawned = spawn_and_random_walk(spawner_type, T, deliveryamt, walk_chance=50, admin_spawn=((flags_1 & ADMIN_SPAWNED_1) ? TRUE : FALSE))
		afterspawn(spawned)

	resolve()

/obj/item/grenade/spawnergrenade/proc/afterspawn(list/mob/spawned)
	return

/obj/item/grenade/spawnergrenade/manhacks
	name = "viscerator delivery grenade"
	desc = "An armoured plasteel case used to transport and deploy viscerator drones during the ICW. A faded warning reads 'WILL NOT AUTOMATICALLY RECOGNISE DEPLOYING OPERATOR'S IFF - VERIFY SETTINGS BEFORE DEPLOYING'."
	spawner_type = /mob/living/simple_animal/hostile/viscerator
	deliveryamt = 10

/obj/item/grenade/spawnergrenade/spesscarp
	name = "carp delivery grenade"
	spawner_type = /mob/living/simple_animal/hostile/carp
	deliveryamt = 5

/obj/item/grenade/spawnergrenade/syndiesoap
	name = "Mister Scrubby"
	spawner_type = /obj/item/soap/syndie

/obj/item/grenade/spawnergrenade/buzzkill
	name = "Buzzkill grenade"
	desc = "The label reads: \"WARNING: DEVICE WILL RELEASE LIVE SPECIMENS UPON ACTIVATION. SEAL SUIT BEFORE USE.\" It is warm to the touch and vibrates faintly."
	icon_state = "holy_grenade"
	spawner_type = /mob/living/simple_animal/hostile/poison/bees/toxin
	deliveryamt = 10

/obj/item/grenade/spawnergrenade/quadrotor
	name = "inactive vigilitas drone"
	w_class = WEIGHT_CLASS_NORMAL //if these ever become non-ruin-accessible and have faction iff i dont want to see them used to rush shit TOO much. should still fit in faction rigs but theyre limited in capacity and you usually put mags and more useful nades in there
	det_time = 3 SECONDS
	throw_range = 6 //shorter than regular nades
	flash = FALSE
	desc = "An inactive, ICW-era drone painted in Vigilitas colours, an electroplasma gun folded under it. Given its age, you doubt it will recognise post-war IFF codes..."
	icon_state = "quadrotor_warra"
	spawner_type = /mob/living/simple_animal/hostile/automated/quadrotor/makosso
	deliveryamt = 1

/obj/item/grenade/spawnergrenade/quadrotor/coalition
	name = "inactive malfunctioning Y-09-CS comabt drone"
	desc = "An inactive, ICW-era combat drone painted in Coalition colours. Given its age, you doubt it will recognise modern IFF codes..."
	icon_state = "quadrotor_coalition"
	spawner_type = /mob/living/simple_animal/hostile/automated/quadrotor/cybersun

/obj/item/grenade/spawnergrenade/quadrotor/coalition/cybersun
	name = "inactive Y-09-CS comabt drone"
	desc = "An inactive, ICW-era combat drone painted in Coalition colours. This one seems to be in good condition, and Cybersun markings on the back point you to whose IFF it will accept."
	spawner_type = /mob/living/simple_animal/hostile/automated/quadrotor/cybersun/friendly

/obj/item/grenade/spawnergrenade/quadrotor/coalition/ramzi
	name = "inactive Y-10-RC comabt drone"
	desc = "An inactive, post-ICW combat drone painted in Coalition colours. Ramzi Clique markings and the underslung receiver of a Cottonmouth pistol point you to how it will act if turned on, though it seems stable at the moment."
	spawner_type = /mob/living/simple_animal/hostile/automated/quadrotor/cybersun/ramzi
