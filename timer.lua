timer = {elaspedTime = 0, maxTime, done = false}

function timer:start(time, dt)
  self.maxTime, self.elaspedTime = time, (self.elaspedTime +dt)
end

function timer:reset()
  self.elaspedTime = 0
  self.done = false
end

function timer:update(dt)
  self.elaspedTime = self.elaspedTime + dt
  if self.elaspedTime > self.maxTime then
    self.done = true
  end
end

function timer:stop()
  return self.elaspedTime
end
