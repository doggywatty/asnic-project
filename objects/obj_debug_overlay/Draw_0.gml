// DRAW EVENT
//// @desc Draw the debug overlay on the screen
// Note: Ensure this object is drawn on the GUI layer or after other objects if necessary
if global.debug_overlay_visible
{
	fps_average = lerp(fps_average, fps, 0.1); // Smooth FPS average
	var frame_count = current_time div 1000; // Total runtime in seconds
	var mouse_x_pos = mouse_x; // mouse x position
	var mouse_y_pos = mouse_y; // mouse y position
	var room_name = room_get_name(room); // current room name

	// collect instance counts per object
	var object_counts = ds_map_create();
	with all
	{
	    var obj_name = object_get_name(object_index);
	    if (!ds_map_exists(object_counts, obj_name))
	        ds_map_add(object_counts, obj_name, 0);
	    ds_map_replace(object_counts, obj_name, ds_map_find_value(object_counts, obj_name) + 1);
	}

	// generate debug text
	var debug_text = "Asnic | DEBUG OVERLAY\n";
		debug_text += "------------------------------\n";
		debug_text += "FPS (Real): " + string(fps_real) + "\n";
		debug_text += "FPS (Avg): " + string(round(fps_average)) + "\n";
		debug_text += "Uptime: " + string(frame_count) + " seconds\n";
		debug_text += "Room Name: " + room_name + "\n";
		debug_text += "Instance Count: " + string(instance_count) + "\n";
		debug_text += "Mouse Position: (" + string(mouse_x_pos) + ", " + string(mouse_y_pos) + ")\n";
		debug_text += "------------------------------\n";
		debug_text += "Instance List:\n";

	var keys = ds_map_keys_to_array(object_counts);
	for (var i = 0; i < array_length(keys); i++)
	{
	    var key = keys[i];
	    debug_text += " - " + key + ": " + string(object_counts[? key]) + "\n";
	}
	ds_map_destroy(object_counts);

	// draw background box
	var text_width = string_width(debug_text) + (global.debug_padding * 2);
	var text_height = string_height(debug_text) + (global.debug_padding * 2);
	draw_set_alpha(global.debug_transparency);
	draw_set_color(global.debug_bg_color);
	draw_rectangle(0, 0, text_width, text_height, false);
	draw_set_alpha(1);

	// draw the text
	draw_set_color(global.debug_color);
	if (global.debug_font != -1)
	    draw_set_font(global.debug_font);
	draw_text(global.debug_padding, global.debug_padding, debug_text);
}