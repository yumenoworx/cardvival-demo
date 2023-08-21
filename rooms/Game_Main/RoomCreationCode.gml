
instance_create_layer(0, 0, "Main", GameController)
if os_type == os_android
{
	os_set_orientation_lock(false, true);
	room_set_width(self, display_get_width());
	room_set_height(self, display_get_height());
}
else if os_type == os_browser
{
	// скоро будет мбмбмб
	break;
}