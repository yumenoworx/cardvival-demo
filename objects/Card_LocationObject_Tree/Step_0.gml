if place_meeting(self.x, self.y, Card_Tool_Axe) 
   and !first_damage 
   and !Card_Tool_Axe.dragging
{
	Card_Tool_Axe.hp -= 1;
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
	Card_Tool_Axe.hp -= 1;
}

if mouse_check_button_released(mb_left)
{
	if self.hp <= 0
	{
	
		instance_create_layer(self.x + random_range(5, 30), 
							 self.y + random_range(5, 30), "Main", Card_Resource_Log);
		first_damage = false;
		self.hp = 15;
		instance_destroy();
		with Card_Tool_Axe
		{
			x = 640;
			y = 640;
		}
	}
}