io.stdout:setvbuf("no")

loveplane = require "loveplane"

function love.load()
	plane = loveplane:new()
	plane:setBitmap("plane.png")
	ox = 0
	oy = 0
end

function love.update(dt)
	if love.keyboard.isDown("left") then ox = ox+1 end
	if love.keyboard.isDown("right") then ox = ox-1 end
	if love.keyboard.isDown("down") then oy = oy-1 end
	if love.keyboard.isDown("up") then oy = oy+1 end
	plane:setOx(ox)
	plane:setOy(oy)
end

function love.draw()
	plane:draw()
end
