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

local b --Ball
local p --Player
local c --Cpu

function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  w, h = love.graphics.getDimensions() -- Get the screen width and height
  
  -- TODO 5: Load the font to use in the game and set it
  font = love.graphics.newFont( "pong.ttf",50)
  love.graphics.setFont( font )
  
  ballX = w/2
  ballY = h/2

  playerX = w-w+100
  playerY = h/2
  cpuX = w-100
  cpuY = h/2
 
  -- TODO 21: Initialize the player and cpu points variables
  playerPoints = 0
  cpuPoints = 0
  --Timers to correct moments when the ball loops
  timer = 2.0
  timerPaddle=2.0
  subir=true
   b = ball(w/2,h/2,h)
  p = paddle(true,w-w+100,h/2)
  c = paddle(true,w-100,h/2)
  
end


function love.update(dt)
  b:update(dt, p,c)
  p:update(true,dt, b)
  c:update(false,dt, b)
  
  timer=timer+dt
  timerPaddle=timerPaddle+dt
  
    
end

function love.draw()
  b:draw()
  p:draw()
  c:draw()
  
end