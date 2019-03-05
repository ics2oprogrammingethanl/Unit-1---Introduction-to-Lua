-- Title: TouchAndDrag
-- Name: Ethan. L
-- Course: ICS2O/3C
-- This program has two images on the screen.
-- When I click and drag on each image, it moves with my finger.
------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local variables
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local yellowGirl = display.newImageRect("Images/yellowGirl.png", 150, 150)
local yellowGirlWidth = yellowGirl.width
local yellowGirlHeight = yellowGirl.height

local blueGirl = display.newImageRect("Images/blueGirl.png", 150, 150)
local blueGirlWidth = blueGirl.width
local blueGirlheight = blueGirl.height

local star = display.newImageRect("Images/star.png", 150, 150)
local starWidth = star.width
local starHeight = star.height

-- my boolean variables to keep track of which object I touched first
local alreadyTouchedYellowGirl = false
local alreadyTouchedBlueGirl = false
local alreadyTouchedStar = false

-- set the initial x and y position of myImage
yellowGirl.x = 400
yellowGirl.y = 500

blueGirl.x = 300
blueGirl.y = 200

star.x = 500
star.y = 500

-- Function: BlueGirlListener
-- Imput: touch listener
-- Output: none
-- Description: when blue girl is tocuhed, move her
local function BlueGirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedYellowGirl == false) then
			alreadyTouchedBlueGirl = true
			alreadyTouchedStar = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedBlueGirl == true) ) then
		blueGirl.x = touch.x
		blueGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedBlueGirl = false
		alreadyTouchedYellowGirl = false
		alreadyTouchedStar = false
	end
end

-- add the respective listeners to each object
blueGirl:addEventListener("touch", BlueGirlListener)
----------------------------------------------------------------------------------
-- Function: yellowGirlListener
-- Imput: touch listener
-- Output: none
-- Description: when yellow girl is tocuhed, move her
local function YellowGirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedBlueGirl == false) then
			alreadyTouchedYellowGirl = true
			alreadyTouchedStar = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedYellowGirl == true) ) then
		yellowGirl.x = touch.x
		yellowGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedYellowGirl = false
		alreadyTouchedBlueGirl = false
		alreadyTouchedStar = false
	end
end

-- add the respective listeners to each object
yellowGirl:addEventListener("touch", YellowGirlListener)
--------------------------------------------------------------------------------
-- Function: starListener
-- Imput: touch listener
-- Output: none
-- Description: when star is tocuhed, move
local function StarListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedBlueGirl == false) and (alreadyTouchedYellowGirl == false) then
			alreadyTouchedStar = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedStar == true) ) then
		star.x = touch.x
		star.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedYellowGirl = false
		alreadyTouchedBlueGirl = false
		alreadyTouchedStar = false
	end
end

-- add the respective listeners to each object
star:addEventListener("touch", StarListener)
