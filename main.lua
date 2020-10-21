local w, h -- Variables to store the screen width and height
local Object = require "lib/classic"
require "src/ball"
require "src/paddle"

local ballX, ballY -- Variables to store the position of the ball in the screen (Uncomment at the start of TODO 6)
local ballSpeed -- Variable to store the ball speed (Uncomment at the start of TODO 8)
local playerX, playerY, cpuX, cpuY -- Variables to store the position of the player and cpu paddle (Uncomment at the start of TODO 10)
local paddleSpeed -- Variable to store the paddle speed (Uncomment at the start of TODO 12)
local ballAngle -- Variable to estore the ball movement angle (Uncomment at the start of TODO 16)
local playerPoints, cpuPoints -- Variable to store the player and cpu points (Uncomment at the start of TODO 21)
local timer --Timers to correct moments when the ball loops after collision with floor
local timerPaddle
local Subir

local b

function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  
  
  
  
  w, h = love.graphics.getDimensions() -- Get the screen width and height
  
  b = ball(w/2,h/2)
  c = paddle(w-100,h/2)
  
  -- TODO 5: Load the font to use in the game and set it
  font = love.graphics.newFont( "pong.ttf",50)
  love.graphics.setFont( font )
  -- TODO 6: Initialize the position of the ball at the center of the screen
  ballX = w/2
  ballY = h/2
  -- TODO 8: Initialize the ball speed for going to the left
  --ballSpeed=-50
  -- TODO 10: Initialize the player and cpu paddles position
  playerX = w-w+100
  playerY = h/2
  cpuX = w-100
  cpuY = h/2
  -- TODO 12: Initialize the paddle speed
  paddleSpeed = 120
  -- TODO 16: Initialize the ball angle
  ballAngle=math.rad(210)

  -- TODO 18: Comment all the code of the TODO 8 and initialize the ball speed without sign
  ballSpeed=100
  -- TODO 21: Initialize the player and cpu points variables
  playerPoints = 0
  cpuPoints = 0
  --Timers to correct moments when the ball loops
  timer = 2.0
  timerPaddle=2.0
  subir=true
end

function colision(rectX, rectY)
  DeltaX = ballX - math.max(rectX, math.min(ballX, rectX + 10))
  DeltaY = ballY - math.max(rectY, math.min(ballY, rectY + 50))
  return (DeltaX * DeltaX + DeltaY * DeltaY) < (5 * 5)
end
function colisionParedes()
  local pared = false
  if ballY+5<0 then
    pared = true
    ballY= ballY+15
    end
  if ballY+5>h then
    pared = true
    ballY= ballY-15
  end
  return pared
end

function colisionPorteria()
  local porteria = false
  if ballX+5<0 or ballX+5>w then
    porteria = true
    if ballX+5<0 then
      cpuPoints = cpuPoints + 1
    elseif ballX+5>h then
      playerPoints = playerPoints + 1
      end
  end
  return porteria
  end

function love.update(dt)
  b:update(dt, c)
  c:update(dt, b)
  
  timer=timer+dt
  timerPaddle=timerPaddle+dt
  -- TODO 9: Make the ball move using the ballSpeed variable
  --ballX=ballX+ballSpeed*dt
  
  -- TODO 17: Comment all the code of the TODO 9 and make the ball move using the ballAngle variable
  ballX= ballX+math.cos(ballAngle)*ballSpeed*dt
  ballY= ballY+math.sin(ballAngle)*ballSpeed*dt
  
  -- TODO 13: Move the player paddle getting the up and down arrows keys of the keyboard using the variable paddleSpeed
  if love.keyboard.isDown("up") then
    playerY = playerY -1 *paddleSpeed *dt
  elseif love.keyboard.isDown("down") then
    playerY = playerY +1 *paddleSpeed *dt
  end
  
  -- TODO 19: Comment all the code of the TODO 14 and TODO 15 and make it bounce using the new ball angle
     if colision(playerX,playerY) and timerPaddle >= 2.0 then
      timerPaddle = 0.0
      ballAngle= math.rad(180)-ballAngle
      print(ballAngle)
      ballSpeed=ballSpeed+20
     end
  
     if colision(cpuX,cpuY) and timerPaddle >= 2.0 then
      ballAngle= math.rad(180)-ballAngle
      ballSpeed=ballSpeed+20
     end
  
  -- TODO 20: Detect the ball collision with the top and bottom of the field and make it bounce
  if colisionParedes() and timer >= 2.0 then
    print("Entro")
    timer = 0.0
    ballAngle= math.rad(25) - ballAngle  
  end
  
  -- TODO 26: Add the needed code at TODO 23 to reset the ball speed
  -- TODO 23: Detect the ball collision with the player and cpu sides, increse the points accordingly and reset the ball
  if colisionPorteria() then
    ballX = w/2
    ballY = h/2
    ballSpeed = 100
    ballAngle = math.rad(math.random(180,210))
    end
  
  -- TODO 24: Make the cpu paddle move to get the ball
  if math.abs(cpuY - ballY) < 20 then --Continue
    --cpuY = cpuY-1 * paddleSpeed *dt
  elseif (ballY > cpuY+20) then --Down
    subir = false
    --cpuY = cpuY+1 * paddleSpeed *dt
  else --Up
    subir = true
  end
  
  if(subir)then
    cpuY = cpuY-1 * paddleSpeed *dt
  else
    cpuY = cpuY+1 * paddleSpeed *dt
  end
  
    
end

function love.draw()
  b:draw()
  c:draw()
  -- TODO 1: Draw the center of the field
  
  love.graphics.line( w/2, 0,w/2,h)
  -- TODO 2: Draw the ball at the center of the field
  --love.graphics.circle( "fill", w/2, h/2, 2.0 )
  -- TODO 3: Draw the player and cpu paddles
  --love.graphics.rectangle( "fill", w-w+100, h/2, -5, 25 )
  --love.graphics.rectangle( "fill", w-100, h/2, -5, 25 )
  -- TODO 4: Draw the player and cpu points
  --[[
  love.graphics.print("0",(w/4),20)
  love.graphics.print("0",(3*((w/4))),20)
  ]]--
  -- TODO 7: Comment all the code of the TODO 2 and use the ballX and ballY variables to draw the ball
  love.graphics.circle("fill",ballX,ballY,5.0)
  -- TODO 11: Comment all the code of the TODO 3 and use the playerX, playerY, cpuX and cpuY variables to draw the player and cpu paddles
  love.graphics.rectangle( "fill", playerX, playerY, -5, 25 )
  love.graphics.rectangle( "fill", cpuX, cpuY, -5, 25 )
  -- TODO 22: Comment all the code of the TODO 4 and use the playerPoints and cpuPOints variables to draw the points
  love.graphics.print(playerPoints,(w/4),20)
  love.graphics.print(cpuPoints,(3*((w/4))),20)
end