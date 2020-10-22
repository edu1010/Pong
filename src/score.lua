local Object = Object or require "lib/Classic"
score = Object:extend()

local font
local playerPoints 
local cpuPoints 

function score:new()
  self.font = love.graphics.newFont( "pong.ttf",50)
  love.graphics.setFont( self.font )
  self.playerPoints = 0
  self.cpuPoints =0
end

function score:update(dt)
  
  
end

function score:draw(w,h)
  love.graphics.line( w/2, 0,w/2,h)
  love.graphics.print(self.playerPoints,(w/4),20)
  love.graphics.print(self.cpuPoints,(3*((w/4))),20)
end

  