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
  if colision(self,x,y,(self.w/2)-self.fontSize,(self.h/2)-self.fontSize/2) then
    gameflow.state = gameflow.gameStates[2]
    
  end
end
end
function colision(self,x,y,rectX, rectY)
  DeltaX = x - math.max(rectX, math.min(x, rectX + self.fontSize*2))
  DeltaY = y- math.max(rectY, math.min(y, rectY + self.fontSize))
  return (DeltaX * DeltaX + DeltaY * DeltaY) < (2 * 2)
end



function menu:draw()
  --love.graphics.line( self.w/2, 0,self.w/2,h)--
  love.graphics.print("Play!",(self.w/2), self.h/2,0,1,1,self.fontSize,self.fontSize/2)
  love.graphics.rectangle( "line", (self.w/2)-self.fontSize, (self.h/2)-self.fontSize/2, self.fontSize*2, self.fontSize )
  
end
