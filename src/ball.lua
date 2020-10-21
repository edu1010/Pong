ball = Object:extend()

local ballX, ballY -- Variables to store the position of the ball in the screen 
local ballSpeed
local ballAngle

function ball:new(x,y)
  self.ballX = x
  self.ballY = y
  self.ballSpeed = 100
  self.ballAngle = math.rad(210)
end



function ball:update(dt)
 
  self.ballX= self.ballX + math.cos(self.ballAngle) * self.ballSpeed * dt
  self.ballY= self.ballY + math.sin(self.ballAngle) * self.ballSpeed * dt
  
end

function ball:draw()
  love.graphics.circle("fill",self.ballX,self.ballY,5.0)
end




function colision(rectX, rectY)
  DeltaX = self.ballX - math.max(rectX, math.min(self.ballX, rectX + 10))
  DeltaY = self.ballY - math.max(rectY, math.min(self.ballY, rectY + 50))
  return (DeltaX * DeltaX + DeltaY * DeltaY) < (5 * 5)
end

function colisionParedes()
  local pared = false
  if this.ballY+5<0 then
    pared = true
    self.ballY = self.ballY+15
    end
  if this.ballY+5>h then
    pared = true
    self.ballY = self.ballY-15
  end
  return pared
end

function colisionPorteria()
  local porteria = false
  if self.ballX+5<0 or self.ballX+5>w then
    porteria = true
    if self.ballX+5<0 then
      cpuPoints = cpuPoints + 1
    elseif self.ballX+5>h then
      playerPoints = playerPoints + 1
    end
  end
  return porteria
end
