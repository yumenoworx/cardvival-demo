window_set_cursor(cr_handpoint);

image_xscale = original[0];
image_yscale = original[1];

audio_play_sound(Card_Down, 0, false);

if place_meeting(self.x, self.y, LocationField)
{
	nearest = instance_nearest(self.x, self.y, LocationField);
	self.x = nearest.x;
	self.y = nearest.y;
}

audio_play_sound(Card_Down, 0, false);