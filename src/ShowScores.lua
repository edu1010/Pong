local Object = Object or require "lib/Classic"
showScores = Object:extend()

local score1
local score2
local score3
local score4
local score5
local scoreW
local scoreH
local actualizar

function showScores:new(w,h)
  self.score1 = ""
  self.score2 = ""
  self.score3 = ""
  self.score4 = ""
  self.score5 = ""
  self.scoreW = w
  self.scoreH = h
  self.actualizar = true
end


function showScores:update(dt,g)
  if(self.actualizar)then
    self.actualizar = false
    local archivo =  io.open("Puntuaciones.txt","r")
    local contador = 1
    for linea in archivo:lines() do
      if contador == 1 then
        self.score1 = linea
        contador = contador+1
      elseif contador == 2 then
        self.score2 = linea
        contador = contador+1
      elseif contador == 3 then
        self.score3 = linea
        contador = contador+1
      elseif contador == 4 then
        self.score4 = linea
        contador = contador+1
      elseif contador == 5 then
        self.score5 = linea
        contador = 1
      end
    end
    archivo.close()
      
      end
  if love.keyboard.isDown("return") then
     g.state = g.gameStates[1]
   end
  
end

function showScores:draw()
  love.graphics.print(self.score1, 0, 0,0,1,1)
  love.graphics.print(self.score2, 0, 50,0,1,1)
  love.graphics.print(self.score3, 0, 100,0,1,1)
  love.graphics.print(self.score4, 0, 150,0,1,1)
  love.graphics.print(self.score5, 0, 200,0,1,1)
end
function showScores:resetScore()
  self.actualizar = true
end
