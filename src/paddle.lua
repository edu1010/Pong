local Object =Object or require "Object"
paddle = Object:extend()

local paddleX
local paddleY
local paddleSpeed
local player

function paddle:new(player,x,y)
  self.paddleX = x
  self.paddleY = y
  self.paddleSpeed = 120
  self.player = player or nil
end

function paddle:update(dt, ball)
 if player then
   --MovePlayer()
 else
   --cpu(ball)
 end
end
function MovePlayer()
  if love.keyboard.isDown("up") then
    self.playerY = self.playerY -1 *self.paddleSpeed *dt
  elseif love.keyboard.isDown("down") then
    self.playerY = self.playerY +1 *self.paddleSpeed *dt
  end
end

function cpu(ball)
  if math.abs(self.paddleY - ball.ballY) < 20 then --Continue
    self.paddleY = self.paddleY-1 * self.paddleSpeed *dt
  elseif (ball.ballY > self.paddleY+20) then --Down
    subir = false
    self.paddleY = self.paddleY+1 * self.paddleSpeed *dt
  else --Up
    subir = true
  end
  
  if(subir)then
    self.paddleY = self.paddleY-1 * self.paddleSpeed *dt
  else
    self.paddleY = self.paddleY+1 * self.paddleSpeed *dt
  end
end