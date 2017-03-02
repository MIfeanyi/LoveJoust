physics = {velocity = 200, gravity = 100, jump = 400, flight = 450}
require 'player'
require 'button'
require 'timer'
require 'waves'
require 'ai'
require 'animation'
require 'map'
local state = {}
local stage = { current = {"Menu", "Paused", "Game"}, currentStage = 0, MaxStages = 3}

local currentPlayer = "ninja"

function state:new()
  return lovelyMoon.new(self)
end

function state:load()
  love.graphics.setBackgroundColor(100,100,100)
  map:addMap("/lvl/1-1.lua")
  addPlayer("P1",668,0,"/img/ninja.png",64,64,false,true,true,false,true)
  addImage("/img/player.png","player")
  for i, p in ipairs(players) do
    map:addObject(p)
    table.insert(p.animations,addAnimation(64,64,'1-4','jumping'))
  end
  btnNinja = button:new() btnNinja:load(50,50,"/img/ninja.png")
  btnPlay  = button:new() btnPlay:load(50, 150,"/img/play.png")

  sndIntro = love.audio.newSource("/sfx/intro.wav")

end

function state:close()
  timer:reset()
end

function state:enable()
  timer:reset()
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

      timer:start(20,dt)
      waves:spawn(5)
    end

  elseif stage.currentStage == 2 then
    --Game--
    timer:update(dt)
    map:update(dt)
    if timer.done then
      waves:spawn(5)
      timer:reset()
      print("Reset Timer & spawned more")
    end

    --Handle movement, AI
    for i, p in ipairs(players) do
      for j, a in ipairs(p.animations) do
        a:update(dt)
      end
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
      if p.ai then -- if we do automated tests
        --p.y = p.y + (physics.gravity*dt)
      end
      if p.x > love.graphics.getWidth() + 32 then p.x = 0 -32 end
      if p.x < -64 then p.x = love.graphics.getWidth() end
      --if p.id == "P1" then print("This is the player:",p.x,p.y) end
      p.x,p.y = playerCollisions(map:move(p))
      ai:lock(p.x,p.y)
    end

    for j, e in ipairs(enemies) do
      e.y = e.y + (physics.gravity*dt)*.60
      e. x, e.y = ai:update(e.x,e.y,e.movement,dt)
      if timer.elaspedTime > 3 and e.y < 0 then
        e.y = 0
      end
      if e.x > love.graphics.getWidth() + 32 then e.x = 0 -32 end
      if e.x < -64 then e.x = love.graphics.getWidth() end
    end

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

  --love.graphics.print("Game State",400,300)
  if stage.currentStage == 2 then
    map.maps[1]:draw()
    for i, p in ipairs(players) do
      --love.graphics.draw(p.img,p.x,p.y)
      for j, a in ipairs(p.animations) do
        a:draw(getImage("player"),p.x,p.y)
      end
    end
    for j, e in ipairs(enemies) do
      love.graphics.draw(e.img,e.x,e.y)
    end
  end

end

function state:keypressed(key, unicode)

end

function state:keyreleased(key, unicode)
  if key == "space" then
    for i, p in ipairs(players) do
      print("ID",p.id,"player=",p.ai,p.x,p.y,p.h,p.w,p.onGround,p.inAir,
        p.onCreature,p.ai,p.alive)
    end
  end

end

function state:mousepressed(x, y, button)

end

function state:mousereleased(x, y, button)

end

return state
