if place_meeting(self.x, self.y, Card_Tool_Axe) and !first_damage and !Card_Tool_Axe.dragging
{
	Card_Tool_Axe.hp -= 1;
	hp -= Card_Tool_Axe.str;
	first_damage = true;
	return;
}

if place_meeting(mouse_x, mouse_y, Card_Tool_Axe) and mouse_check_button_pressed(mb_left) and !Card_Tool_Axe.dragging
{
	Card_Tool_Axe.hp -= 1
	self.hp -= Card_Tool_Axe.str;
}

if self.hp <= 0
{
	with self
	{
		instance_destroy();
	}
	with Card_Tool_Axe
	{
		x = 640;
		y = 640;
	}
}