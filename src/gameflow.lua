local Object = Object or require "lib/Classic"
gameflow = Object:extend()

local state
local gameStates 
local timerPartida
local restar1
function gameflow:new()
  self.gameStates = {"menu","play","gameOver"}
  self.state = self.gameStates[1]
  self.timerPartida = 60
  self.restar1 = 0
end

function gameflow:update(dt)
 if self.state == self.gameStates[2] then
   self.restar1 = self.restar1+dt
   if self.restar1 >=1 then
     self.restar1 = 0
    self.timerPartida = self.timerPartida -1
  end
 end
 
  
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
