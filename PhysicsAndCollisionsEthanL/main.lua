-----------------------------------------------------------------------------------------
-- Title: Interacting Objects
-- Name: Ethan L
-- Course: ICS2O
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()
--------------------------------------------------------------------
-- Objects
--------------------------------------------------------------------
-- Ground
local ground = display.newImage("Images/ground.png", 0, 0)

	ground.x = display.contentWidth/2
	ground.y = display.contentHeight
	-- Change the width to be the same as the screen
	ground.width = display.contentWidth

	-- Add to physics
	physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

--------------------------------------------------------------------

-- Beam
local beam = display.newImage("Images/beam.png", 26, 160)

	-- set the x and y pos
	beam.x = display.contentCenterX/5
	beam.y = display.contentCenterY*1.65

	-- Set the beam's size
	beam:scale(512, 0.5)

	-- rotate the beam -60 degrees so its on an angle
	beam:rotate(45)

	-- send it to the back layer
	beam:toBack()

	-- add to physics
	physics.addBody(beam, "static", {friction=0.5, bounce=0.1})

-- create bkg
local bkg = display.newImage("Images/bkg.png", 0, 0)

	-- set the x and y pos
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY

	bkg.width = display.contentWidth
	bkg.height = display.contentHeight

	-- send to back
	bkg:toBack()

--------------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------------

-- create the first ball
local function firstBall()
	-- creating first ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=25})
end

-------------------------------------------------------------------------------

local function secondBall()
	-- creating second ball
	local ball2 = display.newImage("Images/super_ball.png", 0, 0)

	-- adding to physics
	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.3, radius=12.5})

	ball2:scale(2.5, 2.5)
end

--------------------------------------------------------------------------------
-- TIMER DELAYS - call each function after the given millisecond
--------------------------------------------------------------------------------
timer.performWithDelay( 0, firstBall)
timer.performWithDelay( 500, secondBall)
