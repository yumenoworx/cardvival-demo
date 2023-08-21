slots = 0;
slots_previous = 0;
ini_open("save.me")
global.inventory = json_parse(ini_read_string("Character", "Inventory", json_stringify([{name:"Forest", sprite: Location_Forest, object: Card_Location_Forest, qty: -1, type: "Location"}, {name:"Axe", sprite: Tool_Axe, object: Card_Tool_Axe, qty: -1, type: "Tool", properties: {str:3}}])));
ini_close();
inventory_previous = [];
slots_arr = [];
push = true;