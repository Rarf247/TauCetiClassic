/mob/living/carbon/slime/death(gibbed)
	if(stat == DEAD)
		return
	stat = DEAD
	icon_state = "[colour] baby slime dead"
	overlays.len = 0

	if(!gibbed)
		if(istype(src, /mob/living/carbon/slime/adult))
			ghostize(bancheck = TRUE)
			var/mob/living/carbon/slime/M1 = new primarytype(loc)
			M1.rabid = 1
			var/mob/living/carbon/slime/M2 = new primarytype(loc)
			M2.rabid = 1
			M1.regenerate_icons()
			M2.regenerate_icons()
			if(src)
				qdel(src)
		else
			for(var/mob/O in viewers(src, null))
				O.show_message("<b>The [name]</b> seizes up and falls limp...", 1) //ded -- Urist

	update_canmove()

	ticker.mode.check_win()

	return ..(gibbed)