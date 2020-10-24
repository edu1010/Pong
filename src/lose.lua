local Object = Object or require "lib/Classic"
lose = Object:extend()

local loseW
local loseH

function lose:new(w,h)
  self.loseW = w
  self.loseH = h
end


function lose:update(dt,g)
  if love.keyboard.isDown("return") then
     g.state = g.gameStates[1]
   end
   
end

function lose:draw()
  love.graphics.print("GAME OVER!", (self.loseW) - (self.loseH + 60) , (self.loseH/4),0,2,2)
  love.graphics.setColor(250,0,0)
  
  love.graphics.print("YOU LOSE", (self.loseW/2) - (self.loseH/4 - 20) , (self.loseH/2),0,1,1)
end