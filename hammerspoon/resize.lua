local Resize = {}

Resize.resize = function(win, x, y, w, h)
  local frame = win:frame()

  if x then frame.x = x end
  if y then frame.y = y end
  if w then frame.w = w end
  if h then frame.h = h end

  win:setFrame(frame)
end

return Resize

