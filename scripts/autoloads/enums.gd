extends Node

enum BulletBehaviours { 
	STRAIGHT = 0, # SPEED + DIRECTION 
	TRACKING = 1, # SPEED + TRACKING_TIME
	SINE = 2, # SPEED + AMPLITUDE
}

enum BulletConfigOptions { 
	BEHAVIOUR = 0,
	SPEED = 1,
	DIRECTION = 2,
	
	TRACKING_TIME = 101,
	
	AMPLITUDE = 201,
}
