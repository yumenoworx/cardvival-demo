window_set_cursor(cr_handpoint);
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