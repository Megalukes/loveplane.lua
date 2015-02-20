# loveplane
A small library to help creating parallaxes and pattern repetition using LÖVE.

## How to use
Download loveplane.lua and put it in your main.lua folder. You'll need to create a loveplane object:
```
loveplane = require "loveplane"
plane = loveplane:new()
```
Set the desired image to repeat across the screen:
```
plane:setBitmap("plane.png")
```
Finally draw it!
```
function love.draw()
	plane:draw()
end
```
Voilà, it's done.
