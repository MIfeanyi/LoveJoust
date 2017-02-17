require 'states.player'

local state = {}
local players = {} -- array of current enemies

function state:new()
	return lovelyMoon.new(self)
end

function state:load()
	newPlayer = {x = 0,y = 0,img,h,w, onGround = false, inAir = true, onTransportation = true, ai = false, alive = false}
  table.insert(players,newPlayer)
  
end

function state:close()
	
end

function state:enable()
	
end

function state:disable()
	
end

function state:update(dt)
	
end

function state:draw()
    love.graphics.print("Game State",400,600)
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
