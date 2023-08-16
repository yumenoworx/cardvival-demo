if !place_meeting(self.x, self.y, Card_LocationObject_Tree)
{
	audio_play_sound(Card_Deal, 0, false);
}
else
{
	nearest = instance_nearest(self.x, self.y, Card_LocationObject_Tree);
	if !nearest.killed
	{
		audio_stop_sound(Axe_Kick_1);
		audio_stop_sound(Axe_Kick_2);
		audio_stop_sound(Axe_Kick_3);
		audio_stop_sound(Axe_Kick_4);
		audio_stop_sound(Axe_Kick_5);
		audio_play_sound(choose(Axe_Kick_1, Axe_Kick_2, Axe_Kick_3, Axe_Kick_4, Axe_Kick_5), 0, false)
	} else {
		audio_play_sound(Card_Deal, 0, false);
	}
}