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

-----------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------
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
			
		elseif (userAnswer ~= correctAnswer) then
			incorrectObject.isVisible = true
			correctObject.isVisible = false
			timer.performWithDelay(3000, HideIncorrect)

			incorrectSoundChannel = audio.play(incorrectSound)
		end
		-- clear text field
		event.target.text = ""

	end
end

---------------------------------------------------------------------------------
-- OBJECT CREATION
---------------------------------------------------------------------------------

-- displays a question and sets the colour
questionObject = display.newText( "", 300, display.contentHeight/5, nil, 80)
questionObject:setTextColor(255/255, 255/255, 255/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(0/255, 211/255, 198/255)
correctObject.isVisible = false

-- Create numeric field
numericField = native.newTextField( 650, display.contentHeight/5, 300, 100 )
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