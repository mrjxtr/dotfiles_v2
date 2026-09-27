-- Window rules
-- name: "Custom"

-- idleinhibit example:
-- hl.window_rule({ match = { class = "mpv" }, idle_inhibit = "fullscreen" })

-- xwayland: prevent the large border produced when moving objects in Resolve.
-- Template for problematic xwayland apps:
-- hl.window_rule({ match = { class = [[^(\bresolve\b)$]], xwayland = true }, no_blur = true })
