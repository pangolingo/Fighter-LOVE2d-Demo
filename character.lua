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
	-- dude.curr_sprite = "idle"
	-- dude.curr_sprite = 
	dude.anim_stack = { { name = "idle", frame = 1, done = false } }
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
	badguy.sheet = { idle = { "/.V.\\" }, get_hit = { "HIT!", "HIT!", "HIT!", "HIT!", "HIT!", "HIT!"} }
	-- badguy.curr_sprite = "idle"
	-- badguy.curr_sprite = { name = "idle", frame = 1, done = false }
	badguy.anim_stack = { { name = "idle", frame = 1, done = false } }
	return badguy
end

return character