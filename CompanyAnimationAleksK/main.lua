--------------------------------------------------------
--Name:Company Logo
--Coder: Aleksaner Kucy
--Course: ICS2O

--------------------------------------------------------
--LOCAL FILES
--------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

local bkg = display.newImageRect ("Images/racetrack.jpg", display.contentWidth, display.contentHeight)
bkg.anchorX = 0
bkg.anchorY = 0
bkg.x = 0
bkg.y = 0

local car = display.newImageRect ("Images/companylogo.png", 500, 300)
car.x = 500
car.y = display.contentHeight/2

local smoke = display.newImageRect ("Images/smoke.png", 300, 200)
smoke.x = 110
smoke.y = 450
local sound
local RMgames = display.newText("RM Games", -250, display.contentHeight/2, nil, 80)

------------------------------------------------------------------
-- functions
------------------------------------------------------------------

local function MoveCar(event)
	-- add scroll speed
	car.x = car.x + 4
	smoke.x = smoke.x + 4
end

Runtime:addEventListener("enterFrame", MoveCar)


local function MoveText(event)
	-- add scroll speed
	RMgames.x = RMgames.x + 4
end

local function cancelText(event)
	transition.cancel(MoveText)
end
Runtime:addEventListener("enterFrame", MoveText)
timer.performWithDelay(2000, cancelText)