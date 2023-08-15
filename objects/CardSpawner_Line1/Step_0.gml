if global.location == "nothing"
{
	if global.prev_location == "forest" 
	{
		with Card_LocationObject_Tree
		{
			instance_destroy();
		}
	}
}
if global.location == "forest" and last_location != "forest"
{
	show_debug_message("Forest!")
	instance_create_layer(self.x, self.y, "Main", Card_LocationObject_Tree)
	last_location = "forest";
}