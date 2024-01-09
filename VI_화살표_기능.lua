-- vi
local fastKeyStroke = function(modifier, event_char)
  hs.eventtap.keyStroke(modifier, event_char, 30)
end

local h_bind = hs.hotkey.new({}, "h", 
function() fastKeyStroke({}, "left") end,
nil,
function() fastKeyStroke({}, "left") end
)

local j_bind = hs.hotkey.new({}, "j", 
function() fastKeyStroke({}, "down") end,
nil,
function() fastKeyStroke({}, "down") end
)

local k_bind = hs.hotkey.new({}, "k", 
function() fastKeyStroke({}, "up") end,
nil,
function() fastKeyStroke({}, "up") end
)

local l_bind = hs.hotkey.new({}, "l", 
function() fastKeyStroke({}, "right") end,
nil,
function() fastKeyStroke({}, "right") end
)

-- combind cmd
local h_cmd_bind = hs.hotkey.new({"cmd"}, "h", 
function() fastKeyStroke({}, "left") end,
nil,
function() fastKeyStroke({}, "left") end)
:enable()
local j_cmd_bind = hs.hotkey.new({"cmd"}, "j", 
function() fastKeyStroke({}, "down") end,
nil,
function() fastKeyStroke({}, "down") end)
:enable()
local k_cmd_bind = hs.hotkey.new({"cmd"}, "k", 
function() fastKeyStroke({}, "up") end,
nil,
function() fastKeyStroke({}, "up") end)
:enable()
local l_cmd_bind = hs.hotkey.new({"cmd"}, "l", 
function() fastKeyStroke({}, "right") end,
nil,
function() fastKeyStroke({}, "right") end)
:enable()

h_cmd_bind:enable()
j_cmd_bind:enable()
k_cmd_bind:enable()
l_cmd_bind:enable()

function set_vim_keymap()
  h_bind:enable()
  j_bind:enable()
  k_bind:enable()
  l_bind:enable()
end

function unset_vim_keymap()
  h_bind:disable()
  j_bind:disable()
  k_bind:disable()
  l_bind:disable()
end

local vim_arrow_mode_status = false
function vim_arrow_mode()
  if vim_arrow_mode_status == true then
    hs.alert.show("vim off")
    unset_vim_keymap()
    vim_arrow_mode_status= false
  else
    hs.alert.show("vim on")
    set_vim_keymap()
    vim_arrow_mode_status = true
  end
end

hs.hotkey.bind({"cmd", "shift"}, "space", vim_arrow_mode)
