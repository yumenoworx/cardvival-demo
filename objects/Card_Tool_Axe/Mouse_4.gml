if !place_meeting(self.x, self.y, Card_LocationObject_Tree)
{
	audio_play_sound(Card_Deal, 0, false);
}
else if instance_nearest(self.x, self.y, Card_LocationObject_Tree).killed
{
	audio_play_sound(Card_Deal, 0, false);
}