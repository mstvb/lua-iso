Quat = {}

--- @class Quat
---
--- Parameters
--- @param x number
--- @param y number
--- @param z number
--- @param w number
---
--- Attributes
--- @field x number
--- @field y number
--- @field z number
--- @field w number
---
--- Methods
--- @field new fun(x, y, z, w) Class Constructor
--- @field normalize fun() Normalize
--- @field mul fun(q) Multiply
--- @field fromAxisAngle fun(axis, angle) Apply from Axis | Angle
---
--- Returns
--- @return Quat
---
function Quat:__init__(x, y, z, w)
    setmetatable({}, self)
    self.x = x or 0
    self.y = y or 0
    self.z = z or 0
    self.w = w or 1
    return self
end

--- Normalize
---
--- Returns
--- @return Quat
---
function Quat:normalize()
    local l = math.sqrt(self.x*self.x + self.y*self.y + self.z*self.z + self.w*self.w)
    if l == 0 then return Quat(0,0,0,1) end
    return Quat(self.x/l, self.y/l, self.z/l, self.w/l)
end

--- Multiply
---
--- Parameters
--- @param q Quat
---
--- Returns
--- @return Quat
---
function Quat:mul(q)
    return Quat(
        self.w*q.x + self.x*q.w + self.y*q.z - self.z*q.y,
        self.w*q.y - self.x*q.z + self.y*q.w + self.z*q.x,
        self.w*q.z + self.x*q.y - self.y*q.x + self.z*q.w,
        self.w*q.w - self.x*q.x - self.y*q.y - self.z*q.z
    )
end

--- Axis Angle
---
--- Parameters
--- @param axis Vec3
--- @param angle number
---
--- Returns
--- @return Quat
---
function Quat.fromAxisAngle(axis, angle)
    local half = angle/2
    local s = math.sin(half)
    return Quat(axis.x*s, axis.y*s, axis.z*s, math.cos(half))
end