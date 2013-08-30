# Based on this Config: https://github.com/sdegutis/zephyros/wiki.p-config
# todo:
# - snapback window
# - send window space [dir]

# Make Window Full Screen
bind "M", ["cmd", "ctrl", "alt", "shift"], -> moveWindow null

# Center Window
bind "C", ["cmd", "ctrl", "alt", "shift"], -> moveWindow (win, frame) ->
  frame.x += frame.w / 6
  frame.y += frame.h / 8
  frame.w /= 1.5
  frame.h /= 1.3

# Center Window with borders
bind "B", ["cmd", "ctrl", "alt", "shift"], -> moveWindow (win, frame) ->
  frame.x += frame.w / 15
  frame.w /= 1.15

# Top Left Corner
bind "1", ["cmd", "ctrl", "alt", "shift"], -> moveWindow (win, frame) ->
  frame.w /= 1.5
  frame.h /= 1.3

# Top Right Corner
bind "2", ["cmd", "ctrl", "alt", "shift"], -> moveWindow (win, frame) ->
  width = win.screen().frameIncludingDockAndMenu().w
  frame.x = width - (frame.w / 1.5)
  frame.w /= 1.5
  frame.h /= 1.3

# Bottom Left Corner
bind "3", ["cmd", "ctrl", "alt", "shift"], -> moveWindow (win, frame) ->
  height = win.screen().frameIncludingDockAndMenu().h
  frame.y = height - (frame.h / 1.3)
  frame.w /= 1.5
  frame.h /= 1.3

# Bottom Right Corner
bind "4", ["cmd", "ctrl", "alt", "shift"], -> moveWindow (win, frame) ->
  height = win.screen().frameIncludingDockAndMenu().h
  width = win.screen().frameIncludingDockAndMenu().w
  frame.x = width - (frame.w / 1.5)
  frame.y = height - (frame.h / 1.3)
  frame.w /= 1.5
  frame.h /= 1.3

# show clipboard contents
bind "I", ["cmd", "ctrl", "alt", "shift"], -> 
  alert api.clipboardContents()

# Send Window Left
bind "LEFT", ["cmd", "ctrl", "alt", "shift"], -> moveWindow (win, frame) ->
  frame.w /= 2

# Send Window Right
bind "RIGHT", ["cmd", "ctrl", "alt", "shift"], -> moveWindow (win, frame) ->
  frame.x += frame.w / 2
  frame.w /= 2

# Send Window Up
bind "UP", ["cmd", "ctrl", "alt", "shift"], -> moveWindow (win, frame) ->
  frame.h /= 2

# Send Window Down
bind "DOWN", ["cmd", "ctrl", "alt", "shift"], -> moveWindow (win, frame) ->
  frame.y += frame.h / 2
  frame.h /= 2

# Send Window to Next Display
bind "H", ["cmd", "ctrl", "alt", "shift"], ->
  win = api.focusedWindow()
  moveToScreen win, win.screen().nextScreen()

# Send Window to Previous Display
bind "L", ["cmd", "ctrl", "alt", "shift"], ->
  win = api.focusedWindow()
  moveToScreen win, win.screen().previousScreen()

moveToScreen = (win, screen) ->
  return if screen.null?

  frame = win.frame()
  oldScreenRect = win.screen().frameWithoutDockOrMenu()
  newScreenRect = screen.frameWithoutDockOrMenu()

  xRatio = newScreenRect.w  / oldScreenRect.w
  yRatio = newScreenRect.h / oldScreenRect.h

  win.setFrame {
    x: Math.round((frame.x - oldScreenRect.x) * xRatio) + newScreenRect.x
    y: Math.round((frame.y - oldScreenRect.y) * yRatio) + newScreenRect.y
    w: Math.round(frame.w * xRatio)
    h: Math.round(frame.h * yRatio)
  }

moveWindow = (fn) ->
  win = api.focusedWindow()
  if win?
    frame = win.screen().frameWithoutDockOrMenu()
    fn win, frame if fn
    win.setFrame frame
