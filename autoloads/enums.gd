extends Node

enum BulletBehaviours { 
	STRAIGHT = 0, # SPEED + DIRECTION 
	HOMING = 1, # SPEED + HOMING_TIME
	SINE = 2, # SPEED + AMPLITUDE
}

enum BulletConfigOptions { 
	BEHAVIOUR = 0,
	SPEED = 1,
	DIRECTION = 2,
	
	HOMING_TIME = 101,
	
	AMPLITUDE = 201,
}
