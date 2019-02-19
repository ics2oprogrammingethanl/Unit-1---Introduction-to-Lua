---------------------------------------------------------------------------------------------
-- Name: Ethan. L
-- Course: ICS2O/3C
-- This program displays Hello, World on the iPad simulator and "Hellooooooo!" to the command
-- terminal.
---------------------------------------------------------------------------------------------

-- print "Hellooooooo" to the command console
print ("Hellooooooo!")

-- print "This is awesome!" to the command console
print ("This is awesome!")

-- print "Subscribe to Pewdiepie" to the command console
print ("Subscribe to Pewdiepie")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault("background", 0/255, 0/255, 255/255)

-- create my text object
local textObject

--create my signature text object
local textObjectSignature

-- display "Hello, World!" to the iPad
textObject = display.newText("Hello, World!", 500, 350, nil, 90)

-- sets the colour of the text to green
textObject:setTextColor(155/255, 255/255, 0/255)

-- display "By: Ethan LeGault" to the iPad
textObjectSignature = display.newText("By: Ethan LeGault", 500, 650, nil, 50)

-- sets the colour of the text to orange
textObjectSignature:setTextColor(255/255, 125/255, 0/255)