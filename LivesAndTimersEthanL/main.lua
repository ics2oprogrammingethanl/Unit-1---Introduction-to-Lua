-----------------------------------------------------------------------------------------
-- Title: LivesAndTimers
-- Name: Ethan L
-- Course: ICS2O/3C
-- This program 
-----------------------------------------------------------------------------------------
-- variables for the timer
local totalSeconds = 5
local secondsLEft = 5
local clockText
local countDownTimer

local lives = 3
local heart1
local heart2
local incorrectObject
local pointsObject
local pointsObject
local deathSound = audio.load("Sounds/DeathSound.mp3")

---------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------------------------------

local function UpdateTime()

	-- decrement the number of seconds
	secondsLEft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1

		elseif (lives == 0) then
			audio.play("Sounds/DeathSound.mp3")

		if (lives == 2) then
			heart2.isVisible = false
			elseif (lives == 1) then
				heart1.isVisible = false
			end

			AskQuestion()
	end
end

-- function that calls the timer
local function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

----------------------------------------------------------------------
-- OBJECT CREATION
----------------------------------------------------------------------

-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWIdth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7


