-- AI
--[[ Goal: Randomly handle enemy movement.
Example: I want every other enemy registered to move in a different direction (Left/Right)
]]










--[[ AI Aproach

Goal: We need to dynamically control the enemies and modify their chracteristics.

Task:

*What Can the AI Do?
*What happens when conditions change?
*What happens when we want to change what the AI does?
*Where does the AI get it's information from?
*Who needs to access?

Implementation:
* setup an array to hold each "mind" for the enemies we control
* on "update(arr,dt)" we must determine what each mind will do: MoveRight, MoveLeft, Follow
* "function lock(x,y)" all AI set to follow will move to this target.

update(arr,dt)
lock(x,y)

--design
function update(arr,dt)

--for loop in arr
if arr.movement = "right" then arr.x++
if arr.movement = "left" then arr.x--
--etc for lock

--check every 3 seconds
if arr.y > floor - border then -- if getting too close to the ground
arr.y--
end -- do same for ceiling

Usage:
function init()
--for loop in spawn loop
addAI("enemy",e,"random")
end

function update(dt)

--]]