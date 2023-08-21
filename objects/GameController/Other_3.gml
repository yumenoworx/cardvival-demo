ini_open("Save.ini")
ini_write_string("Character","Inventory", json_stringify(global.inventory));
ini_close();
