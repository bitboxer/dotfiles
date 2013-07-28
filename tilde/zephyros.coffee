# Based on this Config: https://github.com/sdegutis/zephyros/wiki/Sizeup-config
# todo:
# - snapback window
# - send window space [dir]

# Make Window Full Screen
bind "M", ["cmd", "alt", "ctrl"], -> moveWindow null

# Center Window
bind "C", ["cmd", "alt", "ctrl"], -> moveWindow (frame) ->
  # in SizeUp, this feature has a few options.. they're easy to emulate
  # by altering this function.. 'frame' starts out as the full screen's
  # size so you can just do calculations on it and you're done.
  frame.origin.x += frame.size.width / 6
  frame.origin.y += frame.size.height / 8
  frame.size.width /= 1.5
  frame.size.height /= 1.3

# Center Window
bind "b", ["cmd", "alt", "ctrl"], -> moveWindow (frame) ->
  # in SizeUp, this feature has a few options.. they're easy to emulate
  # by altering this function.. 'frame' starts out as the full screen's
  # size so you can just do calculations on it and you're done.
  frame.origin.x += frame.size.width / 15
  frame.size.width /= 1.2

# Top Left Corner
bind "1", ["cmd", "alt", "ctrl"], -> moveWindow (frame) ->
  # in SizeUp, this feature has a few options.. they're easy to emulate
  # by altering this function.. 'frame' starts out as the full screen's
  # size so you can just do calculations on it and you're done.
  frame.size.width /= 1.5
  frame.size.height /= 1.3

# Top Right Corner
bind "2", ["cmd", "alt", "ctrl"], -> moveWindow (frame) ->
  # in SizeUp, this feature has a few options.. they're easy to emulate
  # by altering this function.. 'frame' starts out as the full screen's
  # size so you can just do calculations on it and you're done.
  width = api.focusedWindow().screen().frameIncludingDockAndMenu().size.width
  frame.origin.x = width - (frame.size.width / 1.5)
  frame.size.width /= 1.5
  frame.size.height /= 1.3

# Bottom Left Corner
bind "3", ["cmd", "alt", "ctrl"], -> moveWindow (frame) ->
  # in SizeUp, this feature has a few options.. they're easy to emulate
  # by altering this function.. 'frame' starts out as the full screen's
  # size so you can just do calculations on it and you're done.
  height = api.focusedWindow().screen().frameIncludingDockAndMenu().size.height
  frame.origin.y = height - (frame.size.height / 1.3)
  frame.size.width /= 1.5
  frame.size.height /= 1.3

# Bottom Right Corner
bind "4", ["cmd", "alt", "ctrl"], -> moveWindow (frame) ->
  # in SizeUp, this feature has a few options.. they're easy to emulate
  # by altering this function.. 'frame' starts out as the full screen's
  # size so you can just do calculations on it and you're done.
  height = api.focusedWindow().screen().frameIncludingDockAndMenu().size.height
  width = api.focusedWindow().screen().frameIncludingDockAndMenu().size.width
  frame.origin.x = width - (frame.size.width / 1.5)
  frame.origin.y = height - (frame.size.height / 1.3)
  frame.size.width /= 1.5
  frame.size.height /= 1.3

bind "i", ["cmd", "alt", "ctrl"], -> 
  alert api.clipboardContents()

# Send Window Left
bind "left", ["cmd", "alt", "ctrl"], -> moveWindow (frame) ->
  frame.size.width /= 2

# Send Window Right
bind "right", ["cmd", "alt", "ctrl"], -> moveWindow (frame) ->
  frame.origin.x += frame.size.width / 2
  frame.size.width /= 2

# Send Window Up
bind "up", ["cmd", "alt", "ctrl"], -> moveWindow (frame) ->
  frame.size.height /= 2

# Send Window Down
bind "down", ["cmd", "alt", "ctrl"], -> moveWindow (frame) ->
  frame.origin.y += frame.size.height / 2
  frame.size.height /= 2

# Send Window Upper Left
bind "left", ["shift", "alt", "ctrl"], -> moveWindow (frame) ->
  frame.size.width /= 2
  frame.size.height /= 2

# Send Window Upper Right
bind "up", ["shift", "alt", "ctrl"], -> moveWindow (frame) ->
  frame.origin.y += frame.size.height / 2
  frame.size.width /= 2
  frame.size.height /= 2

# Send Window Lower Left
bind "down", ["shift", "alt", "ctrl"], -> moveWindow (frame) ->
  frame.origin.x += frame.size.width / 2
  frame.size.width /= 2
  frame.size.height /= 2

# Send Window Lower Right
bind "right", ["shift", "alt", "ctrl"], -> moveWindow (frame) ->
  frame.origin.x += frame.size.width / 2
  frame.origin.y += frame.size.height / 2
  frame.size.width /= 2
  frame.size.height /= 2

# Send Window to Next Display
bind "right", ['ctrl', 'alt'], ->
  win = api.focusedWindow()
  moveToScreen win, win.screen().nextScreen()

# Send Window to Previous Display
bind "left", ['ctrl', 'alt'], ->
  win = api.focusedWindow()
  moveToScreen win, win.screen().previousScreen()

moveToScreen = (win, screen) ->
  return if screen.null?

  oldFrame      = win.frame()
  oldScreenRect = win.screen().frameWithoutDockOrMenu()
  newScreenRect = screen.frameWithoutDockOrMenu()

  xRatio = newScreenRect.size.width  / oldScreenRect.size.width
  yRatio = newScreenRect.size.height / oldScreenRect.size.height

  win.setFrame CGRectMake(Math.round((oldFrame.origin.x - NSMinX(oldScreenRect)) * xRatio) + NSMinX(newScreenRect),
                          Math.round((oldFrame.origin.y - NSMinY(oldScreenRect)) * yRatio) + NSMinY(newScreenRect),
                          Math.round(oldFrame.size.width * xRatio),
                          Math.round(oldFrame.size.height * yRatio))

moveWindow = (fn) ->
  win = api.focusedWindow()
  frame = win.screen().frameWithoutDockOrMenu()
  fn frame if fn
  win.setFrame frame
