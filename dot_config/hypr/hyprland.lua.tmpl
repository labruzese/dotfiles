local app_terminal = "foot"
local app_powermenu = "./scripts/powermenu.sh"
local app_menu = "pkill wofi || wofi --show drun"
local app_lock = "hyprlock"
local app_wallpaper = "hyprpaper"
local app_bar = "waybar"
local app_notifications = "mako"
local app_browser = "gtk-launch zen.desktop"
local app_chat = "gtk-launch vesktop.desktop"
local app_bluetooth = "blueman-applet"
local app_network = "nm-applet"
local app_keybindings = "keyd-application-mapper -d"
local app_clipboard = "wl-paste --watch cliphist store"

local dir_screenshots = "~/screenshot-history"

local exe_screenshot = "grimblast --notify copysave area "..dir_screenshots.."/$(date +%Y-%m-%d_%H-%M-%S).png"
local exe_cliphist = "cliphist list | wofi --dmenu --matching=fuzzy | cliphist decode | wl-copy"


-- autostart
hl.on("hyprland.start", function ()
    hl.exec_cmd(app_bar)
    hl.exec_cmd(app_wallpaper)
    hl.exec_cmd(app_network)
    hl.exec_cmd(app_bluetooth)
    hl.exec_cmd(app_notifications)
    hl.exec_cmd(app_keybindings)
    hl.exec_cmd(app_clipboard)

    hl.exec_cmd(
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    )

end)

hl.env("XCURSOR_SIZE", 		"24")

hl.env("XDG_CURRENT_DESKTOP",	"Hyprland")
hl.env("XDG_SESSION_TYPE",		"wayland")
hl.env("XDG_SESSION_DESKTOP",	"Hyprland")

hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME",	"qt6ct")

hl.env("LIBVA_DRIVER_NAME", "nvidia")

hl.config({
    general = {
	gaps_in = 2,
	gaps_out = 3,
	border_size = 1,
	layout = "dwindle",
	col = {
	    active_border = {
		colors = {"rgba(83a598ee)", "rgba(d3869bee)" },
		angle = 45,
	    },
	    inactive_border = "rgba(665c54aa)"
	}
    },

    input = {
	touchpad = {
	    natural_scroll = false
	},
	accel_profile = "flat",
	follow_mouse = 1,
	force_no_accel = true,
	kb_layout = "us",
	sensitivity = 0,
    },

    master = {
	new_status = "master"
    },

    dwindle = {
	preserve_split = true,
    },

    misc = {
	disable_hyprland_logo = true,
	force_default_wallpaper = 0,
	middle_click_paste = false,
    },

    decoration = {
	rounding = 2,
	active_opacity = 1,
	inactive_opacity = 0.88,

	blur = {
	    enabled = true,
	    passes = 5,
	    size = 3,
	    vibrancy = 0.1696,
	},

	shadow = {
	    color = "rgba(1a1a1aee)",
	    enabled = true,
	    range = 4,
	    render_power = 3,
	},
    },

    xwayland = { force_zero_scaling = true },
})

local primary_monitor = "DP-3"

hl.monitor({
    output = primary_monitor,
    mode = "2560x1440@280",
    position = "0x0",
    scale = "1",
})

local game_classes = "(RocketLeague|rocketleague|steam_app_.*|lutris-.*|heroic-.*|.*\\.exe)"

hl.window_rule({
  match            = { class = game_classes },
  immediate        = true,
  fullscreen_state = "2 2",
  border_size      = 0,
  no_shadow        = true,
  no_blur          = true,
  rounding         = 0,
  no_anim          = true,
})

hl.window_rule({ match = { class = "^(rocketleague\\.exe)$" }, immediate = true, render_unfocused = true })
hl.window_rule({ match = { class = "^(bakkesmod\\.exe)$" }, float = true })

hl.window_rule({ match = { class = "^(vesktop)$"       }, workspace = "5"       })

-- Suppress maximize requests globally
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

-- Ignore phantom XWayland windows
hl.window_rule({
  match      = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
  no_focus   = true,
})

-- Workspace rules
hl.workspace_rule({ workspace = "1", monitor = primary_monitor, default = true })
hl.workspace_rule({ workspace = "2", monitor = primary_monitor })
hl.workspace_rule({ workspace = "3", monitor = primary_monitor })
hl.workspace_rule({ workspace = "4", monitor = primary_monitor })
hl.workspace_rule({ workspace = "5", monitor = primary_monitor, on_created_empty = app_chat})

