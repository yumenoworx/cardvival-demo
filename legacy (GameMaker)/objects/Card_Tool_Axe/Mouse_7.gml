window_set_cursor(cr_handpoint);
image_xscale = original[0];
image_yscale = original[1];
x += scaled_size[0] - original_size[0];
y += scaled_size[1] - original_size[1];

if place_meeting(self.x, self.y, Card_LocationObject_Tree)
{
	nearest = instance_nearest(self.x, self.y, Card_LocationObject_Tree);
	self.x = nearest.x;
	self.y = nearest.y;
	if nearest.killed
	{
		audio_play_sound(Card_Down, 0, false);
	}
} else {
	audio_play_sound(Card_Down, 0, false);
}