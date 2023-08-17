	for (i = 0; i < global.arraySiza; i++){
		if (!is_struct(global.invent[i])) {
			global.invent[i] = new add_item(nameItem,num,maxNum,sprite);
			exit;
		}
	}