local mainMod = "SUPER"

hl.bind(mainMod .. "+ Return", hl.dsp.exec_cmd(app_terminal))
hl.bind(mainMod .. "+ SHIFT + Return", hl.dsp.exec_cmd(app_terminal))
hl.bind(mainMod .. "+ D", hl.dsp.exec_cmd(app_browser))
hl.bind(mainMod .. "+ space", hl.dsp.exec_cmd(app_menu))
hl.bind(mainMod .. "+ P", hl.dsp.exec_cmd(app_powermenu))
hl.bind(mainMod .. "+ period", hl.dsp.exec_cmd(app_lock))

hl.bind(mainMod .. "+ A", hl.dsp.layout("togglesplit"))

hl.bind(mainMod .. "+ C", hl.dsp.window.close())
hl.bind(mainMod .. "+ SHIFT + C", hl.dsp.window.kill())
hl.bind(mainMod .. "+ F", hl.dsp.window.fullscreen("fullscreen", "toggle"))
hl.bind(mainMod .. "+ SHIFT + F", hl.dsp.window.float("toggle"))

hl.bind(mainMod .. "+ SHIFT + H", hl.dsp.window.move({direction="left"}))
hl.bind(mainMod .. "+ SHIFT + L", hl.dsp.window.move({direction="right"}))
hl.bind(mainMod .. "+ SHIFT + K", hl.dsp.window.move({direction="up"}))
hl.bind(mainMod .. "+ SHIFT + J", hl.dsp.window.move({direction="down"}))

hl.bind(mainMod .. "+ SHIFT + Q", hl.dsp.window.move({workspace = 1}))
hl.bind(mainMod .. "+ SHIFT + W", hl.dsp.window.move({workspace = 2}))
hl.bind(mainMod .. "+ SHIFT + E", hl.dsp.window.move({workspace = 3}))
hl.bind(mainMod .. "+ SHIFT + R", hl.dsp.window.move({workspace = 4}))
hl.bind(mainMod .. "+ SHIFT + X", hl.dsp.window.move({workspace = 5}))

hl.bind(mainMod .. "+ H", hl.dsp.focus({direction = "l"}))
hl.bind(mainMod .. "+ L", hl.dsp.focus({direction = "r"}))
hl.bind(mainMod .. "+ K", hl.dsp.focus({direction = "u"}))
hl.bind(mainMod .. "+ J", hl.dsp.focus({direction = "d"}))

hl.bind(mainMod .. "+ Q", hl.dsp.focus({workspace = 1}))
hl.bind(mainMod .. "+ W", hl.dsp.focus({workspace = 2}))
hl.bind(mainMod .. "+ E", hl.dsp.focus({workspace = 3}))
hl.bind(mainMod .. "+ R", hl.dsp.focus({workspace = 4}))
hl.bind(mainMod .. "+ X", hl.dsp.focus({workspace = 5}))

hl.bind("ALT + mouse:272", hl.dsp.window.drag(), { mouse = true })    -- ALT + LMB: Move a window by dragging more than 10px.
hl.bind("ALT + mouse:272", hl.dsp.window.resize(), { mouse = true })  -- ALT + LMB: Floats a window by clicking
hl.bind(mainMod .. "+ mouse_down", hl.dsp.focus({workspace = "e+1"}))
hl.bind(mainMod .. "+ mouse_up", hl.dsp.focus({workspace = "e-1"}))

hl.bind(mainMod .. "+ SHIFT + S", hl.dsp.exec_cmd(exe_screenshot))
hl.bind(mainMod .. "+ V", hl.dsp.exec_cmd(exe_cliphist))

hl.bind(mainMod .. "+ G", hl.dsp.exec_cmd("gsr-ui-cli toggle-show"))
hl.bind(mainMod .. "+ F11", hl.dsp.exec_cmd("gsr_ui-cli replay-save-1-min"))
hl.bind(mainMod .. "+ F12", hl.dsp.exec_cmd("gsr_ui-cli replay-save-10-min"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


hl.curve("easeOutQuint",    { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic",  { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",          { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear",    { type = "bezier", points = { {0.5, 0.5}, {0.75, 1.0} } })
hl.curve("quick",           { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})
