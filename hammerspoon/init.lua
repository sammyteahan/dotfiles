--
-- Load modules
--
local resize = require('resize')

--
-- Leader key: All hot keys are bound by this table
--
local leader = { 'cmd', 'alt', 'ctrl' }

-- helper function to setup bindings
function bindKey(leader, key, callback)
  hs.hotkey.bind(leader, key, function()
    local window = hs.window.focusedWindow()
    local frame = window:frame()
    local screen = window:screen()
    local max = screen:frame()
    frame = callback(window, frame, screen)
    window:setFrame(frame)
  end)
end

--
-- Resize
--
resize.leader = { 'cmd', 'alt', 'ctrl' }

-- full screen
hs.hotkey.bind(resize.leader, 'up', function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local max = screen:frame()

  resize.resize(win, max.x, max.y, max.w, max.h)
end)

-- % of full screen and center
hs.hotkey.bind(resize.leader, 'down', function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local max = screen:frame()
  local toScreen = nil
  local inBounds = true

  local percentage = 0.80
  local w = max.w * percentage
  local h = max.h * percentage

  resize.resize(win, max.x, max.y, w, h)
  hs.window.focusedWindow():centerOnScreen(toScreen, inBounds)
end)

-- left half
hs.hotkey.bind(resize.leader, 'left', function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local max = screen:frame()

  local w = max.w / 2

  resize.resize(win, max.x, max.y, w, max.h)
end)

-- right half
hs.hotkey.bind(resize.leader, 'right', function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local max = screen:frame()

  local x = max.x + (max.w / 2)
  local w = max.w / 2

  resize.resize(win, x, max.y, w, max.h)
end)

-- left third
hs.hotkey.bind(resize.leader, 'j', function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local max = screen:frame()

  local w = max.w / 3

  resize.resize(win, max.x, max.y, w, max.h)
end)

-- right third
hs.hotkey.bind(resize.leader, 'k', function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local max = screen:frame()

  local x = max.x + ((max.w / 3) * 2)
  local w = max.w / 3

  resize.resize(win, x, max.y, w, max.h)
end)

-- left two-thirds
hs.hotkey.bind(resize.leader, 'h', function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local max = screen:frame()

  local w = ((max.w / 3) * 2)

  resize.resize(win, max.x, max.y, w, max.h)
end)

-- right two-thirds
hs.hotkey.bind(resize.leader, 'l', function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local max = screen:frame()

  local x = max.x + (max.w / 3)
  local w = ((max.w / 3) * 2)

  resize.resize(win, x, max.y, w, max.h)
end)

-- move window north
hs.hotkey.bind(leader, '=', function()
  local window = hs.window.focusedWindow()
  local screen = window:screen()
  if screen:toNorth() then
    window:moveOneScreenNorth()
  end
end)

-- move window south
hs.hotkey.bind(leader, "'", function()
  local window = hs.window.focusedWindow()
  local screen = window:screen()
  if screen:toSouth() then
    window:moveOneScreenSouth()
  end
end)

-- move window west
hs.hotkey.bind(leader, "[", function()
  local window = hs.window.focusedWindow()
  local screen = window:screen()
  if screen:toWest() then
    window:moveOneScreenWest()
  end
end)

-- move window west
hs.hotkey.bind(leader, "]", function()
  local window = hs.window.focusedWindow()
  local screen = window:screen()
  if screen:toEast() then
    window:moveOneScreenEast()
  end
end)

-- Auto reload config on save
function reloadConfig(files)
  doReload = false

  for _, file in pairs(files) do
    if file:sub(-4) == '.lua' then
      doReload = true
    end
  end

  if doReload then
    hs.reload()
  end
end

watchFiles = hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reloadConfig):start()
hs.notify.new({ title = 'Hammerspoon', informativeText = 'Config Loaded' }):send()

