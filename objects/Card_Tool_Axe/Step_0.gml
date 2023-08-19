if global.location != "forest"
{
	instance_deactivate_object(Card_Tool_Axe);

}

if place_meeting(self.x, self.y, Border)
{
	x = xprevious;
	y = yprevious;
	can_move = false;
} else {
	can_move = true;
}