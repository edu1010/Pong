local Object = Object or require "lib/Classic"
menu = Object:extend()

local startGame
local exitGame

local w
local h
local fontSize

local canPress

local mx,my = love.mouse.getPosition()

function menu:new(w,h,fontSize)
  self.w = w
  self.h = h
  self.fontSize = fontSize

  self.canPress = true
end

function menu:update(dt,gameflow)
--print(love.mouse.getPosition(), love.mouse.isDown( 1 ))  
  local x,y = love.mouse.getPosition()

  if love.mouse.isDown(1) then
    if colisionPlay(self ,x, y, (self.w/2)-self.fontSize, (self.h/2)-self.fontSize/2) and self.canPress  then
      gameflow.state = gameflow.gameStates[4]
      self.startGame= love.graphics.setColor(255, 255, 255)
      self.canPress = false    
    end
    if colisionExit(self ,x, y, (self.w/2)-self.fontSize,  (self.h - self.fontSize)-self.fontSize/2) and self.canPress  then
      gameflow.state = gameflow.gameStates[3]
      self.exitGame= love.graphics.setColor(255, 255, 255)
      self.canPress = false   
    end
    
  else--Boton no esta pulsado
    if colisionPlay(self ,x, y, (self.w/2)-self.fontSize, (self.h/2)-self.fontSize/2) and not colisionExit(self ,x, y, (self.w/2)-self.fontSize, (self.h - self.fontSize)-self.fontSize/2) then
      self.startGame = love.graphics.setColor(0, 255, 0)
    else
      if colisionExit(self ,x, y, (self.w/2)-self.fontSize, (self.h - self.fontSize)-self.fontSize/2) then
        self.startGame=love.graphics.setColor(255, 0, 0)
      else
        self.startGame=love.graphics.setColor(255, 255, 255)
      end
      
    end
    
  end    
end
function colisionPlay(self,x,y,rectX, rectY)
  --print(self,x,y,rectX, rectY)
  if rectX and x > rectX and x < (rectX + self.fontSize*2) and y > rectY and y < rectY + self.fontSize  then
    return true 
  else
    return false
  end
end

  


function colisionExit(self,x,y,rectX, rectY)
  --print(self,x,y,rectX, rectY)
     if rectX and x > rectX and x < (rectX + self.fontSize*2) and y > rectY and y < rectY + self.fontSize  then
    return true 
  else
    return false
  end
end

function menu:draw()
  --love.graphics.line( self.w/2, 0,self.w/2,h)--
  
  self.startGame = love.graphics.print("Play!",(self.w/2), self.h/2,0,1,1,self.fontSize,self.fontSize/2)
  love.graphics.rectangle( "line", (self.w/2)-self.fontSize, (self.h/2)-self.fontSize/2, self.fontSize*2 + 20, self.fontSize)
  
  self.exitGame =love.graphics.print("EXIT",(self.w/2), self.h - self.fontSize,0,1,1,self.fontSize,self.fontSize/2)
  love.graphics.rectangle( "line", (self.w/2)-self.fontSize, (self.h-self.fontSize)-self.fontSize/2, self.fontSize*2, self.fontSize)
  
end
