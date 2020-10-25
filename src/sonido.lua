-- Autores Eduard Corral, Lidia Alvarez
local Object = Object or require "lib/Classic"
sonido = Object:extend()

local sonidoPong
local musica
local puntoPl
local puntoCp

function sonido:new()
  self.sonidoPong = love.audio.newSource("audio/pong.ogg","stream")
  self.sonidoPong:setVolume(0.9)
  
  self.puntoPl = love.audio.newSource("audio/punto.ogg","stream")
  self.puntoPl:setVolume(0.6)
  
  self.puntoCp = love.audio.newSource("audio/puntoCpu.ogg","stream")
  self.puntoCp:setVolume(0.6)
  
  self.musica = love.audio.newSource("audio/musicaa.ogg", "stream")
  self.musica:setVolume(0.2)
  self.musica:play()
  self.musica:setLooping(true)
end

function sonido:update()
  
end

function sonido: draw()
  
end

