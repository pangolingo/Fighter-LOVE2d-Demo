local force = {}

function force.addAccel(spr, force)
	spr.accel.x = spr.accel.x + force.x
	spr.accel.y = spr.accel.y + force.y
	return spr
end

function force.applyMass(spr)
	spr = force.addAccel(spr, { x = spr.vel.x * -spr.mass, y = spr.vel.y * -spr.mass })
	return spr
end

function force.clearAccel(spr)
	spr.accel = { x = 0, y = 0 }
	return spr
end

function force.updatePosition(spr)
	spr.pos = { x = spr.pos.x + spr.vel.x, y = spr.pos.y + spr.vel.y }
	return spr
end

function force.applyAccel(spr)
	spr.vel = { x = spr.vel.x + spr.accel.x, y = spr.vel.y + spr.accel.y }
	if math.abs(spr.vel.x) < 0.001 then spr.vel.x = 0 end
	if math.abs(spr.vel.y) < 0.001 then spr.vel.y = 0 end
	return spr
end

return force