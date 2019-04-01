-----------------------------------------------------------------------------------------
-- Title: MathFun
-- Name: Ethan L
-- Course: ICS2O/3C
-- This program asks math questions that have addition and subtraction questions 
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 255/255, 125/255, 0/255)

---------------------------------------------------------------------------------------
-- LOCAL VARIABLES
---------------------------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectAnswer
local randomOperator
local correctSound = audio.loadSound( "Sounds/Cash Register Cha Ching.mp3" )
local incorrectSound = audio.loadSound( "Sounds/SpringSoundEffect.mp3" )
local correctSoundChannel
local incorrectSoundChannel

-- variables for the timer
local totalSeconds = 5
local secondsLeft = 5
local clockText = display.newText("", display.contentWidth/8, display.contentHeight/8, nil, 50)
local countDownTimer

local lives = 3
local heart1
local heart2
local heart3
local pointsObject
local deathSound = audio.loadSound("Sounds/DeathSound.mp3")
local deathSoundChannel

local pointsObject
local deathSound = audio.loadSound("Sounds/Minecraft-death-sound.mp3")
local deathSoundChannel
local gameOverScreen = display.newImageRect("Images/gameOver.png", 1024, 768)
gameOverScreen.x = display.contentWidth/2
gameOverScreen.y = display.contentHeight/2
gameOverScreen.isVisible = false
---------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------------------------------
local function roundToFirstDecimal( tmpcorrectAnswer )
  return math.round( tmpcorrectAnswer * 10) * 0.1
end

local function AskQuestion()

 -- generates a number between 1 and 2, 1 being addition, 2 being subtraction
 randomOperator = math.random(1, 4)

 -- generate 2 random numbers between a max. and a min. number
 randomNumber1 = math.random(6, 10)
 randomNumber2 = math.random(1, 6)

 -- if the random operator is 1, then do addition
 if (randomOperator == 1) then

  -- calculate the correct answer
  correctAnswer = randomNumber1 + randomNumber2

 -- create question in text object
 questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

 -- otherwise, if the random operator is 2, do subtraction
 elseif (randomOperator == 2) then

  -- calculate the correct answer
  correctAnswer = randomNumber1 - randomNumber2

  -- create question in text object
  questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

  -- otherwise, if the random operator is 3, do multiplication
 elseif (randomOperator == 3) then

  -- calculate the correct answer
  correctAnswer = randomNumber1 * randomNumber2

  -- create question in text object
  questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

  -- otherwise, if the random operator is 4, do division
 elseif (randomOperator == 4) then

  -- calculate the correct answer
  correctAnswer = roundToFirstDecimal(randomNumber1 / randomNumber2)

  -- create question in text object
  questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "
	end
end

local function UpdateTime()

 -- decrement the number of seconds
 secondsLeft = secondsLeft - 1

 -- display the number of seconds left in the clock object
 clockText.text = secondsLeft .. ""

 if (secondsLeft == 0 ) then
  -- reset the number of seconds left
  secondsLeft = totalSeconds
	lives = lives - 1

  	if (lives == 2) then
	heart3.isVisible = false
	incorrectSoundChannel = audio.play(incorrectSound)
	AskQuestion()
	elseif (lives == 1) then
	heart2.isVisible = false
	incorrectSoundChannel = audio.play(incorrectSound)
	AskQuestion()
	elseif (lives == 0) then
	heart1.isVisible = false
	deathSoundChannel = audio.play(deathSound)
	timer.cancel(countDownTimer)
	gameOverScreen.isVisible = true
	numericField.isVisible = false
	questionObject.isVisible = false
		end
	end
end
UpdateTime()
-- function that calls the timer
local function StartTimer()
 -- create a countdown timer that loops infinitely
 countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

local function KeepTime()
	timer.resume(countDownTimer)
	secondsLeft = 5
end

local function HideCorrect()
 correctObject.isVisible = false
 AskQuestion()
end

local function HideIncorrect()
 incorrectObject.isVisible = false
 AskQuestion()
end

local function NumericFieldListener( event )

 -- User begins editing "numericField"
 if (event.phase == "began") then

 elseif (event.phase == "submitted") then

	-- when the answer is submitted (enter key is pressed) set user input to user's answer
	userAnswer = tonumber(event.target.text)
	-- if the users answer and the correct answer are the same:
	if (userAnswer == correctAnswer) then
	incorrectObject.isVisible = false
	correctObject.isVisible = true
	timer.performWithDelay(3000, HideCorrect)
    correctSoundChannel = audio.play(correctSound)
    timer.pause(countDownTimer)
    timer.performWithDelay(2560, KeepTime)

	elseif (userAnswer ~= correctAnswer) then
	incorrectObject.isVisible = true
	correctObject.isVisible = false
	timer.performWithDelay(3000, HideIncorrect)
	lives = lives - 1
	timer.pause(countDownTimer)
	incorrectSoundChannel = audio.play(incorrectSound)
	timer.performWithDelay(2560, KeepTime)
	elseif (lives == 0) then
	incorrectSoundChannel = false
	deathSoundChannel = audio.play(deathSound)
	end

	if (lives == 2) then
	heart3.isVisible = false
	elseif (lives == 1) then
	heart2.isVisible = false
	elseif (lives == 0) then
	heart1.isVisible = false
	deathSoundChannel = audio.play(deathSound)
	incorrectSoundChannel = audio.stop(incorrectSoundChannel)
	timer.cancel(countDownTimer)
	gameOverScreen.isVisible = true
	numericField.isVisible = false
	questionObject.isVisible = false
	correctObject.isVisible = false
	incorrectObject.isVisible = false
	end

	-- clear text field
	event.target.text = ""

	end
end

---------------------------------------------------------------------------------
-- OBJECT CREATION
---------------------------------------------------------------------------------

-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 5 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

-- create the lives to display on the screen
heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 7 / 8
heart3.y = display.contentHeight * 1 / 7

-- displays a question and sets the colour
questionObject = display.newText( "", 300, display.contentHeight/3, nil, 80)
questionObject:setTextColor(255/255, 255/255, 255/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(0/255, 211/255, 198/255)
correctObject.isVisible = false

-- Create numeric field
numericField = native.newTextField( 650, display.contentHeight/3, 300, 100 )
numericField.inputType = "decimal"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- create the incorrect text ojbect and make it invisible
incorrectObject = display.newText( "Incorrect", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor(255/255, 255/255, 0/255)
incorrectObject.isVisible = false
--------------------------------------------------------------------------------
-- FUNCTION CALLS
--------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()
StartTimer()