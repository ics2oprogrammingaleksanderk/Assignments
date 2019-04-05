-- Title: LivesAndTimers
-- Name: Aleksander Kucy
-- Course: ICS2O
----------------------------------------------------------------

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets a background color
display.setDefault("background", 50/255, 50/255, 200/255)

---------------------------------------------------------------------------------
--LOCAL VARIABLES
---------------------------------------------------------------------------------

-- create local variables
local questionObject
local answerObject
local correctObject
local incorrectobject
local numericfield
local randomnumber1
local randomnumber2
local randomnumber3 
local randomnumber4
local randomnumber5
local randomnumber6
local randomnumber7
local randomnumber8
local useranswer
local correctanswer
local randomOperator
local correctSound = audio.loadSound( "Sounds/correctSound.mp3")
local correctSoundChannel
local wrongSound = audio.loadSound( "Sounds/wrongSound.mp3")
local whackSound = audio.loadSound( "Sounds/whack.mp3")
local cashSound = audio.loadSound( "Sounds/cash.mp3")
local wrongSoundChannel
local totalSeconds = 11
local secondsLeft = 11
local clockText
local countDownTimer
local points = 0
local pointsText = display.newText("Points = ".. points, display.contentWidth/7, display.contentHeight/5, nil, 60)
local lives = 3
local heart1
local heart2
local heart3
local temp
local deathscreen = display.newImageRect("Images/gameOver.png", 1024, 768)
local winScreen = display.newImageRect("Images/YouWin.png", 1024, 768)
-------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------------------------------------------
deathscreen:translate(512, 384)
deathscreen:toFront()
deathscreen.isVisible = false

winScreen:translate(512, 384)
winScreen:toFront()
winScreen.isVisible = false

local function UpdateTime()
	-- number of second decremented
	secondsLeft = secondsLeft - 1

	--displays the number of seconds left
	clockText.text = secondsLeft ..""
	if (points == 5) then
		winScreen.isVisible = true
		questionObject.isVisible = false
		numericfield.isVisible = false  	
		timer.cancel(countDownTimer)
		clockText.isVisible = false
		pointsText.isVisible = false
		heart1.isVisible = false
		heart2.isVisible = false
		heart3.isVisible = false
		audio.play(cashSound)
	end

	if (secondsLeft == 0) then
		--resets the seconds
		lives = lives - 1
		secondsLeft = totalSeconds

		
		if  (lives == 2) then
			heart3.isVisible = false
		elseif (lives == 1) then
			heart2.isVisible = false
        elseif (lives == 0) then    	
			heart1.isVisible = false
			timer.cancel(countDownTimer)  
			deathscreen.isVisible = true
			questionObject.isVisible = false
			numericfield.isVisible = false  	
			clockText.isVisible = false		
			audio.play(whackSound)

		end
	end	
end

local function StartTimer()
	countDownTimer = timer.performWithDelay(2100, UpdateTime, 0)
end


local function AskQuestion()
	
	randomOperator = math.random(1, 4)
	randomOperator = 2
 	
	
 -- correctAnswer
	if (randomOperator == 1) then
		randomnumber1 = math.random(1, 20)
		randomnumber2 = math.random(1, 20)

		correctanswer = randomnumber1 + randomnumber2
		
		questionObject.text = randomnumber1 .. " + " .. randomnumber2 .. " = "			
	elseif (randomOperator == 2) then
		randomnumber3 = math.random(10, 20)
		randomnumber4 = math.random(1, 10)


		correctanswer = randomnumber3 + randomnumber4
		temp = randomnumber3
		randomnumber3 = correctanswer
		correctanswer = temp
		questionObject.text = randomnumber3 .. " - " .. randomnumber4 .. " = "
		
	elseif (randomOperator == 3) then

		randomnumber5 = math.random(1, 10)
		randomnumber6 = math.random(1, 10)
		
		correctanswer = randomnumber5 * randomnumber6
		questionObject.text = randomnumber5 .. " * " .. randomnumber6 .. " = "

		
	elseif (randomOperator == 4) then
		randomnumber7 = math.random(1, 10)
		randomnumber8 = math.random(1, 10)

		correctanswer = randomnumber7 * randomnumber8
		temp = randomnumber7
		randomnumber7 = correctanswer
		correctanswer = temp

		questionObject.text = randomnumber7 .. " / " .. randomnumber8 .. " = "	
	end
end	

----------------------------------------------------------------------------

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function Hideincorrect()
	incorrectobject.isVisible = false
	answerObject.isVisible = false
	AskQuestion()
end


local function NumericFieldListener( event )
	-- usernbegins editing the "numericfield"
	if (event.phase =="began") then

	elseif (event.phase == "submitted") then

		--when the enter key is pressed set user input to user answer 
		useranswer = tonumber(event.target.text)

		--if users asnwer is correct
		if (useranswer == correctanswer) then
			correctObject.isVisible = true
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay(3000, HideCorrect) 
			points = points + 1
			pointsText.text = "Points = ".. points
			secondsLeft = totalSeconds
		else
			incorrectobject.isVisible = true
			wrongSoundChannel = audio.play(wrongSound)
			timer.performWithDelay(3000, Hideincorrect)
			answerObject.text = "The correct answer is " .. correctanswer
			timer.performWithDelay(3000, answerObject)
			lives = lives - 1
			secondsLeft = totalSeconds
		end

		if (lives == 2) then
			heart3.isVisible = false
		elseif (lives == 1) then
			heart2.isVisible = false
		elseif (lives == 0) then
			heart1.isVisible = false
			timer.cancel(countDownTimer)
			deathscreen.isVisible = true
			questionObject.isVisible = false
			numericfield.isVisible = false  	
			clockText.isVisible = false	
			audio.play(whackSound)
		end	
		--clear text field
		event.target.text = ""
	end
end


-----------------------------------------------------------------------
--OBJECT CREATION
-----------------------------------------------------------------------
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 8

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 8

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 8


--displays a question
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor (0, 0.5, 0.5)

answerObject = display.newText("", display.contentWidth/3, display.contentHeight/1.5, nil, 50)
answerObject:setTextColor (1, 1, 0)


--create the correct text object
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentWidth*2/3, nil, 50)
correctObject:setTextColor(1, 1, 0)
correctObject.isVisible = false

--create the incorrect text object 
incorrectobject = display.newText( "Incorrect!", display.contentWidth/2, display.contentWidth*2/3, nil, 50)
incorrectobject:setTextColor(1, 1, 0)
incorrectobject.isVisible = false

-- create numeric field
numericfield = native.newTextField( display.contentWidth*0.7, display.contentHeight/2, 200, 80)
numericfield.inputType = "default"

--add a listener
numericfield:addEventListener( "userInput", NumericFieldListener )

clockText = display.newText("", display.contentWidth/8, display.contentHeight/8, nil, 50)

-----------------------------------------------------------------
--FUNCTION CALLS
----------------------------------------------------------------

--call the function to ask
AskQuestion()

StartTimer()

