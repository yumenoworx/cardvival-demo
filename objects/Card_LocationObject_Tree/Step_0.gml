if global.location == "forest"
{
	visible = true;
	if place_meeting(self.x, self.y, Card_Tool_Axe) 
	and hp == 100 
	and !Card_Tool_Axe.dragging
	{
		audio_play_sound(choose(Axe_Kick_1, Axe_Kick_2, Axe_Kick_3, Axe_Kick_4, Axe_Kick_5), 0, false)
		hp -= Card_Tool_Axe.str;
		first_damage = true;
		return;
	}
	else if place_meeting(self.x, self.y, Card_Tool_Axe) 
	and place_meeting(mouse_x, mouse_y, Card_Tool_Axe) 
	and mouse_check_button_released(mb_left)
	and self.hp > 0
	{
		hp -= Card_Tool_Axe.str;
		audio_stop_sound(Axe_Kick_1);
		audio_stop_sound(Axe_Kick_2);
		audio_stop_sound(Axe_Kick_3);
		audio_stop_sound(Axe_Kick_4);
		audio_stop_sound(Axe_Kick_5);
		audio_play_sound(choose(Axe_Kick_1, Axe_Kick_2, Axe_Kick_3, Axe_Kick_4, Axe_Kick_5), 0, false);
		if self.hp <= 0
		{
			if !self.killed
			{
				instance_create_layer(self.x, self.y, "Main", Card_Resource_Log);
				with Card_Tool_Axe
				{
					x = room_width / 2 - sprite_width / 2
					y = room_height - (sprite_height+64) / 2;
				}
				alarm[0] = room_speed * 10;
				self.killed = true;
			}
		}
	}
}
else
{
	visible = false;
}
