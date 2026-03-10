local cls = require("libraries/class")
local Camera = cls("Camera")

--- @class Camera
---
--- Parameters
--- @param config table
---
--- Attributes
--- @field x number
--- @field y number
--- @field z number
--- @field scale number
--- @field speed number
--- @field viewportWidth number
--- @field viewportHeight number
---
--- Methods
--- @field __init__ fun(config) Class Constructor
--- @field move fun(dx, dy, dz, dt) Move Camera
--- @field set fun(x, y, z) Set Camera Position
--- @field setZoom fun(z) Set Camera Zoom
--- @field apply fun(sx, sy, sz) Apply Camera to Screen
---
--- Returns
--- @return Camera
---
function Camera:__init__(config)
    self.x = config and config.x or 0
    self.y = config and config.y or 0
    self.z = config and config.z or 0
    
    self.scale = config and config.scale or 1.0
    self.speed = config and config.speed or 500

    self.viewportWidth  = config and config.viewportWidth  or 1280
    self.viewportHeight = config and config.viewportHeight or 720
end

--- Move Camera Function
---
--- Parameters
--- @param dx number
--- @param dy number
--- @param dz number
--- @param dt number
---
function Camera:move(dx, dy, dz, dt)
    self.x = self.x + dx * self.speed * dt
    self.y = self.y + dy * self.speed * dt
    self.z = self.z + dz * self.speed * dt
end

--- Set Camera Position Function
---
--- Parameters
--- @param x number
--- @param y number
--- @param z number
---
function Camera:set(x, y, z)
    self.x = x
    self.y = y
    self.z = z
end

--- Set Camera Zoom Function
---
--- Parameters
--- @param z number
---
function Camera:setZoom(z)
    self.scale = z
end

--- Apply Camera to Screen Function
---
--- Parameters
--- @param sx number
--- @param sy number
--- @param sz number
---
--- Returns
--- @return tuple
---
function Camera:apply(sx, sy, sz)
    return
        (sx - self.x) * self.scale,
        (sy - self.y) * self.scale,
        (sz - self.z) * self.scale
end

return Camera