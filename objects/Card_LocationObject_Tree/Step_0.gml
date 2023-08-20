if global.location == "forest"
{
	visible = true;
	if place_meeting(self.x, self.y, Card_Tool_Axe) 
	and self.hp == 100 
	and !Card_Tool_Axe.dragging
	and !Card_Tool_Axe.atacked
	{
		audio_play_sound(choose(Axe_Kick_1, Axe_Kick_2, Axe_Kick_3, Axe_Kick_4, Axe_Kick_5), 0, false)
		self.hp -= Card_Tool_Axe.str;
		self.first_damage = true;
		with Card_Tool_Axe
		{
			atacked = true;
			alarm[0] = room_speed * 1;
		}
		return;
	}
	else if place_meeting(self.x, self.y, Card_Tool_Axe) 
	and place_meeting(mouse_x, mouse_y, Card_Tool_Axe) 
	and mouse_check_button_released(mb_left)
	and !Card_Tool_Axe.atacked
	and self.hp > 0
	{
		self.hp -= Card_Tool_Axe.str;
		audio_play_sound(choose(Axe_Kick_1, Axe_Kick_2, Axe_Kick_3, Axe_Kick_4, Axe_Kick_5), 0, false);
		Card_Tool_Axe.atacked = true;
		Card_Tool_Axe.alarm[0] = room_speed * 1;
		if self.hp <= 0
		{
			if !self.killed and !place_meeting(self.x, self.y, Card_Resource_Log)
			{
				instance_create_layer(self.x, self.y, "Main", Card_Resource_Log);
				instance_destroy(Card_Tool_Axe);
				add_item("Axe", Tool_Axe, Card_Tool_Axe, -1, "tool");
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
