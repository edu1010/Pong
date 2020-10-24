local Object = Object or require "lib/Classic"
gameflow = Object:extend()

local state
local gameStates = {"menu","play","gameOver"}

function gameflow:new()
  self.state = gameStates[1]
end

function gameflow:update(dt)
 
  
end

function gameflow:menu()
  if (self.state == gameStates[1]) then
    return true
  else
    return false
  end
end
function gameflow:play()
  if (self.state == gameStates[2]) then
    return true
  else
    return false
  end
end
function gameflow:gameOver()
  if (self.state == gameStates[3]) then
    return true
  else
    return false
  end
end

function gameflow:siguienteNivel()
  self.state = gameStates[2]
end
