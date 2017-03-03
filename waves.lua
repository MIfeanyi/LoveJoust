
waves = {maxEnemies=30,spawned = 0, spawnTime}

function waves:spawn(rate)
  math.randomseed(os.time()) math.random(); math.random(); math.random()

  if self.spawned <= self.maxEnemies then
    if (rate + self.spawned) <= self.maxEnemies then
      for i=1,rate,1 do
        addEnemy("enemy",math.random(i,400),0,"/img/enemy.png",64,64,false,true,true,true,true)
      end
      print("added",rate)
      self.spawned = rate + self.spawned
    else
      for i=1,self.maxEnemies-self.spawned,1 do
        addEnemy("enemy",math.random(i,400),0,"/img/enemy.png",64,64,false,true,true,true,true)
      end
      print("Added",self.maxEnemies-self.spawned)
      self.spawned = self.maxEnemies-self.spawned + self.spawned
    end
  end
  print("total spawned:",waves.spawned)
end