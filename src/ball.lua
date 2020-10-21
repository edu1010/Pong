local Object =Object or require "Object"
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
  DeltaX = this.ballX - math.max(rectX, math.min(this.ballX, rectX + 10))
  DeltaY = this.ballY - math.max(rectY, math.min(this.ballY, rectY + 50))
  return (DeltaX * DeltaX + DeltaY * DeltaY) < (5 * 5)
end

function colisionParedes()
  local pared = false
  if this.ballY+5<0 then
    pared = true
    this.ballY = this.ballY+15
    end
  if this.ballY+5>h then
    pared = true
    this.ballY = this.ballY-15
  end
  return pared
end

function colisionPorteria()
  local porteria = false
  if this.ballX+5<0 or this.ballX+5>w then
    porteria = true
    if this.ballX+5<0 then
      cpuPoints = cpuPoints + 1
    elseif this.ballX+5>h then
      playerPoints = playerPoints + 1
    end
  end
  return porteria
end
