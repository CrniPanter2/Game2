require "player"
require "camera"
function love.load()
	player.load()
	pic = love.graphics.newImage("background/oz.png")
	screenWidth = love.graphics.getWidth()
	screenHeight = love.graphics.getHeight()
end

function love.update(dt)
	update_player(dt)
	if player.x > love.graphics.getWidth() /3 then
		camera.x = player.x - love.graphics.getWidth() /3
	end
	if player.y > love.graphics.getWidth() /3 then
		camera.y = player.y - love.graphics.getWidth() /3
	end
end

function love.draw()
	camera:set()
	love.graphics.setColor(255,255,255)
	love.graphics.draw(pic,0,0)
	draw_player()
	camera:unset()
end