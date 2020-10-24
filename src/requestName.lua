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



function requestName:update(dt,g)
  --del 65 al 90 es de la A a la Z en codigo assic
  if self.actualChar1 == 1 then
    if love.keyboard.isDown("up") then
      if string.byte(self.letra1)+1 >90 then
        self.letra1 = string.char(65)
      else
        self.letra1 = string.char( string.byte(self.letra1)+1)
      end
    elseif love.keyboard.isDown("down") then
      if  string.byte(self.letra1)-1 < 65 then
        self.letra1 = string.char(90)
      else 
      self.letra1 = string.char( string.byte(self.letra1)-1)
      end
    end
    if love.keyboard.isDown("left") then
      self.actualChar1 = 3
    end
    if love.keyboard.isDown("right") then
      self.actualChar1 = 2
    end
  end
  if love.keyboard.isDown("return") then
    g.state = g.gameStates[2]
  end
  if self.actualChar2 == 2 then
  --code
  if love.keyboard.isDown("up") then
      --del 65 al 90
      if string.byte(self.letra2)+1 >90 then
        self.letra2 = string.char(65)
      elseif  string.byte(self.letra2)-1 < 65 then
        self.letra2 = string.char(90)
      else
        self.letra2 = string.char( string.byte(self.letra2)+1)
      end
      elseif love.keyboard.isDown("down") then
        self.letra2 = string.char( string.byte(self.letra2)-1)
      end
      
      if love.keyboard.isDown("left") then
        self.actualChar2 = 1
      end
      if love.keyboard.isDown("right") then
        self.actualChar2 = 3
      end
  end
  if self.actualChar3 == 3 then
  --code
  if love.keyboard.isDown("up") then
      --del 65 al 90
      if string.byte(self.letra3)+1 > 90 then
        self.letra3 = string.char(65)
      elseif  string.byte(self.letra3)-1 < 65 then
        self.letra3 = string.char(90)
      else
        self.letra3 = string.char( string.byte(self.letra3)+1)
      end
      elseif love.keyboard.isDown("down") then
        self.letra3 = string.char( string.byte(self.letra3)-1)
      end
      
      if love.keyboard.isDown("left") then
        self.actualChar3 = 2
      end
      if love.keyboard.isDown("right") then
        self.actualChar3 = 1
      end
  end
end


function requestName:draw()
  love.graphics.print("PON TU NOMBRE", (self.titleW/2), self.titleH-self.titleH/2,0,1,1)
  love.graphics.print(self.letra1,(self.titleW/2),self.titleH-self.titleH/4,0,1,1)
  love.graphics.print(self.letra2,(self.titleW/2+40),self.titleH-self.titleH/4,0,1,1)
  love.graphics.print(self.letra2,(self.titleW/2+80),self.titleH-self.titleH/4,0,1,1)
end