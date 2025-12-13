# GodotGameSimulation
Created to test animation in relation to game creation for the third assignment of our computer graphics class.

## Group For: 
	Group 1 - COMP-360-ON1

## Members: 
	Jasan Brar, Zoe Antonio, Bilal Ahmad, Pragti Duggal, Jason Haug, Christian Skondric

## Game Simulation/Animated Concept: 
	Basketball Mini-Game

## World Building:
	World Building/Landscape (custom) - Jasan:
		The world building that we have introduced in the minigame is essentially reminiscent of an outside basketball court,
		however of a more miniature size. The court features an asphalt/road-like floor with large towering brick walls, which
		are alike to building walls, that connect together with the camera angle to showcase the mountain of difference of 
		the player (ball) and the destination object (hoop). With this it makes it feel more like a game and challenge, with them knowing the clear goal in sight.

## World Environment:
	World Environment - Jasan:
		The world environment features many aspects, one being the camera which is a dominant figure in determining how our gameplay
		will play out, the lighting, and much more. The camera is a dominant figure because it determines how and what the player views.
		In our case the camera is making it abundantly clear the objective is towards the (hoop), especially from the starting angle of the (ball).
		The lighting helps to add a lot of life to our game, we used rain particles in our world environment to give the feel of more of an outside rainy
		day, and by using more dim lighting coupled with the Godot fog, it really gave the world a lot more appeal than previously before.

## Models, Items and More:
	The models, items, and sounds for them featured in the game so far are:
		(https://polyhaven.com/) used for textures/assets:
		(https://elevenlabs.io/) used for texture/assets sounds:
		- Ball: 
			The player-driven ball which is the focal point of the game, in our case, a basketball, modeled in Blender by Jasan.
		- Hoop: 
			The destination or goal object for the player to reach, modeled in Blender by Jasan.
		- court-floor: 
			Similar to Path3D but used in a mesh format to give the proper feel of a court, modeled in Blender by Jasan.
		- ball-holder: 
			To add more life to the environment we placed standard holders which have more basketballs in them. To give more purpose to your endless supply, modeled in Blender by Jasan.
		- Basket:
			Added a basket to the underside of the rim, which was previousy left bare, to complete the hoop setup, modeled, rigged, and animated in Blender and Godot by Jasan.
		- fence/fence-post:
			To add more to the boundary of the world, completing our custom 'landscape', and the aesthetic of the 'outside court' that we spoke of earlier in our README, modeled in Blender by Jasan.
		- floor/wall textures: 
			Taken from Polyhaven under their CCO or Public Domain use license to give more life to the overall environment, modeled in Blender by Jasan.

## Gameplay Logic and Features:
	- Main-Menu and Sound - Jason:
		The main menu features settings, our name, a custom title and background - generated, and an intro into the game itself. 
		The menu also begins the sound for the game which carries over and repeats, it is royalty free music, so perfectly usable.
	- Ball Mechanics - Kiki:
		The ball is controllable by the player and by pressing 'space' it constantly bounces, with each being an addition onto the last, 
		this is how the player can position themselves from floor to hoop accurately.
	- 3D Animation - Jasan:
		The 3d animation we incorporated is linked to the basket where upon contact with the ball (body entered) the ball undergoes a custom animation
		made in Blender while also playing a sound to accompany it. These animations could also be made and edited in Godot as well, Logan's video covers
		how to implement this pretty well and is what was followed - the models and rig however itself was completely custom for our little minigame.
	- Coin Collection - Zoe:
		The coins give the player more to do beyond the standard, there is a tracker on the top left for the player to see how many they have (/3),
		and the coins are perfectly positioned to teach them the ball mechanics via the bounce.
>
