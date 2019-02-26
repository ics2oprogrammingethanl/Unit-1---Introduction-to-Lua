-----------------------------------------------------------------------------------------
-- Title: DisplayShapes
-- Name: Ethan L
-- Course: ICS2O/3C
-- This program displays shapes 
-----------------------------------------------------------------------------------------
-- hides the status bar
display.setStatusBar(display.HiddenStatusBar)

local halfW = display.contentWidth * 0.5
local halfH = display.contentHeight * 0.5
local myPentagon
local pentagonVertices = { 128, 48, 204.8, 120, 153.6, 240, 102.4, 240, 51.2, 120, }

myPentagon = display.newPolygon( halfW, halfH, pentagonVertices )

myPentagon.anchorX = 256
myPentagon.anchorY = 0
myPentagon.x = 256
myPentagon.y = 20
---------------------------------------------------------------------------------------
local halfW = display.contentWidth * 0.5
local halfH = display.contentHeight * 0.5

local hexagonVertices = { 358.4, 48, 409.6, 48, 460.8, 144, 409.6, 240, 358.4, 240, 307.2, 144, }
local myHexagon

myHexagon = display.newPolygon( halfW, halfH, hexagonVertices )

myHexagon.anchorX = 512
myHexagon.anchorY = 0
myHexagon.x = 512
myHexagon.y = 20
---------------------------------------------------------------------------------------
local halfW = display.contentWidth * 0.5
local halfH = display.contentHeight * 0.5

local octogonVertices = { 614.4, 48, 665.6, 48, 716.8, 96, 716.8, 144, 665.6, 192, 614.4, 192, 563.2, 144, 563.2, 96, }
local myOctogon

myOctogon = display.newPolygon( halfW, halfH, octogonVertices )

myOctogon.anchorX = 768
myOctogon.anchorY = 0
myOctogon.x = 768
myOctogon.y = 20
---------------------------------------------------------------------------------------
local halfW = display.contentWidth * 0.5
local halfH = display.contentHeight * 0.5

local triangleVertices = { 819.2, 48, 972.8, 48, 895.9, 192, }
local myTriangle

myTriangle = display.newPolygon( halfW, halfH, triangleVertices )

myTriangle.anchorX = 1024
myTriangle.anchorY = 0
myTriangle.x = 1024
myTriangle.y = 20