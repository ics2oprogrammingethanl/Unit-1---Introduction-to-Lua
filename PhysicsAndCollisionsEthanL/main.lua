-----------------------------------------------------------------------------------------
-- Title: Interacting Objects
-- Name: Ethan L
-- Course: ICS2O
-- This program displays balls that bounce and move along the ground/walls
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
-- Sound
local backgroundMusic = audio.loadSound("Sounds/bkgMusic.mp3")
local backgroundMusicChannel

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
	beam:scale(512, 1)

	-- set the beam width and height
	beam.width = display.contentWidth/2
	beam.height = display.contentHeight/10

	-- rotate the beam -60 degrees so its on an angle
	beam:rotate(45)

	-- send it to the back layer
	beam:toBack()

	-- add to physics
	physics.addBody(beam, "static", {friction=0.5, bounce=0.3})

local beam2 = display.newImage("Images/beam.png", 26, 160)

	-- set the x and y pos
	beam2.x = 860
	beam2.y = display.contentCenterY*1.65

	-- Set the beam's size
	beam2:scale(512, 1)

	-- set the beam width and height
	beam2.width = display.contentWidth/2
	beam2.height = display.contentHeight/10

	-- rotate the beam 60 degrees so its on an angle
	beam2:rotate(-45)

	-- send it to the back layer
	beam2:toBack()

	-- add to physics
	physics.addBody(beam2, "static", {friction=0.5, bounce=0.3})

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
	local ball1 = display.newImage("Images/super_ball.png", 0, 300)

	-- add to physics
	physics.addBody(ball1, {density=0, friction=0.5, bounce=0.3, radius=12.5})

	ball1:scale(0.5, 0.5)

	audio.play(backgroundMusic)
end

-------------------------------------------------------------------------------

local function secondBall()
	-- creating second ball
	local ball2 = display.newImage("Images/super_ball.png", 0, 300)

	-- adding to physics
	physics.addBody(ball2, {density=1.0, friction=5, bounce=1, radius=25})
end

-------------------------------------------------------------------------------

local function thirdBall()
	-- creating second ball
	local ball3 = display.newImage("Images/super_ball.png", 0, 300)

	-- adding to physics
	physics.addBody(ball3, {density=1.0, friction=0.5, bounce=1, radius=50})

	ball3:scale(2.5, 2.5)
end

-------------------------------------------------------------------------------

local function fourthBall()
	-- creating second ball
	local ball4 = display.newImage("Images/super_ball.png", 0, 300)

	-- adding to physics
	physics.addBody(ball4, {density=1.0, friction=0.5, bounce=1, radius=100})

	ball4:scale(5, 5)
end

--------------------------------------------------------------------------------
-- TIMER DELAYS - call each function after the given millisecond
--------------------------------------------------------------------------------
-- create border
local topWall = display.newRect(0, 0, display.contentWidth*2, 5)
local rightWall = display.newRect(1024, 0, 5, display.contentHeight*2)
local leftWall = display.newRect(0, 0, 5, display.contentHeight*2)

physics.addBody(topWall, "static", {density=1.0, friction=0.5})
physics.addBody(rightWall, "static", {density=1.0, friction=0.5})
physics.addBody(leftWall, "static", {density=1.0, friction=0.5})

topWall.isVisible = false
rightWall.isVisible = false
leftWall.isVisible = false

timer.performWithDelay( 0, firstBall)
timer.performWithDelay( 500, secondBall)
timer.performWithDelay( 1000, thirdBall)
timer.performWithDelay( 2000, fourthBall)