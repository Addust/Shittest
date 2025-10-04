//USE THIS FILE FOR MISCELLANEOUS CODE ADDITIONS FOR SHIPS, IF YOU HAVE A LOT OF CODE CHANGES, MAKE A DEDICATED FILE
//LABEL ALL SECTIONS WITH THE NAME OF THE SHIP


////////
//JUNKER
////////
/obj/machinery/power/port_gen/pacman/super/not_very
	name = "inefficient radioisotope generator"
	icon_state = "portgen1_0"
	base_icon = "portgen1"
	circuit = /obj/item/circuitboard/machine/pacman/super/not_very
	sheet_path = /obj/item/stack/sheet/mineral/uranium
	power_gen = 2500
	time_per_sheet = 85

/obj/item/circuitboard/machine/pacman/super/not_very
	name = "Inefficient Radioisotope Generator (Machine Board)"
	icon_state = "engineering"
	build_path = /obj/machinery/power/port_gen/pacman/super/not_very

/obj/structure/salvageable/protolathe/reployer
	name = "reployer"
	desc = "It's just a reployer. This one appears to be broken"

/obj/machinery/reployer
	name = "reployer"
	desc = "It's just a reployer."
	icon = 'icons/obj/salvage_structure.dmi'
	icon_state = "wreck_protolathe"

/obj/item/circuitboard/machine/autolathe/reployer
	name = "Reployer (Machine Board)"
	icon_state= "generic"
	build_path = /obj/machinery/reployer

/turf/open/floor/plating/conf_haz
	initial_gas_mix = "n2=104;TEMP=293.15"

/turf/open/floor/plating/rust/conf_haz
	initial_gas_mix = "n2=104;TEMP=293.15"


//////////////////////
// CLIP-BARD - LOMINOS
//////////////////////

/obj/machinery/air_sensor/ship/lominos/oxy
	id_tag = "lominos_oxygen"

/obj/machinery/air_sensor/ship/lominos/nitro
	id_tag = "lominos_nitrogen"

/obj/machinery/air_sensor/ship/lominos/fuelmix
	id_tag = "lominos_fuel_mix"

/obj/machinery/air_sensor/ship/lominos/external
	id_tag = "lominos_external"

/obj/machinery/air_sensor/ship/lominos/harvesting
	id_tag = "lominos_harvesting"

/obj/machinery/computer/atmos_control/ship/lominos
	sensors = list(
		"lominos_oxygen" = "Oxygen Chamber",
		"lominos_nitrogen" = "Nitrogen Chamber",
		"lominos_fuel_mix" = "Fuel Mix Chamber",
		"lominos_external" = "External Air",
		"lominos_harvesting" = "Air Harvesting Chamber",
	)
