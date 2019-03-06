-- Title: TouchAndReact
-- Name: Ethan. L
-- Course: ICS2O/3C
-- This program displays a blue button.
-- When I click on it, it changes to a red button and the word "Clicked" appears
-- as well as an image and a sound effect.
-- When I release the button, it returns to the original screen.

-- set background colour
display.setDefault ("background", 178/255, 123/255, 89/255)

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive.png",198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create red button, set its position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active.png",198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create text object, set its position and make it invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (0, 0, 1)
textObject.isVisible = false

-- create my image
local reginald = display.newImageRect ("Images/reginald.png", 300, 198)
reginald.x = display.contentWidth/1.5
reginald.y = display.contentHeight/4
reginald.isVisible = false

-- create my sound
local clickSound = audio.loadSound("Sounds/Wrong Buzzer Sound Effect.mp3")

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue buton is clicked, it will make the text appear with the red button,
-- and make the blue button dissapear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		reginald.isVisible = true
		audio.play( clickSound )
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		reginald.isVisible = false
	end
end

local function RedButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		reginald.isVisible = false
	end
end
-- Add the event listeners
blueButton:addEventListener("touch", BlueButtonListener)
redButton:addEventListener("touch", RedButtonListener)
