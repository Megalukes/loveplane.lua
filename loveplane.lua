--[[
The MIT License (MIT)

Copyright (c) 2015 Lucas Felix

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Special thanks to Selwyn [http://save-point.org/user-636.html] from those old RPG Maker communities.
]]

local loveplane = {x=0,y=0,ox=0,oy=0,zoomX=1.0,zoomY=1.0,angle=0,opacity=255,maxWidth=800,maxHeight=600}

function loveplane:new()
	local obj = {}
	setmetatable(obj,self)
	self.__index = self
	return obj
end

function loveplane:setBitmap(name)
	if love.filesystem.exists(name) then
		self.bitmapData = love.graphics.newImage(name)
		self:setupBatch()
	end
end

function loveplane:getBitmap()
	return self.bitmapData
end

function loveplane:setSize(w,h)
	self.maxWidth = w
	self.maxHeight = h
end

function loveplane:getSize(w,h)
	return self.maxWidth,self.maxHeight
end

function loveplane:setupBatch()
	local w = self.maxWidth
	local h = self.maxHeight
	local bw = self.bitmapData:getWidth()
	local bh = self.bitmapData:getHeight()
	while bw > w * 2 do
		bw = bw + self.bitmapData:getWidth()
	end
	while bh > h * 2 do
		bh = bh + self.bitmapData:getHeight()
	end
	
	local maxX = math.ceil(w / bw)
	local maxY = math.ceil(h / bh)
	local size = ((maxX*2)*(maxY*2))
	print(maxX*2,maxY*2,size)

	self.bitmap = love.graphics.newSpriteBatch(self.bitmapData, size)
	for x = 0, maxX do
		for y = 0, maxY do
			self.bitmap:add(x*self.bitmapData:getWidth(),y*self.bitmapData:getHeight())
		end
	end
end

function loveplane:setOx(ox)
	if self.bitmap == nil then return end
	local w = self.bitmapData:getWidth()--/2
	if ox == self.ox or self.ox == ox % w then return end
	self.ox = (ox%w) --* self.mx
end

function loveplane:getOx() return self.ox end

function loveplane:setOy(oy)
	if self.bitmap == nil then return end
	local h = self.bitmapData:getHeight()
	if oy == self.oy or self.oy == oy % h then return end
	self.oy = oy%h
end

function loveplane:getOy() return self.oy end

function loveplane:draw()
	love.graphics.draw(self.bitmap,x,y,math.rad(self.angle),self.zoomX,self.zoomY,self.ox,self.oy)
end

return loveplane
