local Object = Object or require "lib/Classic"
menu = Object:extend()

local w
local h
local fontSize
local canPress


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
    
    --print(x,y)
    if colisionPlay(self ,x, y, (self.w/2)-self.fontSize, (self.h/2)-self.fontSize/2) and self.canPress  then
      gameflow.state = gameflow.gameStates[2]
      love.graphics.setColor(255, 255, 255)
      self.canPress = false    
    end
  else
    if colisionPlay(self ,x, y, (self.w/2)-self.fontSize, (self.h/2)-self.fontSize/2) then
      love.graphics.setColor(0, 255, 0)
    else
      love.graphics.setColor(255, 255, 255)
    end
  end    
end
function colisionPlay(self,x,y,rectX, rectY)
  --print(self,x,y,rectX, rectY)
  if rectX and x > rectX and x < (rectX + self.fontSize*2) and y > rectY and y < rectY + self.fontSize  then
    print("colision",self,x,y,rectX, rectY)
    return true 
  else
    return false
  end
end
function menu:draw()
  --love.graphics.line( self.w/2, 0,self.w/2,h)--
  love.graphics.print("Play!",(self.w/2), self.h/2,0,1,1,self.fontSize,self.fontSize/2)
  love.graphics.rectangle( "line", (self.w/2)-self.fontSize, (self.h/2)-self.fontSize/2, self.fontSize*2, self.fontSize )
  
end
