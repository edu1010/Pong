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
    self.score1 = archivo:read()
    self.score2 = archivo:read()
    self.score3 = archivo:read()
    self.score4 = archivo:read()
    self.score5 = archivo:read()
  end
  if love.keyboard.isDown("return") then
     g.state = g.gameStates[1]
   end
  
end

function showScores:draw()
  love.graphics.print(self.score1, (self.scoreW) - (self.scoreH + 60) , (self.scoreH/4),0,2,2)
end
function showScores:resetScore()
  self.actualizar = true
end
