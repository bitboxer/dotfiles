# Based on this Config: https://github.com/sdegutis/zephyros/wiki/Sizeup-config
# todo:
# - snapback window
# - send window space [dir]

# Make Window Full Screen
bind "M", ["cmd", "ctrl"], -> moveWindow null

# Center Window
bind "C", ["cmd", "ctrl"], -> moveWindow (win, frame) ->
  frame.origin.x += frame.size.width / 6
  frame.origin.y += frame.size.height / 8
  frame.size.width /= 1.5
  frame.size.height /= 1.3

# Center Window with borders
bind "b", ["cmd", "ctrl"], -> moveWindow (win, frame) ->
  frame.origin.x += frame.size.width / 15
  frame.size.width /= 1.15

# Top Left Corner
bind "1", ["cmd", "ctrl"], -> moveWindow (win, frame) ->
  frame.size.width /= 1.5
  frame.size.height /= 1.3

# Top Right Corner
bind "2", ["cmd", "ctrl"], -> moveWindow (win, frame) ->
  width = win.screen().frameIncludingDockAndMenu().size.width
  frame.origin.x = width - (frame.size.width / 1.5)
  frame.size.width /= 1.5
  frame.size.height /= 1.3

# Bottom Left Corner
bind "3", ["cmd", "ctrl"], -> moveWindow (win, frame) ->
  height = win.screen().frameIncludingDockAndMenu().size.height
  frame.origin.y = height - (frame.size.height / 1.3)
  frame.size.width /= 1.5
  frame.size.height /= 1.3

# Bottom Right Corner
bind "4", ["cmd", "ctrl"], -> moveWindow (win, frame) ->
  height = win.screen().frameIncludingDockAndMenu().size.height
  width = win.screen().frameIncludingDockAndMenu().size.width
  frame.origin.x = width - (frame.size.width / 1.5)
  frame.origin.y = height - (frame.size.height / 1.3)
  frame.size.width /= 1.5
  frame.size.height /= 1.3

# show clipboard contents
bind "i", ["cmd", "ctrl"], -> 
  alert api.clipboardContents()

# Send Window Left
bind "left", ["cmd", "ctrl"], -> moveWindow (win, frame) ->
  frame.size.width /= 2

# Send Window Right
bind "right", ["cmd", "ctrl"], -> moveWindow (win, frame) ->
  frame.origin.x += frame.size.width / 2
  frame.size.width /= 2

# Send Window Up
bind "up", ["cmd", "ctrl"], -> moveWindow (win, frame) ->
  frame.size.height /= 2

# Send Window Down
bind "down", ["cmd", "ctrl"], -> moveWindow (win, frame) ->
  frame.origin.y += frame.size.height / 2
  frame.size.height /= 2

# Send Window Upper Left
bind "left", ["shift", "alt", "ctrl"], -> moveWindow (win, frame) ->
  frame.size.width /= 2
  frame.size.height /= 2

# Send Window Upper Right
bind "up", ["shift", "alt", "ctrl"], -> moveWindow (win, frame) ->
  frame.origin.y += frame.size.height / 2
  frame.size.width /= 2
  frame.size.height /= 2

# Send Window Lower Left
bind "down", ["shift", "alt", "ctrl"], -> moveWindow (win, frame) ->
  frame.origin.x += frame.size.width / 2
  frame.size.width /= 2
  frame.size.height /= 2

# Send Window Lower Right
bind "right", ["shift", "alt", "ctrl"], -> moveWindow (win, frame) ->
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
  if win?
    frame = win.screen().frameWithoutDockOrMenu()
    fn win, frame if fn
    win.setFrame frame
