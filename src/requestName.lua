local Object = Object or require "lib/Classic"
requestName = Object:extend()

local name
local titleW
local titleH
local letra1
local letra2
local letra3
local actualChar
local timer


function requestName:new(w,h)
  self.name = "AAA" 
  self.titleW = w
  self.titleH = h
  self.letra1 = "A"
  self.letra2 = "A"
  self.letra3 = "A"
  self.actualChar = 1
  self.timer = 0.2
end



function requestName:update(dt,g)
  self.timer = self.timer +dt
  --del 65 al 90 es de la A a la Z en codigo assic
  if self.actualChar == 1 and self.timer > 0.1 then
    self.timer = 0.0
    self.letra1 = cambiarLetra(dt,self.letra1)
    if love.keyboard.isDown("left") then
        self.actualChar = 3
      end
      if love.keyboard.isDown("right") then
        self.actualChar = 2
      end
  end
  if love.keyboard.isDown("return") then
    g.state = g.gameStates[2]
  end
  if self.actualChar == 2 and self.timer > 0.1 then
  --code
  self.timer = 0.0
  self.letra2 = cambiarLetra(dt,self.letra2)
    if love.keyboard.isDown("left") then
        self.actualChar = 1
      end
      if love.keyboard.isDown("right") then
        self.actualChar = 3
      end
  end
  if self.actualChar == 3 and self.timer > 0.1 then
    self.timer = 0.0
    self.letra3 = cambiarLetra(dt,self.letra3)
    if love.keyboard.isDown("left") then
        self.actualChar = 2
      end
      if love.keyboard.isDown("right") then
        self.actualChar = 1
      end
    end
  end


function cambiarLetra(dt,letra)
      if love.keyboard.isDown("up") then
        if string.byte(letra)+1 >90 then
          letra = string.char(65)
        else
          letra = string.char( string.byte(letra)+1)
        end
      elseif love.keyboard.isDown("down") then
        if  string.byte(letra)-1 < 65 then
          letra = string.char(90)
        else 
        letra = string.char( string.byte(letra)-1)
        end
      end
      return letra
end
function requestName:draw()
  love.graphics.print("PON TU NOMBRE", (self.titleW/2), self.titleH-self.titleH/2,0,1,1)
  love.graphics.print(self.letra1,(self.titleW/2),self.titleH-self.titleH/4,0,1,1)
  love.graphics.print(self.letra2,(self.titleW/2+40),self.titleH-self.titleH/4,0,1,1)
  love.graphics.print(self.letra2,(self.titleW/2+80),self.titleH-self.titleH/4,0,1,1)
end