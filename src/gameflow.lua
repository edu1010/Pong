local Object = Object or require "lib/Classic"
gameflow = Object:extend()

local state
local gameStates 

function gameflow:new()
  self.gameStates = {"menu","play","gameOver"}
  self.state = self.gameStates[1]
  
end

function gameflow:update(dt)
 
  
end

function gameflow:menu()
  if (self.state == self.gameStates[1]) then
    return true
  else
    return false
  end
end
function gameflow:play()
  if (self.state == self.gameStates[2]) then
    return true
  else
    return false
  end
end
function gameflow:gameOver()
  if (self.state == self.gameStates[3]) then
    return true
  else
    return false
  end
end

function gameflow:siguienteNivel()
  self.state = self.gameStates[2]
end
