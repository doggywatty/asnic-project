// STEP EVENT
/// @desc Toggle the debug overlay visibility when F6 is pressed

// initialize a toggle variable if it doesn't exist
if (!variable_global_exists("debug_overlay_visible"))
    global.debug_overlay_visible = true; // default, visible
if (keyboard_check_pressed(vk_f6))
    global.debug_overlay_visible = !global.debug_overlay_visible; // toggle visibility