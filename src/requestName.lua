local Object = Object or require "lib/Classic"
requestName = Object:extend()

local name
local titleW
local titleH
local letra1
local letra2
local letra3
local actualChar1


function requestName:new(w,h)
  self.name = "AAA" 
  self.titleW = w
  self.titleH = h
  self.letra1 = "A"
  self.letra2 = "A"
  self.letra3 = "A"
  self.actualChar1 = 1
  print("LOAD",self.actualChar1)
end



function requestName:update(dt)
  print("UPDATE",self)
  print("UPDATE",self.actualChar1)
  print(self.letra1)
  print(self)
  print(self.actualChar1)
  if self.actualChar1 == 1 then
    if love.keyboard.isDown("up") then
      --codigo
      self.letra1 = string.char( string.byte(self.letra1)+1)
    elseif love.keyboard.isDown("down") then
      self.letra1 = string.char( string.byte(self.letra1)-1)
    end
  end
    
    
end

function requestName:draw()
  love.graphics.print("PON TU NOMBRE", (self.titleW/2), self.titleH-self.titleH/2,0,1,1)
  love.graphics.print(self.letra1,(self.titleW/2),self.titleH-self.titleH/4,0,1,1)
end