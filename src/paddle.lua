local Object = Object or require "lib/Classic"
paddle = Object:extend()

local paddleX
local paddleY
local paddleSpeed
local player
local paddleW 
local paddleH
local spritePl

function paddle:new(player,x,y,paddleSpeed,paddleW,paddleH)
  self.spritePl = love.graphics.newImage("image/paddlePlayer.png")
  
  self.paddleX = x
  self.paddleY = y
  self.paddleSpeed = paddleSpeed
  self.player = player or true
  self.paddleW = paddleW
  self.paddleH = paddleH
end

function paddle:update(player,dt, ball)
 if player then
   MovePlayer(self,dt)
 else
   cpu(self,ball,dt)
 end
end
function paddle:draw()
    
  love.graphics.draw(self.spritePl, self.paddleX, self.paddleY)
end
function MovePlayer(self,dt)
  
  if love.keyboard.isDown("up") then
    self.paddleY = self.paddleY -1 * self.paddleSpeed *dt
  elseif love.keyboard.isDown("down") then
    self.paddleY= self.paddleY +1 * self.paddleSpeed  *dt
  end
end

function cpu(self,ball,dt)
  if math.abs((self.paddleY+25) - ball.ballY) < 20 then --Continue
    
  elseif (ball.ballY > self.paddleY+20) then --Down
    subir = false
    
  else --Up
    subir = true
    
  end
  
  if(subir)then
    self.paddleY = self.paddleY-1 * self.paddleSpeed *dt
  else
    self.paddleY = self.paddleY+1 * self.paddleSpeed *dt
  end
end