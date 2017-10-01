sprite = require "sprite"
force = require 'force'
character = require "character"



local elapsed_time = 0
local entities = {}

function love.load(arg)
	love.keyboard.setKeyRepeat(true)

	dude = character.create_dude()
	badguy = character.create_badguy()
	entities = { dude, badguy }
end

function love.update(dt)
	elapsed_time = elapsed_time + dt
	-- dude = sprite.update(dude, dt, elapsed_time)
		-- entities[1] = sprite.update(entities[1], dt, elapsed_time)
	-- for entity in entities do
	-- print(badguy.last_update)
	-- print(badguy.mov_freq)
	if badguy.last_update + badguy.mov_freq < elapsed_time then
		-- print('updating badguy')
		force.addAccel(badguy, { x = math.random(-1 , 1) * badguy.mov_spd.x, y = math.random (-1, 1) * badguy.mov_spd.y })
	end

	for i, entity in ipairs(entities) do
		entities[i] = sprite.update(entity, dt, elapsed_time)
	end
end

function love.draw()
	love.graphics.print("Hello World!", 400, 300)
	-- sprite.draw(dude)
	for i, entity in ipairs(entities) do
		sprite.draw(entity)
	end

	-- love.graphics.print(string.format("%s, %s", spr.vel.x, spr.vel.y), 0, 0)
end

function love.mousepressed()
end

function love.mousereleased()
end

function love.keypressed( key )
	if key == "up" then
		force.addAccel(dude, { x = 0, y = -dude.mov_spd.y })
	elseif key == "down" then
		force.addAccel(dude, { x = 0, y = dude.mov_spd.y })
	elseif key == "left" then
		force.addAccel(dude, { x = -dude.mov_spd.x, y = 0 })
	elseif key == "right" then
		force.addAccel(dude, { x = dude.mov_spd.x, y = 0 })
	elseif key == "space" then
		sprite.do_punch(dude, entities)
	end
end

function love.keyreleased( key )
end
