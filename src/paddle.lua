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

function paddle:update(dt)
 if player then
   MovePlayer()
 else
   cpu()
 end
end
function MovePlayer()
  if love.keyboard.isDown("up") then
    playerY = playerY -1 *paddleSpeed *dt
  elseif love.keyboard.isDown("down") then
    playerY = playerY +1 *paddleSpeed *dt
  end
end

function cpu()
  if math.abs(paddleY - ballY) < 20 then --Continue
    self.paddleY = self.paddleY-1 * paddleSpeed *dt
  elseif (ballY > cpuY+20) then --Down
    subir = false
    self.paddleY = self.paddleY+1 * paddleSpeed *dt
  else --Up
    subir = true
  end
  
  if(subir)then
    self.paddleY = paddleY-1 * paddleSpeed *dt
  else
    self.paddleY = paddleY+1 * paddleSpeed *dt
  end
end