if place_meeting(x, y, Card_Tool_Axe)
{
	if !instance_nearest(x, y, Card_Tool_Axe).dragging
	{
		with instance_nearest(x, y, Card_Tool_Axe)
		{
			instance_destroy(self);
		}
		add_item("Axe", Tool_Axe, Card_Tool_Axe, -1, "tool");
	}
}
else if place_meeting(x, y, Card_Location_Forest)
{
	if !instance_nearest(x, y, Card_Location_Forest).dragging
	{
		with instance_nearest(x, y, Card_Location_Forest)
		{
			instance_destroy(self);
		}
		add_item("Forest", Location_Forest, Card_Location_Forest, -1, "location");
	}
}