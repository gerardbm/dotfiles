-- Zoom
function zoom_in()
	zoom = mp.get_property("video-zoom")
	zoom_to = zoom + 0.2
	mp.set_property("video-zoom", zoom_to)
end

function zoom_out()
	zoom = mp.get_property("video-zoom")
	zoom_to = zoom - 0.2
	mp.set_property("video-zoom", zoom_to)
end

function zoom_reset()
	mp.set_property("video-zoom", 0)
end

-- Rotate
function cw()
	prop = mp.get_property_native("video-rotate")
	rota = prop + 90
	if rota == 360 then
		mp.set_property_native("video-rotate", 0)
	else
		mp.set_property_native("video-rotate", rota)
	end
end

function ccw()
	prop = mp.get_property_native("video-rotate")
	rota = prop - 90
	mp.set_property_native("video-rotate", rota)
end

function reset_rotate()
	mp.set_property_native("video-rotate", 0)
end

-- Pan
function pan_left()
	pan = mp.get_property("video-pan-x")
	pan_to = pan + 0.05
	mp.set_property("video-pan-x", pan_to)
end

function pan_right()
	pan = mp.get_property("video-pan-x")
	pan_to = pan - 0.05
	mp.set_property("video-pan-x", pan_to)
end

function pan_up()
	pan = mp.get_property("video-pan-y")
	pan_to = pan + 0.05
	mp.set_property("video-pan-y", pan_to)
end

function pan_down()
	pan = mp.get_property("video-pan-y")
	pan_to = pan - 0.05
	mp.set_property("video-pan-y", pan_to)
end

function pan_reset()
	mp.set_property("video-pan-y", 0.0)
	mp.set_property("video-pan-x", 0.0)
end

function custom_quit_for_i3wm()
	mp.command('quit; run i3-msg workspace back_and_forth')
end

function inverse_color()
	if var_f == nil or var_f == 1 then
		mp.set_property("vf", "eq=1:-1")
		var_f = 0
	else
		mp.set_property("vf", "eq=1:1")
		var_f = 1
	end
end

-- Key bindings
mp.add_key_binding("z", "zoom_in", zoom_in)
mp.add_key_binding("Shift+z", "zoom_out", zoom_out)
mp.add_key_binding("Ctrl+z", "zoom_reset", zoom_reset)

mp.add_key_binding("r", "cw", cw)
mp.add_key_binding("Shift+r", "ccw", ccw)
mp.add_key_binding("Ctrl+r", "reset_rotate", reset_rotate)

mp.add_key_binding("l", "pan_right", pan_right)
mp.add_key_binding("h", "pan_left", pan_left)
mp.add_key_binding("k", "pan_up", pan_up)
mp.add_key_binding("j", "pan_down", pan_down)
mp.add_key_binding("Ctrl+p", "reset_pan", pan_reset)

mp.add_key_binding("i", "inverse_color", inverse_color)

mp.add_key_binding("q", "custom_quit_for_i3wm", custom_quit_for_i3wm)
