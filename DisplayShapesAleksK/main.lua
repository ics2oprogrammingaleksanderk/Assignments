-- Title: DisplayShapes
-- Name: AleksK
-- Course: ICS2O/3C
-- This program displays 3+ shapes of different colors and borders on the ipad. 
--Underneeth a shape is it's name.


-- create local variables 
local halfW = display.contentWidth * 0.5
local halfH = display.contentHeight * 0.5
local verticies = {256, -150.4, 153.6, 102.4, 409.6, 102.4, }
local triangle
triangle = display.newPolygon( halfW, halfH, verticies)

triangle.anchorX = 256
triangle.anchorY = 384 
triangle.x = 260
triangle.y = display.contentHeight/2 

textObject = display.newText("Triangle", 130, 450, nil, 50)

--set background clolor
display.setDefault("background" , 0.6, 0.2, 1)

-- remove the status bar
display.setStatusBar(display.HiddenStatusBar)

local borderpaint = { 0, 0, 1, }
triangle.stroke = borderpaint
triangle.strokeWidth = 10
local paintTriangle = {0, 1, 0, }
triangle.fill = paintTriangle

------------------------------------------------------------------------------------
-- local variables
local HalfW2 = display.contentWidth * 0.5
local HalfH2 = display.contentHeight * 0.5
local verticies2 = {488, -274, 619, -274, 565, 102, 377, 102}
local parallelogram
parallelogram = display.newPolygon( HalfH2, HalfW2, verticies2)

parallelogram.anchorX = 512
parallelogram.anchorY = 384
parallelogram.x = 612
parallelogram.y = 384

local paintparallelogram = {0, 0, 0, }
parallelogram.fill = paintparallelogram

textObject = display.newText("Parallelogram", 750, 200, nil, 50)
------------------------------------------------------------------------------------
local HalfH3 = display.contentHeight * 0.5
local HalfW3 = display.contentWidth * 0.5
local verticies3 ={675, -200, 900, -200, 1000, -100, 1000, 100, 900, 200, 675, 200, 550, 100, 550, -100}
local octagon
octagon = display.newPolygon( HalfW3, HalfH3, verticies3)

octagon.anchorX = 900
octagon.anchorY = 384
octagon.x = 1000
octagon.y = 760

textObject = display.newText("octagon", 450, 500, nil, 50)

local borderpaint3 = { 0, 0, 1, }
octagon.stroke = borderpaint3
octagon.strokeWidth = 10

local paintoctagon = { 0.3, 0.9, 0.5, }
octagon.fill = paintoctagon