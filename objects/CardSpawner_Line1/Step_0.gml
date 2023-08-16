if global.location == "forest"
{
	if !place_meeting(self.x, self.y, Card_LocationObject_Tree)
	{
		instance_create_layer(self.x, self.y, "Main", Card_LocationObject_Tree);
	}
	instance_activate_object(Card_Tool_Axe);
}