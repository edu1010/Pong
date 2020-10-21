ball = Object:extend()

local ballX, ballY -- Variables to store the position of the ball in the screen 
local ballSpeed
local ballAngle

function ball:new(x,y)
  self.ballX = x
  self.ballY = y
  self.ballSpeed = 100
  self.ballAngle=180
end

function ball:update(dt)
 
  print("self",self,dt)
  self.ballX= self.ballX + math.cos(self.ballAngle) * self.ballSpeed * dt
  
  self.ballY= self.ballY + math.sin(self.ballAngle) * self.ballSpeed * dt
end

function ball:draw()
  love.graphics.circle("fill",self.ballX,self.ballY,5.0)
end
