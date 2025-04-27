/* CREATE EVENT */
// Object: obj_debug_overlay
/// @desc Place this object anywhere in your game room to activate the debug overlay.
//// It's persistent!
///// Initialize variables and settings for the debug overlay
global.debug_font = -1; // replace with a custom debug font if needed
global.debug_color = c_white; // text color
global.debug_bg_color = c_black; // bg color
global.debug_transparency = 0.5; // bg transparency
global.debug_padding = 5; // padding around text
fps_average = fps_real; // smoothed average FPS
