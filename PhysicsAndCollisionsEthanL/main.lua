-----------------------------------------------------------------------------------------
-- Title: Interacting Objects 2
-- Name: Ethan. L
-- Course: ICS2O
-----------------------------------------------------------------------------------------
-- hide the status bar
display.setStatusbar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()
----------------------------------------------------------------------------------
-- Objects
----------------------------------------------------------------------------------
-- Ground
local ground = display.newImage("PImages/ground.png", 0, 0)
	ground.x