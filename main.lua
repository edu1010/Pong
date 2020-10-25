local w, h -- Variables to store the screen width and height
local Object = require "lib/classic"
require "src/ball"
require "src/paddle"
require "src/score"
require "src/sonido"
require "src/menu"
require "src/gameflow"
require "src/requestName"
require "src/win"
require "src/lose"
require "data"



local b --Ball
local p --Player
local c --Cpu
local s --Score
local m --menu
local g --gameflow
local so -- Sonido
local rN --requestName
local wi --win
local l --lose

function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  w, h = love.graphics.getDimensions() -- Get the screen width and height
  
  b = ball(w/2,h/2,h,w,ballSpeed,ballSpeedIncrease,radio,timer,paddleW,paddleH)
  p = paddle(true,w-w+100,h/2,paddleSpeed,paddleW,paddleH)
  c = paddle(true,w-100,h/2,paddleSpeed,paddleW,paddleH)
  s = score(sizeFont, scoreH)
  m = menu(w,h,sizeFont)
  g = gameflow(duracionPartida)
  so = sonido()
  rN = requestName(w,h)
  wi = win(w,h)
  l = lose(w,h)
end

function love.update(dt)
  g:update(dt,s,rN)
 -- print(g.timerPartida)
  --print(g.restar1)
  --print(g.resetTimer)
  
  if g:menu() then
    m:update(dt,g)
  end
  if g:requestName() then 
    rN:update(dt,g)
  end
  if g:play() then
    b:update(dt, p,c,s,so)
    p:update(true,dt, b)
    c:update(false,dt, b)
    s:update(so)
    so:update()
  end
  if g:gameOver(b,s,p,c,m) then
    l:update(dt,g)
  end
  if g:win(b,s,p,c,m) then
    wi:update(dt,g)
  end

end

function love.draw()
  if g:menu() then
    m:draw()
  end
   if g:requestName() then 
    rN:draw()
  end
  if g:play() then
    b:draw()
    p:draw()
    c:draw()
    s:draw(w,h,g)
    so:draw()
  end
  if g:gameOver() then
    l:draw()
  end
  if g:win() then
    wi:draw()
  end
end