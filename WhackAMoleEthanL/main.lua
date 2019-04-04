-----------------------------------------------------------------------------------------
-- Title: WhackAMole
-- Name: Ethan L.
-- Course: ICS2O/3C
-- This program places a random object on the screen. IIf the user clicks on it in time,
-- the score increases by 1.
-----------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Creating sounds
local hitSound = audio.loadSound("Sounds/bruh.mp3")
local hitSoundChannel
local backgroundMusic = audio.loadSound("Sounds/backgroundmusic.mp3")
local backgroundMusicChannel

-- Background Music
backgroundMusicChannel = audio.play(backgroundMusic)

-- Creating Background
local bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight )

	-- set the background colour
	bkg.fill = {0/255, 125/255, 125/255}

	-- Setting Position
	bkg.anchorX = 0
	bkg.anchorY = 0
	bkg.x = 0
	bkg.y = 0

-- Creating Mole
local mole = display.newImage( "Images/mole2.png" , 0, 0 )

	-- Setting Position
	mole.x = display.contentCenterX
	mole.y = display.contentCenterY

	mole:scale(2/4, 2/4)

	-- Make the mole invisible
	mole.isVisible = false

-- Score Tracking
local score = 0

-- Add text object
local scoreObject = display.newText("Score: ", display.contentWidth/6, display.contentHeight/8, nil, 80)
scoreObject:setTextColor(0/255, 255/255, 125/255)
---------------------------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------------------------

-- This function that makes the mole appear in a random (x,y) position on the screen
-- before calling the Hide function
function PopUp( )

	-- Choosing Random Position on the screen between 0 and the size of the screen
	mole.x = math.random( 0, display.contentWidth )
	mole.y = math.random( 0, display.contentHeight)

	-- Make the mole visible
	mole.isVisible = true

	-- Call the function 500 milliseconds later
	timer.performWithDelay( 400, Hide)
end

-- This function calls the PopUp function after 3 seconds
function PopUpDelay( )
	timer.performWithDelay( 3000, PopUp )
end

-- This function makes the mole invisible and then calls the PopUpDelay function
function Hide( )

	-- Changing Visibility
	mole.isVisible = false

	-- Call the PopUpDelay function
	PopUpDelay()
end

-- This function starts the game
function GameStart( )
	PopUpDelay()
end

-- This function increments the score only if the mole is clicked. It then displays the
-- new score.
function Whacked( event )

	-- If touch phase just started
	if (event.phase == "began") then
		score = score + 1
		scoreObject.text = "Score: " .. score
		hitSoundChannel = audio.play(hitSound)
	end

end

------------------------------------------------------------------------------------------
-- EVENT LISTENERS
------------------------------------------------------------------------------------------
-- I add the event listener to the moles so that if the mole is touched, the Whacked function
-- is called
mole:addEventListener( "touch", Whacked )

-------------------------------------------------------------------------------------------
-- GAME START
-------------------------------------------------------------------------------------------

-- Call the GameStart function to start the game
GameStart()