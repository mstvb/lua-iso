--- @todo Camera Class 
local love = require 'love'
Camera = {}

--- @class Camera
--- The Camera class provides methods for converting between world and screen coordinates, as well as managing the
--- camera's position and scale.
---
--- Parameters
--- x: number - The initial x-coordinate of the camera's position in world space.
--- y: number - The initial y-coordinate of the camera's position in world space.
--- scale: number - The initial scale factor for zooming in and out.
---
--- Attributes
--- self - The Camera instance containing the camera's position and scale.
--- x: number - The x-coordinate of the camera's position in world space.
--- y: number - The y-coordinate of the camera's position in world space.
--- scale: number - The scale factor for zooming in and out.
---
--- Methods
--- new(x: number, y: number, scale: number) - Creates a new Camera
--- toScreen(wx: number, wy: number): (sx: number, sy: number) - Converts world coordinates to screen coordinates.
--- toWorld(sx: number, sy: number): (wx: number, wy: number) - Converts screen coordinates to world coordinates.
--- setPos(x: number, y: number) - Sets the camera's position in world space.
--- move(dx: number, dy: number) - Moves the camera by a specified amount in world space.
--- setScale(s: number) - Sets the camera's scale factor.
--- apply() - Applies the camera's transformations to the rendering context.
--- clear() - Resets the rendering context to its original state after applying the camera's transformations.
---
function Camera:new(x, y, scale)
    local o = setmetatable({}, { __index = Camera })
    self.x = x
    self.y = y
    self.scale = scale
    return o
end

--- Converts world coordinates to screen coordinates.
---
--- Parameters
--- wx: number - The x-coordinate in world space.
--- wy: number - The y-coordinate in world space.
---
--- Returns
--- sx: number - The x-coordinate in screen space.
--- sy: number - The y-coordinate in screen space.
---
function Camera:toScreen(wx, wy)
    local sx = (wx - wy) * 0.5
    local sy = (wx + wy) * 0.25
    return sx, sy
end

--- Converts screen coordinates to world coordinates.
---
--- Parameters
--- sx: number - The x-coordinate in screen space.
--- sy: number - The y-coordinate in screen space.
---
--- Returns
--- wx: number - The x-coordinate in world space.
--- wy: number - The y-coordinate in world space.
---
function Camera:toWorld(sx, sy)
    local wx = sy + sx
    local wy = sy - sx
    return wx, wy
end

--- Sets the camera's position in world space.
---
--- Parameters
--- x: number - The new x-coordinate of the camera's position in world space.
--- y: number - The new y-coordinate of the camera's position in world space.
---
--- Attributes
--- self - The Camera instance containing the camera's position and scale.
---
function Camera:setPos(x, y)
    self.x, self.y = x, y
end

--- Moves the camera by a specified amount in world space.
---
--- Parameters
--- dx: number - The amount to move the camera along the x-axis in world space.
--- dy: number - The amount to move the camera along the y-axis in world space.
---
--- Attributes
--- self - The Camera instance containing the camera's position and scale.
---
function Camera:move(dx, dy)
    self.x = self.x + dx
    self.y = self.y + dy
end

--- Sets the camera's scale factor.
---
--- Parameters
--- s: number - The new scale factor for the camera.
---
--- Attributes
--- self - The Camera instance containing the camera's position and scale.
---
function Camera:setScale(s)
    self.scale = s
end

--- Applies the camera's transformations to the rendering context.
---
--- Attributes
--- self - The Camera instance containing the camera's position and scale.
---
function Camera:apply()
    love.graphics.push()
    love.graphics.scale(self.scale)
    love.graphics.translate(-self.x, -self.y)
end

--- Resets the rendering context to its original state after applying the camera's transformations.
---
--- Attributes
--- self - The Camera instance containing the camera's position and scale.
---
function Camera:clear()
    love.graphics.pop()
end

return Camera