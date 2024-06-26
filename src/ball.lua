-- Autores Eduard Corral, Lidia Alvarez
local Object = Object or require "lib/Classic"
ball = Object:extend()

local ballX, ballY -- Variables to store the position of the ball in the screen 
local ballXo, ballYo -- Variables to store the position of the ball in the screen in origin
local ballSpeed
local ballSpeedCopy --To restore the speed
local speedIncrease --To increase the speed
local ballAngle
local ballRad
local h
local timerMaxValue --To restart the timer
local timer
local timerPaddle
local paddleW 
local paddleH
local musica
local sprite

function ball:new(x,y,h,w,speed,speedIncrease,rad,timer,paddleW,paddleH)
  sprite = love.graphics.newImage("image/ballPongg.png")
  
  self.ballX = x
  self.ballXo = x
  self.ballY = y
  self.ballYo = y
  self.ballSpeed = speed
  self.ballSpeedCopy = speed
  self.speedIncrease = speedIncrease
  self.ballRad = rad
  self.ballAngle = math.rad(210)
  self.h = h
  self.w = w
  self.timerMaxValue = timer
  self.timer = timer
  self.timerPaddle = timer
  self.paddleW = paddleW
  self.paddleH = paddleH
end



function ball:update(dt, player,cpu,score,sonido)
  self.timer=self.timer+dt
  self.timerPaddle=self.timerPaddle+dt
  
  self.ballX= self.ballX + math.cos(self.ballAngle) * self.ballSpeed * dt
  self.ballY= self.ballY + math.sin(self.ballAngle) * self.ballSpeed * dt
  
  
  if colision(self,player.paddleX,player.paddleY) and self.timerPaddle >= self.timerMaxValue then
      self.timerPaddle = 0.0
      self.ballAngle = math.rad(180)-self.ballAngle
      
      self.ballSpeed = self.ballSpeed + self.speedIncrease
      sonido.sonidoPong:play()
     end
  
     if colision(self,cpu.paddleX,cpu.paddleY) and self.timerPaddle >= self.timerMaxValue then
      self.timerPaddle = 0.0
      self.ballAngle = math.rad(180)-self.ballAngle
      self.ballSpeed = self.ballSpeed + self.speedIncrease
      sonido.sonidoPong:play()
     end
  
  
  if colisionParedes(self,sonido) and self.timer >= self.timerMaxValue then
    self.timer = 0.0
    self.ballAngle= math.rad(25) - self.ballAngle  
  end
  
  if colisionPorteria(self,score,sonido) then
    self.ballX = self.ballXo
    self.ballY = self.ballYo
    self.ballSpeed = self.ballSpeedCopy
    self.ballAngle = math.rad(math.random(180,210))
  end
  
  
end

function ball:draw()
  love.graphics.draw(sprite,self.ballX,self.ballY)
end


function colision(self,rectX, rectY)
  DeltaX = self.ballX - math.max(rectX, math.min(self.ballX, rectX + self.paddleW))
  DeltaY = self.ballY - math.max(rectY, math.min(self.ballY, rectY + self.paddleH))
  return (DeltaX * DeltaX + DeltaY * DeltaY) < (self.ballRad * self.ballRad)
end

function colisionParedes(self)
  local pared = false
  if self.ballY+5 <= 0 then
    pared = true
    self.ballY = self.ballY+10
  end
  if self.ballY+5 >= self.h then
    pared = true
    self.ballY = self.ballY-10
  end
  return pared
end

function colisionPorteria(self,score,sonido)
  local porteria = false
  if self.ballX+self.ballRad < 0 or self.ballX+self.ballRad > self.w then
    porteria = true
    if self.ballX + self.ballRad < 0 then
      score.cpuPoints = score.cpuPoints + 1
      sonido.puntoCp:play()
    elseif self.ballX + self.ballRad > self.h then
      score.playerPoints = score.playerPoints + 1
      sonido.puntoPl:play()
    end
  end
  return porteria
end
function ball:resetBall()
  self.ballX = self.ballXo
  self.ballY = self.ballYo
  self.ballSpeed = self.ballSpeedCopy
  self.timer = self.timerMaxValue
end

  
  