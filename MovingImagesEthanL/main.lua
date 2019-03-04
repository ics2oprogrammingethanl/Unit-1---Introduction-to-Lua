-----------------------------------------------------------------------------------------
-- Title: MovingImages
-- Name: Ethan. L
-- Course: ICS2O/3C
-- This program moves a beetleship across the screen and then makes it fade out.
-- I added another object that moves in a different direction as well as a background image.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 2

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 1^3
beetleship.y = (display.contentHeight/3)
beetleship.y = 1^3
-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.y = beetleship.x + scrollSpeed
	beetleship.x = beetleship.y + scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out
	beetleship.alpha = beetleship.alpha + 0.01
	-- rotates the ship
	beetleship:rotate( 5 )
	-- changes the size
	beetleship:scale(1.011^-1, 1.011^-1)
end

-- Moveship will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)
----------------------------------------------------------------------------------------
-- global variables
scrollSpeed2 = -3

-- character image with width and height
local rocketship = display.newImageRect("Images/rocketship.png", 200, 200)

-- changes the direction of the rocket ship
rocketship:scale (-1, 1)

-- set the image to be transparent
rocketship.alpha = 1

-- set the initial x and y position of beetleship
rocketship.x = 1024
rocketship.y = display.contentHeight/3

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip2(event)
	-- add the scroll speed to the x-value of the ship
	rocketship.x = rocketship.x + scrollSpeed2
	-- change the transparency of the ship every time it moves so that it fades out
	rocketship.alpha = rocketship.alpha - 0.001
	-- rotates the ship
	rocketship:rotate( 1 )
	-- changes the size
	rocketship:scale(1.011, 1.011)
end

-- Moveship will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip2)
