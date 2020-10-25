-- Autores Eduard Corral, Lidia Alvarez
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
  gameflow.reset = true
  local x,y = love.mouse.getPosition()

  if love.mouse.isDown(1) then
    if colisionPlay(self ,x, y, (self.w/2)-self.fontSize, (self.h/2)-self.fontSize/2) then
      gameflow.state = gameflow.gameStates[4]
      self.startGame= love.graphics.setColor(255, 255, 255)
      self.canPress = false    
    end
    if colisionExit(self ,x, y, (self.w/2)-self.fontSize,  (self.h - self.fontSize)-self.fontSize/2) and self.canPress  then
      love.event.quit(1)
      self.exitGame= love.graphics.setColor(255, 255, 255)
      self.canPress = false   
    end
    if colisionPlay(self ,x, y,(self.w/2)-self.fontSize ,(self.h/2 + self.h/8)-self.fontSize/2 ) and self.canPress then--colision score 
      gameflow.state = gameflow.gameStates[6]
      self.exitGame= love.graphics.setColor(255, 255, 255)
      self.canPress = false  
    end
    
    
  else--Boton no esta pulsado
    if colisionPlay(self ,x, y, (self.w/2)-self.fontSize, (self.h/2)-self.fontSize/2) and not colisionExit(self ,x, y, (self.w/2)-self.fontSize, (self.h - self.fontSize)-      self.fontSize/2) then
      self.startGame = love.graphics.setColor(0, 255, 0)
    else
      if colisionExit(self ,x, y, (self.w/2)-self.fontSize, (self.h - self.fontSize)-self.fontSize/2)  then
        self.startGame=love.graphics.setColor(255, 0, 0)
      elseif colisionPlay(self ,x, y,(self.w/2)-self.fontSize ,(self.h/2 + self.h/8)-self.fontSize/2 ) then--colision score 
      self.exitGame= love.graphics.setColor(255, 0, 255)
      --self.canPress = false  
    else
        self.startGame=love.graphics.setColor(255, 255, 255)
      end
      
    end
    
  end    
end
function colisionPlay(self,x,y,rectX, rectY)
  if rectX and x > rectX and x < (rectX + self.fontSize*2) and y > rectY and y < rectY + self.fontSize  then
    return true 
  else
    return false
  end
end


function colisionExit(self,x,y,rectX, rectY)
     if rectX and x > rectX and x < (rectX + self.fontSize*2) and y > rectY and y < rectY + self.fontSize  then
    return true 
  else
    return false
  end
end

function menu:draw()
  --love.graphics.line( self.w/2, 0,self.w/2,h)--
  love.graphics.print("MENU", self.w/2 - 20, self.h/4 + 20,0,2,2,self.fontSize,self.fontSize)
  
  self.startGame = love.graphics.print("Play!",(self.w/2), self.h/2,0,1,1,self.fontSize,self.fontSize/2)
  love.graphics.rectangle( "line", (self.w/2)-self.fontSize - 10, (self.h/2)-self.fontSize/2, self.fontSize*2 + 30, self.fontSize)
  
  love.graphics.print("Score",(self.w/2) - 10, self.h/2 + self.h/8 ,0,1,1,self.fontSize,self.fontSize/2)
  love.graphics.rectangle( "line", (self.w/2)-10 -self.fontSize - 10, (self.h/2 + self.h/8)-self.fontSize/2, self.fontSize*2 + 55, self.fontSize)
  
  self.exitGame = love.graphics.print("exit",(self.w/2), self.h - self.fontSize,0,0.5,0.5,self.fontSize,self.fontSize/2)
  love.graphics.rectangle( "line", (self.w/2)-self.fontSize, (self.h-self.fontSize)-self.fontSize/2, self.fontSize*2, self.fontSize)
  
end
function menu:resetMenu()
  self.canPress =true
end

