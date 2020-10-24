local Object = Object or require "lib/Classic"
win = Object:extend()

local winW
local winH
function win:new(w,h)
  self.winW = w
  self.winH = h
end


function win:update(dt,g)
   if love.keyboard.isDown("return") then
     g.state = g.gameStates[1]
   end
end

function win:draw()
  love.graphics.print("YOU WIN", (self.winW/2), self.winH-self.winH/2,0,1,1)
end