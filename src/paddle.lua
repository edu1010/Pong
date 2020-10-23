local Object = Object or require "lib/Classic"
paddle = Object:extend()

local paddleX
local paddleY
local paddleSpeed
local player

function paddle:new(player,x,y)
  self.paddleX = x
  self.paddleY = y
  self.paddleSpeed = 120
  self.player = player or true
end

function paddle:update(player,dt, ball)
 if player then
   MovePlayer(self,dt)
 else
   cpu(self,ball,dt)
 end
end
function paddle:draw()
  
    love.graphics.rectangle( "fill", self.paddleX, self.paddleY, 5, 25 )
end
function MovePlayer(self,dt)
  
  if love.keyboard.isDown("up") then
    self.paddleY = self.paddleY -1 * self.paddleSpeed *dt
  elseif love.keyboard.isDown("down") then
    self.paddleY= self.paddleY +1 * self.paddleSpeed  *dt
  end
end

function cpu(self,ball,dt)
  if math.abs(self.paddleY - ball.ballY) < 20 then --Continue
    
  elseif (ball.ballY > self.paddleY+20) then --Down
    subir = false
    --self.paddleY = self.paddleY+1 * self.paddleSpeed *dt
  else --Up
    subir = true
  end
  
  if(subir)then
    self.paddleY = self.paddleY-1 * self.paddleSpeed *dt
  else
    self.paddleY = self.paddleY+1 * self.paddleSpeed *dt
  end
end