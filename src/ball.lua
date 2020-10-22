local Object = Object or require "lib/Classic"
ball = Object:extend()

local ballX, ballY -- Variables to store the position of the ball in the screen 
local ballXo, ballYo -- Variables to store the position of the ball in the screen in origin
local ballSpeed
local ballAngle
local h
local timer
local timerPaddle

function ball:new(x,y,h,w)
  self.ballX = x
  self.ballXo = x
  self.ballY = y
  self.ballYo = y
  self.ballSpeed = 100
  self.ballAngle = math.rad(210)
  self.h = h
  self.w = w
  self.timer = 2.0
  self.timerPaddle = 2.0
end



function ball:update(dt, player,cpu,score)
  
  self.timer=self.timer+dt
  self.timerPaddle=self.timerPaddle+dt
  
  self.ballX= self.ballX + math.cos(self.ballAngle) * self.ballSpeed * dt
  self.ballY= self.ballY + math.sin(self.ballAngle) * self.ballSpeed * dt
  
  --colision(paddle.paddleX, paddle.paddleY)
  --colisionParedes()
  
  if colision(self,player.paddleX,player.paddleY) and self.timerPaddle >= 2.0 then
      self.timerPaddle = 0.0
      self.ballAngle = math.rad(180)-self.ballAngle
      
      self.ballSpeed = self.ballSpeed+20
     end
  
     if colision(self,cpu.paddleX,cpu.paddleY) and self.timerPaddle >= 2.0 then
      self.ballAngle = math.rad(180)-self.ballAngle
      self.ballSpeed = self.ballSpeed+20
     end
  
  -- TODO 20: Detect the ball collision with the top and bottom of the field and make it bounce
  if colisionParedes(self) and self.timer >= 2.0 then
    print("Entro")
    self.timer = 0.0
    self.ballAngle= math.rad(25) - self.ballAngle  
  end
  
  if colisionPorteria(self,score) then
    self.ballX = self.ballXo
    self.ballY = self.ballYo
    self.ballSpeed = 100
    self.ballAngle = math.rad(math.random(180,210))
  end
  
  
end

function ball:draw()
  love.graphics.circle("fill",self.ballX,self.ballY,5.0)
end


function colision(self,rectX, rectY)
  DeltaX = self.ballX - math.max(rectX, math.min(self.ballX, rectX + 10))
  DeltaY = self.ballY - math.max(rectY, math.min(self.ballY, rectY + 50))
  return (DeltaX * DeltaX + DeltaY * DeltaY) < (5 * 5)
end

function colisionParedes(self)
  local pared = false
  if self.ballY+5 < 0 then
    pared = true
    self.ballY = self.ballY+15
  end
  if self.ballY+5 > self.h then
    pared = true
    self.ballY = self.ballY-15
  end
  return pared
end

function colisionPorteria(self,score)
  local porteria = false
  if self.ballX+5 < 0 or self.ballX+5 > self.w then
    porteria = true
    if self.ballX+5<0 then
      score.cpuPoints = score.cpuPoints + 1
    elseif self.ballX+5 > self.h then
      score.playerPoints = score.playerPoints + 1
    end
  end
  return porteria
end
