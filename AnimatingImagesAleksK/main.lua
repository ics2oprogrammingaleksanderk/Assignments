-- Title: AnimatingImages
-- Name: Aleksander Kucy
-- Course: ICS2O/3C
----------------------------------------------------------------------------------------
-- create local variables
local background = display.newImageRect ("Lothric.jpg", 1024, 768)
background:translate( 512, 384)

local Cinder = display.newImageRect("SoulofCinder.png", 250, 400)
Cinder:translate(125, 500)

local Friede = display.newImageRect("SisterFriede.png", 250, 400)
Friede:translate(512, 500)

local Gael = display.newImageRect("Slave.Knight.Gael.png", 300, 400)
Gael:translate(850, 500)

display.setStatusBar(display.HiddenStatusBar)

--add a text object
local text = display.newText("By: Aleksander Kucy", 512, 20, nil, 50)
text:setFillColor(0.2, 0.3, 0.5)
-- global variables
scrollSpeed = 3

-- set the image transparent
Cinder.alpha = 1

-- set the initial x,y 
Cinder.x = 125
Cinder.y = 500

--Function move ship
--Input: this function accepts an event listener
--Output: none
--Description: add scroll speed
local function MoveCinder(event)
	-- add the scroll speed
	Cinder.x = Cinder.x + scrollSpeed
	-- change fading the ship
	Cinder.alpha = Cinder.alpha - 0.01	 
end

--Moveship will be called over and over
Runtime:addEventListener("enterFrame", MoveCinder)
----------------------------------------------------------------------------------

local scrollSpeed2 = -4 

local spinSpeed = 3

--change the direction
Friede:scale(-1, 1)

-- set the image visable
Friede.alpha = 1

-- set the initial x,y 
Friede.x = 512
Friede.y = 500


--Function move ship
--Input: this function accepts an event listener
--Output: none
--Description: add scroll speed
local function MoveFriede(event)
	-- add the scroll speed
	Friede.x = Friede.x + scrollSpeed2
	-- change fading the ship
	Friede.alpha = Friede.alpha - 0.002
	Friede:rotate(10)
	Friede:scale(1.01^-1, 1.01^-1)

end

--Moveship will be called over and over
Runtime:addEventListener("enterFrame", MoveFriede)
-----------------------------------------------------------------

local spinSpeed = 3

--change the direction
Gael:scale(-1, 1)

-- set the image visable
Gael.alpha = 1

-- set the initial x,y 
Gael.x = 850
Gael.y = 500


--Function move ship
--Input: this function accepts an event listener
--Output: none
--Description: add scroll speed
local function MoveGael(event)
	-- add the scroll speed
	Gael.x = Gael.x + scrollSpeed2
	Gael.y = Gael.y + scrollSpeed2
	Gael:rotate(10)
end 

--Moveship will be called over and over
Runtime:addEventListener("enterFrame", MoveGael)
