-----------------------------------------------------------------------------------------
-- Title: DisplayShapes
-- Name: Ethan L
-- Course: ICS2O/3C
-- This program displays shapes 
-----------------------------------------------------------------------------------------
local halfW = display.contentWidth * 0.5
local halfH = display.contentHeight * 0.5
local myPentagon
local pentagonVertices = { 153.6, 48, 204.8, 144, 102.4, 240, 51.2, 192, 51.2, 96, }

myPentagon = display.newPolygon( halfW, halfH, pentagonVertices )

myPentagon.anchorX = 0
myPentagon.anchorY = 0
myPentagon.x = 20
myPentagon.y = 20
---------------------------------------------------------------------------------------
local halfW = display.contentWidth * 0.5
local halfH = display.contentHeight * 0.5

local hexagonVertices = { 358.4, 48, 409.6, 48, 460.8, 144, 409.6, 240, 358.4, 240, 307.2, 144, }
local myHexagon

myHexagon = display.newPolygon( halfW, halfH, hexagonVertices )

myHexagon.anchorX = 256
myHexagon.anchorY = 0
myHexagon.x = 400
myHexagon.y = 20
---------------------------------------------------------------------------------------
local halfW = display.contentWidth * 0.5
local halfH = display.contentHeight * 0.5

local octogonVertices = { 358.4, 48, 409.6, 48, 460.8, 144, 409.6, 240, 358.4, 240, 307.2, 144, }
local myOctogon

myOctogon = display.newPolygon( halfW, halfH, octogonVertices )

myOctogon.anchorX = 256
myOctogon.anchorY = 0
myOctogon.x = 400
myOctogon.y = 20