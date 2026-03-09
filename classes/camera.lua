local cls = require("libraries/class")

local Camera = cls("Camera"):__init__()

function Camera:__init__(config)
    self.x = config and config.x or 0       -- Kameraposition X
    self.y = config and config.y or 0       -- Kameraposition Y
    
    self.scale = config and config.scale or 1.0
    self.speed = config and config.speed or 500

    self.viewportWidth  = config and config.viewportWidth  or 1280
    self.viewportHeight = config and config.viewportHeight or 720
end

-- Kamerabewegung
function Camera:move(dx, dy, dt)
    self.x = self.x + dx * self.speed * dt
    self.y = self.y + dy * self.speed * dt
end

-- Kamera absolute Position setzen
function Camera:set(x, y)
    self.x = x
    self.y = y
end

-- Kamera-Zoom setzen
function Camera:setZoom(z)
    self.scale = z
end

-- Anwenden der Kamera auf eine Screen‑Position
function Camera:apply(x, y)
    return
        (x - self.x) * self.scale,
        (y - self.y) * self.scale
end

-- Rückrechnung (Screen → Welt)
function Camera:screenToWorld(sx, sy)
    return
        sx / self.scale + self.x,
        sy / self.scale + self.y
end

return Camera