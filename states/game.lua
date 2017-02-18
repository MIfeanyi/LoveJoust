require 'states.player'
require 'states.button'
local state = {}


local stage = { current = {"Menu", "Paused", "Game"}, currentStage = 0, MaxStages = 3}
local physics = {velocity = 125, gravity = 200, jump = 400, flight = 450}

local currentPlayer = "ninja"

function state:new()
  return lovelyMoon.new(self)
end

function state:load()
  love.graphics.setBackgroundColor(100,100,100)
  addPlayer("P1",200,200,"/img/ninja.png",64,64,false,true,true,false,true)
  
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
      if p.ai then
        --AI stuff
      end
      if p.x > love.graphics.getWidth() + 32 then p.x = 0 -32 end
      if p.x < -64 then p.x = love.graphics.getWidth() end


    end


    --

  else
    --Error
  end


end

function state:draw()

  if stage.currentStage == 0 then 
    love.graphics.setColor(0,0,255,255)
    love.graphics.rectangle("fill", 0, 0, 200, 200)
    love.graphics.rectangle("fill",300,0,400, 200)
    love.graphics.setColor(255,255,255,255)
    love.graphics.printf("Movement – WASD / Arrow Keys Jump / Fly – Space Projectile – Z / X",305,0,300)
    love.graphics.setColor(255,255,255,255) -- color reset
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
