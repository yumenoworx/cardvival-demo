if global.location != "forest"
{
	instance_deactivate_object(Card_Tool_Axe);
}

if global.html5_build and mouse_check_button(mb_left)
{
	window_set_cursor(cr_default);
	dragging = false;
	image_xscale = original[0];
	image_yscale = original[1];

	if place_meeting(self.x, self.y, Card_LocationObject_Tree)
	{
		nearest = instance_nearest(self.x, self.y, Card_LocationObject_Tree);
		if nearest.killed
		{
			audio_play_sound(Card_Down, 0, false);
		}
	} else {
		audio_play_sound(Card_Down, 0, false);
	}
}

if global.html5_build and mouse_check_button_released(mb_left)
{
	window_set_cursor(cr_default);
	dragging = false;
	image_xscale = original[0];
	image_yscale = original[1];

	if place_meeting(self.x, self.y, Card_LocationObject_Tree)
	{
		nearest = instance_nearest(self.x, self.y, Card_LocationObject_Tree);
		if nearest.killed
		{
			audio_play_sound(Card_Down, 0, false);
		}
	} else {
		audio_play_sound(Card_Down, 0, false);
	}
}

if place_meeting(self.x, self.y, Border)
{
	can_move = false;
	x = xprevious;
	y = yprevious;
} else {
	can_move = true;
}