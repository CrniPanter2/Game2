player={}
babic=love.graphics.newImage("Skins/RaidBoss.png")
function player.load()
	
	player.width=300
	player.height=142
	player.x = 5
	player.y = 5
	player.xvel = 0
	player.yvel = 0
	player.friction = 9.5
	player.speed = 2250
end

function player.draw()
	love.graphics.draw(babic,player.x,player.y)
end

function player.physics(dt)
player.x = player.x + player.xvel * dt
player.y = player.y + player.yvel * dt
player.xvel = player.xvel * (1 - math.min(dt*player.friction, 1)) 
player.yvel = player.yvel * (1 - math.min(dt*player.friction, 1)) 
end

function player.move(dt)
	if love.keyboard.isDown('d') and player.xvel < player.speed then 
	player.xvel = player.xvel + player.speed * dt
	end
	if love.keyboard.isDown('a') and player.xvel > -player.speed then 
	player.xvel = player.xvel - player.speed * dt
	end
	if love.keyboard.isDown('w') and player.yvel > -player.speed then 
	player.yvel = player.yvel - player.speed * dt
	end
	if love.keyboard.isDown('s') and player.yvel < player.speed then 
	player.yvel = player.yvel + player.speed * dt
	end
end

function player.boundary()
	if player.x < 0 then player.x =0 player.xvel=0 end
	if player.y < 0 then player.y =0 player.yvel=0 end
end	

function draw_player()
player.draw()
end
function update_player(dt)
player.physics(dt)
player.move(dt)
player.boundary()
end