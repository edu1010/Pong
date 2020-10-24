local Object = Object or require "lib/Classic"
lose = Object:extend()

local loseW
local loseH
function lose:new(w,h)
  self.loseW = w
  self.loseH = h
end


function lose:update(dt,g)
  
end

function lose:draw()
  love.graphics.print("YOU LOSE", (self.loseW/2), self.titleH-self.loseH/2,0,1,1)
end