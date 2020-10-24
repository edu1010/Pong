local w, h -- Variables to store the screen width and height
local Object = require "lib/classic"
require "src/ball"
require "src/paddle"
require "src/score"
require "src/sonido"
require "data"



local b --Ball
local p --Player
local c --Cpu
local s --Score
local so -- Sonido

function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  w, h = love.graphics.getDimensions() -- Get the screen width and height
  
  b = ball(w/2,h/2,h,w,ballSpeed,ballSpeedIncrease,radio,timer,paddleW,paddleH)
  p = paddle(true,w-w+100,h/2,paddleSpeed,paddleW,paddleH)
  c = paddle(true,w-100,h/2,paddleSpeed,paddleW,paddleH)
  s = score(sizeFont, scoreH)
  so = sonido()
end

function love.update(dt)
  b:update(dt, p,c,s,so)
  p:update(true,dt, b)
  c:update(false,dt, b)
  s:update(so)
  so:update()
  
end

function love.draw()
  b:draw()
  p:draw()
  c:draw()
  s:draw(w,h)
  so:draw()
  
end