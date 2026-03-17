--- @todo Camera Class 
local love = require 'love'
Camera = {}

function Camera:new(x, y, scale)
    local o = setmetatable({}, { __index = Camera })
    self.x = x
    self.y = y
    self.scale = scale
    return o
end

function Camera:toScreen(wx, wy)
    local sx = (wx - wy) * 0.5
    local sy = (wx + wy) * 0.25
    return sx, sy
end

function Camera:toWorld(sx, sy)
    local wx = sy + sx
    local wy = sy - sx
    return wx, wy
end

function Camera:setPos(x, y)
    self.x, self.y = x, y
end

function Camera:move(dx, dy)
    self.x = self.x + dx
    self.y = self.y + dy
end

function Camera:setScale(s)
    self.scale = s
end

function Camera:apply()
    love.graphics.push()
    love.graphics.scale(self.scale)
    love.graphics.translate(-self.x, -self.y)
end

function Camera:clear()
    love.graphics.pop()
end

return Camera