// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Item(_name, _sprite, _type, _properties) constructor {
	name = _name;
	sprite = _sprite;
	type = _type;
	properties = _properties;
}

function Slot(_item, _quantity) constructor{
	item = _item;
	quantity = _quantity;
}