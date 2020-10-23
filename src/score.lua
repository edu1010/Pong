local Object = Object or require "lib/Classic"
score = Object:extend()

local font
local playerPoints 
local cpuPoints 
local size
local scoreH

function score:new(size,scoreH)
  self.size = size
  self.scoreH = scoreH
  self.font = love.graphics.newFont( "pong.ttf",self.size)
  love.graphics.setFont( self.font )
  self.playerPoints = 0
  self.cpuPoints =0
end

function score:update(dt)
  
  
end

function score:draw(w,h)
  love.graphics.line( w/2, 0,w/2,h)
  love.graphics.print(self.playerPoints,(w/4), self.scoreH)
  love.graphics.print(self.cpuPoints,(3*((w/4))), self.scoreH)
end

  