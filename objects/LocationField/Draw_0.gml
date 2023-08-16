draw_set_font(Console);
draw_self()
if global.location != noone
{
	draw_text(self.x, self.y + sprite_height, "Location: " + global.location)
} else {
	draw_text(self.x, self.y + sprite_height, "Location: " + "island")
}