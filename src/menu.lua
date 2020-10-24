local Object = Object or require "lib/Classic"
menu = Object:extend()

local w
local h
local fontSize
--
local buttons_height = 63
local buttons = {}
local mx, my = love.mouse.getPosition()

function menu:new(w,h,fontSize)
  self.w = w
  self.h = h
  self.fontSize = fontSize
  
  --
  table.insert(buttons, newButton("START",function()print ("Start") end))
  table.insert(buttons, newButton("EXIT",function()love.event.quit(0) end))
  
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
  if x > rectX and x < rectX + self.fontSize and y > rectY and y < rectY + self.fontSize then
    return true 
  else
    return false
  end
end

function menu:draw()
  --love.graphics.line( self.w/2, 0,self.w/2,h)--
  --[[
  love.graphics.print("Play!",(self.w/2), self.h/2,0,1,1,self.fontSize,self.fontSize/2)
  love.graphics.rectangle( "line", (self.w/2)-self.fontSize, (self.h/2)-self.fontSize/2, self.fontSize*2, self.fontSize )
  ]]--
  local ww = love.graphics.getWidth()
  local wh = love.graphics.getHeight()
  local margen = 16
  
  local buttons_width = ww/3
  local total_height = (buttons_height+margen) * #buttons
  
  for i, buttons in ipairs(buttons) do
    love.graphics.rectangle("fill",(ww/2)-(buttons_width/2),(wh/2)-(buttons_height/2), buttons_width, buttons_height)
    end
end
--
function newButton(txt,fn)
  text=txt
  fn= fn
  return text, fn

end
