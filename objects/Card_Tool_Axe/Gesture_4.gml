window_set_cursor(cr_default);
dragging = false;
image_xscale = original[0];
image_yscale = original[1];
if !place_meeting(self.x, self.y, Card_LocationObject_Tree)
{
	audio_play_sound(Card_Down, 0, false);
} else if place_meeting(self.x, self.y, Card_LocationObject_Tree) and !Card_LocationObject_Tree.first_damage {
	audio_play_sound(choose(Axe_Kick_1, Axe_Kick_2, Axe_Kick_3, Axe_Kick_4, Axe_Kick_5), 0, false);
}