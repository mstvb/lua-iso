--- @todo Camera Class 
local love = require 'love'
Camera = {}

--[[
Camera Class for Camera View / Control

Parameters
----------
x : float
    Position X from Camera
y : float
    Position Y from Camera
scale : float
    Scale of Camera View

Attributes
----------
x : float
    Position X from Camera
y : float
    Position Y from Camera
scale : float
    Scale of Camera View

Methods
-------
new(x, y, scale)
    Create A Instance from Camera
to_screen(wx, wy)
    Convert World Position to Screen Position
to_world(sx, sy)
    Convert Screen Position to World Position
set_pos(x, y)
    Set Position of Camera
set_scale(s)
    Set Scale of Camera View
apply()
    Apply and Update Camera
clear()
    Clear Camera from Screen

Returns
-------
Camera
    Returns a Camera Instance
--]]


--[[
Create a New Instance of Camera

Parameters
----------
x : float
    Position X from Camera
y : float
    Position Y from Camera
scale : float
    Scale from Camera

Attributes
----------
x : float
    Position X from Camera
y : float
    Position Y from Camera
scale : float
    Scale from Camera

Returns
-------
Camera
    Returns a Camera Instance
--]]
function Camera:new(x, y, scale)
    local o = setmetatable({}, { __index = Camera })
    o.x = x
    o.y = y
    o.scale = scale
    return o
end


--[[
Convert World Position to Screen Position

Parameters
----------
wx : float
    Position X from World
wy : float
    Position Y from World

Returns
-------
sx, sy : float
    Returns World Position Convert to Screen Position
--]]
function Camera:to_screen(wx, wy)
    local sx = (wx - wy) * 0.5
    local sy = (wx + wy) * 0.25
    return sx, sy
end

--[[
Convert Screen Position to World Position

Parameters
----------
sx : float
    Position X from Screen
sy : float
    Position Y from Screen

Returns
-------
wx, wy : float
    Returns Screen Position Convert to World Position
--]]
function Camera:to_world(sx, sy)
    local wx = sy + sx
    local wy = sy - sx
    return wx, wy
end

--[[
Set Position from Camera

Parameters
----------
x : float
    Position X from Camera
y : float
    Position Y from Camera

Returns
-------
x, y : float
    Returns X and Y Position from Camera
--]]
function Camera:set_pos(x, y)
    self.x, self.y = x, y
    return self.x, self.y
end

--[[
Set Scale from Camera

Parameters
----------
scale : float
    Scale from Camera

Returns
-------
scale : float
    Returns Scale from Camera
--]]
function Camera:set_scale(s)
    self.scale = s
    return self.scale
end

--[[
Apply Attributes and Update Camera

Attributes
----------
x : float
    Position X from Camera
y : float
    Position Y from Camera
scale : float
    Scale from Camera
--]]
function Camera:apply()
    love.graphics.push()
    love.graphics.scale(self.scale)
    love.graphics.translate(-self.x, -self.y)
end

--[[
Clear Camera from Screen
--]]
function Camera:clear()
    love.graphics.pop()
end

return Camera
