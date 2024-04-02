-- Autores Eduard Corral, Lidia Alvarez
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
  love.graphics.print("SCORE", self.scoreW/2 -100, 10)
  love.graphics.print(self.score1, self.scoreW/7, 100)
  love.graphics.print(self.score2, self.scoreW/7, 150)
  love.graphics.print(self.score3, self.scoreW/7, 200)
  love.graphics.print(self.score4, self.scoreW/7, 250)
  love.graphics.print(self.score5, self.scoreW/7, 300)
  love.graphics.print("Press ENTER to continue", self.scoreW/7, self.scoreH - 100)
end
function showScores:resetScore()
  self.actualizar = true
end
