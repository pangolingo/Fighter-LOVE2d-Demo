force = require 'force'
debugger = require "vendor/debugger_lua/debugger"

local sprite = {}

function sprite.do_punch(spr, entities)
	table.insert(spr.anim_stack, {
		name = "punch",
		frame = 1,
		done = false
	})


	-- if distance from other < 20
	-- other gets hit
	for i, entity in ipairs(entities) do
		-- debugger()
		-- not this person
		if entity ~= spr then
			-- roughtly in line
			if math.abs(entity.pos.y - spr.pos.y) < 10 then
				-- in right direction and not too far away
				if (entity.pos.x > spr.pos.x) and ((entity.pos.x - spr.pos.x) < 50) then
					sprite.get_hit(entity)
				end
			end
		end
	end


	return spr
end

function sprite.get_hit(spr)
	-- print('got hit')
	table.insert(spr.anim_stack, {
		name = "get_hit",
		frame = 1,
		done = false
	})
end

function sprite.update_anim_stack(spr)
	for i, anim in ipairs(spr.anim_stack) do
		-- never remove the first animation
		if i > 1 and anim.done then
			-- print(anim.name .. " is done")
			table.remove(spr.anim_stack, i)
		end
	end
	return spr
end

function sprite.update_sprite(spr, elapsed_time)
	local curr_anim = spr.anim_stack[#spr.anim_stack]

	-- print( spr.last_update + spr.framerate .. " >? " .. elapsed_time)
	if spr.last_update + spr.framerate > elapsed_time then return spr end
	spr.last_update = elapsed_time
	if curr_anim.done == true then return spr end
	curr_anim.frame = curr_anim.frame + 1
	local total_frames = #spr.sheet[curr_anim.name]
	if curr_anim.frame > total_frames then
		curr_anim.frame = total_frames
		curr_anim.done = true
		-- print("anim is done")
	end
	-- print(spr.anim_stack[#spr.anim_stack].done)
	return spr
end

function sprite.update(spr, dt, elapsed_time)
	-- print(spr.name)
	spr = sprite.update_sprite(spr, elapsed_time)
	spr = sprite.update_anim_stack(spr)

	spr = force.applyMass(spr)
	spr = force.applyAccel(spr)
	spr = force.updatePosition(spr)
	spr = force.clearAccel(spr)
	return spr
end

function sprite.draw(spr)
	local curr_anim = spr.anim_stack[#spr.anim_stack]
	love.graphics.print(spr.sheet[curr_anim.name][curr_anim.frame], spr.pos.x, spr.pos.y)
end

return sprite