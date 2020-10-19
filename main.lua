local w, h -- Variables to store the screen width and height

local ballX, ballY -- Variables to store the position of the ball in the screen (Uncomment at the start of TODO 6)
local ballSpeed -- Variable to store the ball speed (Uncomment at the start of TODO 8)
local playerX, playerY, cpuX, cpuY -- Variables to store the position of the player and cpu paddle (Uncomment at the start of TODO 10)
local paddleSpeed -- Variable to store the paddle speed (Uncomment at the start of TODO 12)
local ballAngle -- Variable to estore the ball movement angle (Uncomment at the start of TODO 16)
--local playerPoints, cpuPoints -- Variable to store the player and cpu points (Uncomment at the start of TODO 21)

function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  
  w, h = love.graphics.getDimensions() -- Get the screen width and height
  
  -- TODO 5: Load the font to use in the game and set it
  font = love.graphics.newFont( "pong.ttf",50)
  love.graphics.setFont( font )
  -- TODO 6: Initialize the position of the ball at the center of the screen
  ballX = w/2
  ballY = h/2
  -- TODO 8: Initialize the ball speed for going to the left
  ballSpeed=-50
  -- TODO 10: Initialize the player and cpu paddles position
  playerX = w-w+100
  playerY = h/2
  cpuX = w-100
  cpuY = h/2
  -- TODO 12: Initialize the paddle speed
  paddleSpeed = 2
  -- TODO 16: Initialize the ball angle
  ballAngle=math.rad(0)
  -- TODO 18: Comment all the code of the TODO 8 and initialize the ball speed without sign
  
  -- TODO 21: Initialize the player and cpu points variables
end

function colision(rectX, rectY)
  DeltaX = ballX - math.max(rectX, math.min(ballX, rectX + 10));
  DeltaY = ballY - math.max(rectY, math.min(ballY, rectY + 50));
  return (DeltaX * DeltaX + DeltaY * DeltaY) < (5 * 5);
  
end

function love.update(dt)
  -- TODO 9: Make the ball move using the ballSpeed variable
  --ballX=ballX+ballSpeed*dt
  
  -- TODO 17: Comment all the code of the TODO 9 and make the ball move using the ballAngle variable
  ballX= ballX+math.cos(ballAngle)*ballSpeed*dt
  ballY= ballY+math.sin(ballAngle)*ballSpeed*dt
  
  -- TODO 13: Move the player paddle getting the up and down arrows keys of the keyboard using the variable paddleSpeed
  if love.keyboard.isDown("up") then
    playerY = playerY -1 *paddleSpeed
  elseif love.keyboard.isDown("down") then
    playerY = playerY +1 *paddleSpeed
  end
  -- TODO 14: Detect the ball collision with the player paddle and make it bounce
  if colision(playerX,playerY)then
    ballAngle= math.atan(playerX/playerY)+math.rad(180)
    print(ballAngle)
  end
 
  -- TODO 15: Detect the ball collision with the cpu paddle and make it bounce
  if colision(cpuX,cpuY)then
    --ballSpeed=-ballSpeed
    ballAngle= math.atan(ballY/-ballX)+math.rad(180)
  end
  -- TODO 25: Add the needed code at TODO 19 to make the ball quicker at paddle collision
  -- TODO 19: Comment all the code of the TODO 14 and TODO 15 and make it bounce using the new ball angle
  
  -- TODO 20: Detect the ball collision with the top and bottom of the field and make it bounce
  
  -- TODO 26: Add the needed code at TODO 23 to reset the ball speed
  -- TODO 23: Detect the ball collision with the player and cpu sides, increse the points accordingly and reset the ball
  
  -- TODO 24: Make the cpu paddle move to get the ball
end

function love.draw()
  -- TODO 1: Draw the center of the field
  
  love.graphics.line( w/2, 0,w/2,h)
  -- TODO 2: Draw the ball at the center of the field
  --love.graphics.circle( "fill", w/2, h/2, 2.0 )
  -- TODO 3: Draw the player and cpu paddles
  --love.graphics.rectangle( "fill", w-w+100, h/2, -5, 25 )
  --love.graphics.rectangle( "fill", w-100, h/2, -5, 25 )
  -- TODO 4: Draw the player and cpu points
  love.graphics.print("0",((h/2)/2),20)
  love.graphics.print("0",(h-((h/2)/2)),20)
  -- TODO 7: Comment all the code of the TODO 2 and use the ballX and ballY variables to draw the ball
  love.graphics.circle("fill",ballX,ballY,5.0)
  -- TODO 11: Comment all the code of the TODO 3 and use the playerX, playerY, cpuX and cpuY variables to draw the player and cpu paddles
  love.graphics.rectangle( "fill", playerX, playerY, -5, 25 )
  love.graphics.rectangle( "fill", cpuX, cpuY, -5, 25 )
  -- TODO 22: Comment all the code of the TODO 4 and use the playerPoints and cpuPOints variables to draw the points
end