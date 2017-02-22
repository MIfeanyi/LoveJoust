players = {} -- array of current enemies
player = {id = " ",x,y,img,h,w, onGround, inAir, onCreature, ai, alive}--Reference

function addPlayer(id,x,y,src,h,w, onGround, inAir, onCreature, ai, alive)
  player.id,player.x,player.y,player.h,player.w,player.onGround,player.inAir,player.onCreature,player.ai,player.alive = id,x,y,h,w, onGround, inAir, onCreature, ai, alive
  player.img = love.graphics.newImage(src)
  table.insert(players,player)
end



function selectPlayer(char)
end
