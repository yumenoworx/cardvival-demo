draw_set_font(Console);
draw_self();

if qty > 0
{
	draw_text(x,y-16, "x" + string(qty));
}