local state = {}

function state:new()
	return lovelyMoon.new(self)
end

function state:load()
	
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
  love.graphics.print("Love Joust", 400, 300)
  love.graphics.print("Press Enter to begin!", 400, 400)
end

function state:keypressed(key, unicode)
	
end

function state:keyreleased(key, unicode)
  if key == "enter" then
    lovelyMoon.switchState("intro", "game")
    end
end

function state:mousepressed(x, y, button)
	
end

function state:mousereleased(x, y, button)
	
end

return state
