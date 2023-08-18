window_set_cursor(cr_handpoint);


image_xscale = original[0];
image_yscale = original[1];
x += scaled_size[0] - original_size[0];
y += scaled_size[1] - original_size[1];

audio_play_sound(Card_Down, 0, false);

if place_meeting(self.x, self.y, LocationField)
{
	self.x = LocationField.x;
	self.y = LocationField.y;
}

audio_play_sound(Card_Down, 0, false);