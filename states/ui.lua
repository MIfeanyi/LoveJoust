
ui = {lives = 3, score = 0,
 bg = {x,y,h,w},
 color = {r,b,g,a}
 images = {hp},
 table ={} --to store highscores 
 }
--[[TODO: io functions
function ui:save()
end

function ui:load()
end

function ui:update() -- update score table
end
]]
function ui:draw()
love.graphics.setColor(self.color.r,self.color.b,self.color.g,self.color.a)
love.graphics.rectangle("fill", self.bg.x, self.bg.y, self.bg.h, self.bg.w)
love.graphics.setColor(255,255,255,255)
end

