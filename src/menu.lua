local Object = Object or require "lib/Classic"
menu = Object:extend()

local w
local h
local fontSize
<<<<<<< HEAD
--
local buttons_height = 63
local buttons = {}
local mx, my = love.mouse.getPosition()
=======
local canPress

>>>>>>> 30fa461183f0b2374e57c9c8332324514144cabe

function menu:new(w,h,fontSize)
  self.w = w
  self.h = h
  self.fontSize = fontSize
<<<<<<< HEAD
  
  --
  table.insert(buttons, newButton("START",function()print ("Start") end))
  table.insert(buttons, newButton("EXIT",function()love.event.quit(0) end))
  
=======
  self.canPress = true
>>>>>>> 30fa461183f0b2374e57c9c8332324514144cabe
end

function menu:update(dt,gameflow)
--print(love.mouse.getPosition(), love.mouse.isDown( 1 ))  
  local x,y = love.mouse.getPosition()
<<<<<<< HEAD
  print(x,y)
  if colision(self ,x, y, (self.w/2)-self.fontSize, (self.h/2)-self.fontSize/2) then
    gameflow:siguienteNivel()
  end
end
end
function colision(self,x,y,rectX, rectY)
  if x > rectX and x < rectX + self.fontSize and y > rectY and y < rectY + self.fontSize then
=======
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
>>>>>>> 30fa461183f0b2374e57c9c8332324514144cabe
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
