local Object = Object or require "lib/Classic"
gameflow = Object:extend()

local state
local gameStates 
local timerPartida
local timerPartidaMax --reset timer
local restar1
local resetTimer
function gameflow:new(duracion)
  self.gameStates = {"menu","play","gameOver","requestName","win","ShowScore"}
  self.state = self.gameStates[1]
  self.timerPartida = duracion
  self.timerPartidaMax = duracion
  self.restar1 = 0
  self.resetTimer = true
end

function gameflow:update(dt,score,name)
 if self.state == self.gameStates[2] then
   self.resetTimer = true
     self.restar1 = self.restar1+dt
     if self.restar1 >=1 then
       self.restar1 = 0
      self.timerPartida = self.timerPartida -1
    end
    
    if self.timerPartida <= 0 then
     local archivo = io.open("Puntuaciones.txt","a")
     local puntuacion ="\n"..name.name.." score: "..score.playerPoints.." Cpu score:"..score.cpuPoints
     archivo:write(puntuacion)
     archivo:close()
     self.state = self.gameStates[1]--Poner un if que lleve a un you win o a un you lose
     if score.playerPoints > score.cpuPoints then
       self.state = self.gameStates[5]
     else
       self.state = self.gameStates[3]
     end
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
function gameflow:gameOver(b,score,p,c,m)
  if (self.state == self.gameStates[3]) then
    gameflow.resetGame(self,b,score,p,c,m)
    return true
  else
    return false
  end
end
function gameflow:requestName()
  if (self.state == self.gameStates[4]) then
    return true
  else
    return false
  end
end
function gameflow:win(b,score,p,c,m)
  if (self.state == self.gameStates[5]) then
    gameflow.resetGame(self,b,score,p,c,m)
    return true
  else
    return false
  end
end
function gameflow:siguienteNivel()
  self.state = self.gameStates[2]
end
function gameflow:ShowScore()
  if (self.state == self.gameStates[6]) then
    return true
  else
    return false
  end
end
function gameflow.resetGame(self,b,s,p,c,m)
  if self.resetTimer then
    print("dentro")
    self.resetTimer = false
    self.timerPartida = self.timerPartidaMax
    print(self.timerParitida)
    self.restar1 = 0
    print(self,b,s,p,c,m)
    b:resetBall()
    s:resetScore()
    p:resetPaddle()
    c:resetPaddle()
    m:resetMenu()
    print("reseteado")
  end
end

