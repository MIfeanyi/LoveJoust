players = {} -- array of current enemies
enemies = {}
local player = {id = " ",x,y,img,h,w, onGround, inAir, onCreature, ai, alive}--Reference
local enemy = {id = " ",x,y,img,h,w, onGround, inAir, onCreature, ai, alive}

--addPlayer("P1",668,600,"/img/ninja.png",64,64,false,true,true,false,true)

function addPlayer(id,x,y,src,h,w, onGround, inAir, onCreature, ai, alive)
  newPlayer = {id = id,x=x,y=y,img,h=h,w=w, onGround=onGround, inAir=inAir,
    onCreature=onCreature, ai=ai, alive=alive,animations = {}}
  newPlayer.id,newPlayer.x,newPlayer.y,newPlayer.h,newPlayer.w,
  newPlayer.onGround,newPlayer.inAir,
  newPlayer.onCreature,newPlayer.ai,newPlayer.alive
  = id,x,y,h,w, onGround, inAir, onCreature, ai, alive
  newPlayer.img = love.graphics.newImage(src)
  table.insert(players,newPlayer)
  print("adding ",newPlayer.id,"AI =",newPlayer.ai)
end

function addEnemy(id,x,y,src,h,w, onGround, inAir, onCreature, ai, alive)
  newEnemy = {id = id,x=x,y=y,img,h=h,w=w, onGround=onGround, inAir=inAir, onCreature=onCreature, ai=ai, alive=alive,movement,animations = {}}
  random = math.random(1,3)
  if random == 1 then newEnemy.movement = "right" end
  if random == 2 then newEnemy.movement = "left" end
  if random == 3 then newEnemy.movement = "lock" end

  newEnemy.id,newEnemy.x,newEnemy.y,newEnemy.h,newEnemy.w,newEnemy.onGround,newEnemy.inAir,
  newEnemy.onCreature,newEnemy.ai,newEnemy.alive = id,x,y,h,w, onGround, inAir, onCreature, ai, alive
  newEnemy.img = love.graphics.newImage(src)
  table.insert(enemies,newEnemy)
  print("adding ",newEnemy.id,"AI =",newEnemy.ai,"movement:",newEnemy.movement)
end

function selectPlayer(char)
end

function playerCollisions(actualX, actualY, cols, len)
  if len > 0 then
    print(("Attempted to move  but ended up in %d,%d due to %d collisions"):format(actualX, actualY, len))
  else
    --print("Moved player to (",actualX,",",actualY, ") no issues.")
  end
  for i=1,len do -- If more than one simultaneous collision, they are sorted out by proximity
  local col = cols[i]
  print(("Collision with %s."):format(col.other.name))
end
  return actualX, actualY
end