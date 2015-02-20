# loveplane
A small library to help creating parallaxes and pattern repetition using LÖVE.

## Instalation
Copy loveplane.lua and paste it into your project folder.

## How to use
First you'll need to create a loveplane object or instance:
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

## API
If your screen size is different from 800x600, you'll need to adjust it. Do it before setting the image file.
```
loveplane:setSize(width,height)
loveplane:setBitmap(imagemName)
```
You can also move your loveplane object's x and y. This is useful if you want to move the parallax.
```
x,y = 0,0
function love.update(dt)
	x = x+1
	y = y+1
	loveplane:setOx(x)
	loveplane:setOy(y)
end
```
## License
A license has been included in this project

## Credits
Special thanks to Selwyn [http://save-point.org/user-636.html] from those old RPG Maker communities who provided the original formula for this library.
