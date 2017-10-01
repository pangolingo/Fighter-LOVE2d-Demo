libquadtastic = require "vendor/libquadtastic"


-- load the raw quad definitions that you created with Quadtastic
local c_raw_quads = require("quads/core-centaur-quads")
c_image = love.graphics.newImage("quads/core-centaur.png") -- load spritesheet

-- Create LÖVE Quads from raw quad definitions
c_quads = libquadtastic.create_quads(c_raw_quads, c_image:getWidth(), c_image:getHeight())

local character = {}

function character.create_dude()
	local dude = {}
	dude.name = "dude"
	dude.mov_spd = { x = 10, y = 10 }
	dude.pos = { x = 7, y = 99 }
	dude.vel = { x = 0, y = 0 }
	dude.accel = { x = 0, y = 0 }
	dude.mass = 0.3
	dude.framerate = 1/15 -- seconds
	dude.last_update = 0
	dude.sheet = { idle = { "-{o}-" }, punch = { "-{0}--", "-{0}---", "-{0}--=", "-{0}--==", "-{0}--=", "-{0}--", "-{0}--" } }
	dude.spr_type = "text"
	-- dude.curr_sprite = "idle"
	-- dude.curr_sprite = 
	dude.anim_stack = { { name = "idle", frame = 1, done = false } }
	dude.right = true
	return dude
end

function character.create_badguy()
	local badguy = {}
	badguy.name = "badguy"
	badguy.mov_spd = { x = 10, y = 10 }
	badguy.mov_freq = 1/12 -- times per second
	badguy.pos = { x = 200, y = 200 }
	badguy.vel = { x = 0, y = 0 }
	badguy.accel = { x = 0, y = 0 }
	badguy.mass = 0.3
	badguy.framerate = 1/15 -- seconds
	badguy.last_update = 0
	badguy.right = false
	-- badguy.sheet = { idle = { "/.V.\\" }, get_hit = { "HIT!", "HIT!", "HIT!", "HIT!", "HIT!", "HIT!"} }/
	badguy.image = c_image
	badguy.sheet = {
		idle = {
			c_quads.run['run-1'],
			c_quads.run['run-1'],
			c_quads.run['run-2'],
			c_quads.run['run-2'],
		},
		get_hit = {
			c_quads.stand['stand-1'],
			c_quads.stand['stand-1'],
			c_quads.stand['stand-1'],
			c_quads.stand['stand-1'],
			c_quads.stand['stand-1'],
			c_quads.stand['stand-1'],
			c_quads.stand['stand-1'],
			c_quads.stand['stand-1'],
			c_quads.stand['stand-1'],
			c_quads.stand['stand-1']
		}
	}
	badguy.spr_type = "img"
	-- badguy.curr_sprite = "idle"
	-- badguy.curr_sprite = { name = "idle", frame = 1, done = false }
	badguy.anim_stack = { { name = "idle", frame = 1, done = false } }
	return badguy
end

return character