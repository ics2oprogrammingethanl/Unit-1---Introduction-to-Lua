-----------------------------------------------------------------------------------------
-- Title: AreaOfRectangleAndCircle
-- Name: Ethan. L
-- Course: ICS2O/3C
-- This program displays a coloured rectangle with a border of a different colour. It also calculates the rectangle's area and displays it on the screen. 
-- Then I added the code to draw a circle of a given radius that is coloured and a border of a different colour. I used the radius to calculate the area and displayed this on the iPad.
-----------------------------------------------------------------------------------------

--create my local variables
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle

--set the background colour of my screen. Remember that colours are between 0 and 1.
display.setDefault("background", 0/255, 153/255, 76/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- set the width of the border
myRectangle.strokeWidth = 20

--set the colour of the rectangle
myRectangle:setFillColor(1, 1, 1)

-- set the colour of the border
myRectangle:setStrokeColor(0, 0, 0)

-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaText = display.newText("The area of this rectangle with a width of \n" ..
	widthOfRectangle .. " and a height of " .. heightOfRectangle ..  " is " ..
	areaOfRectangle .. " pixels².", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/2

-- set the colour of the newText
areaText:setTextColor(1, 1, 1)

--------------------------------------------------------------------------------------------

--create my local variables
local areaText2
local textSize2 = 50
local myCircle
local radiusOfCircle = 100
local areaOfCircle
local PI = 3.14

-- draw the rectangle that is half the width and height of the screen size
myCircle = display.newCircle(0, 0, radiusOfCircle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myCircle.anchorX = 0
myCircle.anchorY = 0
myCircle.x = 800
myCircle.y = 0

-- set the width of the border
myCircle.strokeWidth = 20

--set the colour of the rectangle
myCircle:setFillColor(0, 0, 0)

-- set the colour of the border
myCircle:setStrokeColor(1, 1, 1)

-- calculate the area
areaOfCircle = PI * radiusOfCircle * radiusOfCircle

-- write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaText2 = display.newText("The area of this circle with a radius of \n" ..
	radiusOfCircle .. "" ..  " is " ..
	areaOfCircle .. " pixels².", 0, 0, Arial, textSize2)

-- anchor the text and set its (x,y) position
areaText2.anchorX = 0
areaText2.anchorY = 100
areaText2.x = 20
areaText2.y = display.contentHeight/2

-- set the colour of the newText2
areaText2:setTextColor(0, 0, 0)