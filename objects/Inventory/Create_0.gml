global.arraySize = 6;

for (i = 0; i < global.arraySize; i++){
	global.invert[i] = false;
	instance_create_depth(32*i,0,0,cellsinv).cell=i; 
}
