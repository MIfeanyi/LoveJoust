require 'states.player'
require 'states.button'
local state = {}
local players = {} -- array of current enemies

local stage = { current = {"Menu", "Paused", "Game"}, currentStage = 0, MaxStages = 3}
local physics = {velocity = 125, gravity = 200, jump = 400, flight = 450}

local currentPlayer = "ninja"

function state:new()
  return lovelyMoon.new(self)
end

function state:load()
  love.graphics.setBackgroundColor(100,100,100)
  newPlayer = {x = 0,y = 0,img,h,w, onGround = false, inAir = true,
    onCreature = true, ai = false, alive = false}
  newPlayer.img = love.graphics.newImage("/img/ninja.png")
  table.insert(players,newPlayer)

  btnNinja = button:new() btnNinja:load(50,50,"/img/ninja.png")
  btnPlay  = button:new() btnPlay:load(50, 150,"/img/play.png")

  sndIntro = love.audio.newSource("/sfx/intro.wav")
end

function state:close()

end

function state:enable()

end

function state:disable()

end

function state:update(dt)
  if stage.currentStage == 0 then
    --Select Character--
    if btnNinja:clicked() then currentPlayer = "ninja" end
    if btnPlay:clicked() then
      stage.currentStage = 1 
      sndIntro:play()
    end

  elseif stage.currentStage == 1 then
    --Intro---
    if sndIntro.isStopped then
      stage.currentStage = 2
      print("moving to game")
    end

  elseif stage.currentStage == 2 then
    --Game--
    --Handle movement, AI
    for i, p in ipairs(players) do
      if p.ai == false then --Player
        if love.keyboard.isDown('d') then
          p.x = p.x + (physics.velocity*dt)
        end
        if love.keyboard.isDown('a') then
          p.x = p.x - (physics.velocity*dt)
        end
        if love.keyboard.isDown('w') then
          p.y = p.y - (physics.jump*dt)
        end
        p.y = p.y + (physics.gravity*dt)
      end
    end


  else
    --Error
  end


end

function state:draw()

  if stage.currentStage == 0 then
    love.graphics.setColor(0,255,0,150)
    love.graphics.rectangle("fill", 0, 0, 200, 200)
    love.graphics.setColor(255,255,255,255)
    btnNinja:draw()
    btnPlay:draw()
  end
  if stage.currentStage == 1 then
    love.graphics.print("Ready!",400,300)
  end

  love.graphics.print("Game State",400,300)
  if stage.currentStage == 2 then
    for i, p in ipairs(players) do
      love.graphics.draw(p.img,p.x,p.y)
    end 
  end

end

function state:keypressed(key, unicode)

end

function state:keyreleased(key, unicode)

end

function state:mousepressed(x, y, button)

end

function state:mousereleased(x, y, button)

end

return state
