if global.location == "forest"
{
	visible = true;
	if place_meeting(self.x, self.y, Card_Tool_Axe) 
	and !first_damage 
	and !Card_Tool_Axe.dragging
	{
		hp -= Card_Tool_Axe.str;
		audio_play_sound(choose(Axe_Kick_1, Axe_Kick_2, Axe_Kick_3, Axe_Kick_4, Axe_Kick_5), 0, false);
		first_damage = true;
		return;
	} 
	else if place_meeting(self.x, self.y, Card_Tool_Axe) 
	and place_meeting(mouse_x, mouse_y, Card_Tool_Axe) 
	and mouse_check_button_pressed(mb_left) 
	{
		hp -= Card_Tool_Axe.str;
	}

	if place_meeting(self.x, self.y, Card_Tool_Axe) and place_meeting(mouse_x, mouse_y, Card_Tool_Axe) and mouse_check_button_released(mb_left)
	{
		if self.hp <= 0
		{
			if !self.killed
			{
				instance_create_layer(self.x, self.y, "Main", Card_Resource_Log);
				with Card_Tool_Axe
				{
					x = 640;
					y = 640;
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