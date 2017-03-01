require 'image'
local animate = require 'lib.anim8'


animations = {}
function addAnimation(h,w,frames,id)
  local g = animate.newGrid(h,w,w*4,h)
  local newAnimation = animate.newAnimation(g(frames,1),.15)
  newAnimation.id = id
  return newAnimation
end

function updateAnimations(dt)
  --loop
  for i, a in ipairs(animations) do
    a:update(dt)
  end
end

function drawAnimations()
  end