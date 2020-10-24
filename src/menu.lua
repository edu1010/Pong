local Object = Object or require "lib/Classic"
menu = Object:extend()

local w
local h
local fontSize


function menu:new(w,h,fontSize)
  self.w = w
  self.h = h
  self.fontSize = fontSize
end

function menu:update(dt,gameflow)
print(love.mouse.getPosition(), love.mouse.isDown( 1 ))  
if love.mouse.isDown(1) then
  local x,y = love.mouse.getPosition()
  print(x,y)
  if colision(self ,x, y, (self.w/2)-self.fontSize, (self.h/2)-self.fontSize/2) then
    gameflow:siguienteNivel()
    
  end
end
end
function colision(self,x,y,rectX, rectY)
  if x > rectX and x < (rectX + self.fontSize*2) and y > rectY and y < rectY + self.fontSize then
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
