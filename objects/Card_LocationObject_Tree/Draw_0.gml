draw_set_font(Console)
draw_set_alpha(0.5);
if self.hp <= 0
{
	draw_sprite_ext(LocationObject_Tree, LocationObject_Tree, self.x, self.y, 0.4, 0.4, 0, -1, 0.7);
	return;
}
draw_set_alpha(1);
draw_self();
draw_text(self.x, self.y+sprite_height, string(self.hp));