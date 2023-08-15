if global.location == noone
{
	if global.prev_location == "forest" 
	{
		with Card_LocationObject_Tree
		{
			instance_destroy();
		}
	}
	last_location = noone;
}
if global.location == "forest" and last_location != "forest"
{
	instance_create_layer(self.x, self.y, "Main", Card_LocationObject_Tree)
	last_location = "forest";
}