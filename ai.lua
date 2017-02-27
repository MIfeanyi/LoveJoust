ai = {lockX=0,lockY=0,distance = 10,aiTimer=0,maxAi=.05,
  floor,
  ceiling,
  flapTimer=0, maxFlap =0.2}

function ai:lock(x,y)
  self.lockX, self.lockY = x,y
end

function ai:update(x,y,movement,dt)
  self.aiTimer = self.aiTimer+dt
  self.flapTimer = self.flapTimer+dt

  if self.aiTimer >= self.maxAi then
    self.aiTimer = 0
    if movement == "right" then x=x+(physics.velocity*dt)*5 end
    if movement == "left" then x=x-(physics.velocity*dt)*5 end
    if movement == "lock" then
      if x > self.lockX then
        x = x - (physics.velocity*dt)*5
      end
      if x < self.lockX then
        x = x + (physics.velocity*dt)*5
      end
      if y > self.lockY then
        y = y - (physics.jump*dt)*5
      end
      if y < self.lockY then
        y = y + (physics.jump*dt)*5
      end

      --[[
      --check every 3 seconds
      if arr.y > floor - border then -- if getting too close to the ground
      arr.y--
      end -- do same for ceiling
      ]]
    end
    if self.flapTimer > self.maxFlap then
      y = y - (physics.jump*dt)*10
      self.flapTimer = 0
    end
  end
  return x,y
end