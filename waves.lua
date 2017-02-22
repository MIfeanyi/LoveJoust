
waves = {maxEnemies,spawned = 0, spawnTime,}

function waves:spawn(rate)
  if self.spawned <= self.maxEnemies then
    if (self.maxEnemies/rate + self.spawned) <= self.maxEnemies then
      for i=1,self.maxEnemies/rate,1 do 
        --addEnemy(math.random(1,800),-50,"/img/tank.png",1,3,30,true,"ship") 
      end
      self.spawned = self.maxEnemies/rate + self.spawned
    else 
      for i=1,self.maxEnemies-self.spawned,1 do
        --addEnemy(math.random(1,400),-50,"/img/tank.png",1,3,30,true,"tank") 
      end
      self.spawned = self.maxEnemies-self.spawned + self.spawned
    end
  end
end