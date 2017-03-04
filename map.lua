local sti = require "sti"
local bump = require "lib.bump"

--[[ Map - Load Tiled maps and provide collisions for enemies players etc.

]]
map = {
  maps = {}, -- array of Tiled maps
  current = 0,
  world
}

function map:addMap(src)
  newMap = sti(src, { "bump" },0,0)
  self.world = bump.newWorld()
  newMap:bump_init(self.world)
  table.insert(self.maps,newMap)
  self.current = self.current + 1
end

function map:addObject(obj)
  self.world:add(obj,obj.x,obj.y,obj.w,obj.h)
end

function map:move(obj)
  return self.world:move(obj,obj.x,obj.y,filter)
end

function map:update(dt)
  self.maps[self.current]:update(dt)
end
