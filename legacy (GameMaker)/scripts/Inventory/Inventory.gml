// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function add_item(_name, _sprite, _object, _qty, _type)
{
	for (i = 0; i < array_length(global.inventory); i++)
	{
		if global.inventory[i][$ "name"] == _name and global.inventory[i][$ "qty"] != -1
		{
			global.inventory[i][$ "qty"] += _qty;
			return;
		}
	}
	array_push(global.inventory, {name: _name, sprite: _sprite, object: _object, qty: _qty, type: _type})
}