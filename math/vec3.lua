local cls = require("libraries/class")
local Vec3 = cls('Vec3')

--- @class Vec3
---
--- Parameters
--- @param x number
--- @param y number
--- @param z number
---
--- Attributes
--- @field x number
--- @field y number
--- @field z number
---
--- Methods
--- @field __init__ fun(x, y, z) Class Constructor 
--- @field add fun(v) Addition
--- @field sub fun(v) Subtraktion
--- @field scale fun(s) Scale
--- @field length fun() Get Length
--- @field normalize fun() Normalize
---
--- Returns
--- @return Vec3
---
function Vec3:__init__(x, y, z)
    self.x = x
    self.y = y
    self.z = z
end

function Vec3:add(v)
    return Vec3(self.x + v.x, self.y + v.y, self.z + v.z)
end

function Vec3:sub(v)
    return Vec3(self.x - v.x, self.y - v.y, self.z - v.z)
end

function Vec3:scale(s)
    return Vec3(self.x * s, self.y * s, self.z * s)
end

function Vec3:length()
    return math.sqrt(self.x*self.x + self.y*self.y + self.z*self.z)
end

function Vec3:normalize()
    local len = self:length()
    if len == 0 then
        return Vec3(0, 0, 0)
    end
    return Vec3(self.x/len, self.y/len, self.z/len)
end

function Vec3:__str__()
    return ("Vec3(%f, %f, %f)"):format(self.x, self.y, self.z)
end

return Vec3