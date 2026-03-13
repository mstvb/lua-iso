--- Math Imports
local Vec3 = require("math.vec3")
local Quat = require("math.quat")
local Mat4 = require("math.mat4")

Transform = {}

--- @class Transform
---
--- Parameters
--- @param position
--- @param rotation
--- @param scale
---
--- Attributes
--- @field position Vec3
--- @field rotation Quat
--- @field scale Vec3
---
--- Methods
--- @field new fun(position, rotation, scale)
--- @field set_position fun(v)
--- @field set_rotation fun(q)
--- @field set_scale fun(v)
--- @field get_pos fun()
--- @field get_rotation fun()
--- @field get_scale fun()
---
--- Returns
--- @return Transform
---
function Transform:new(position, rotation, scale)
    self.position = position or Vec3(0,0,0)
    self.rotation = rotation or Quat(0,0,0,1)
    self.scale    = scale    or Vec3(1,1,1)
end

--- Set Position
---
--- Parameters
--- @param v Vec3
---
function Transform:set_position(v)
    self.position = v
end

--- Set Rotation
---
--- Parameters
--- @param q Quat
---
function Transform:set_rotation(q)
    self.rotation = q
end

--- Set Scale
---
--- Parameters
--- @param v Vec3
---
function Transform:set_scale(v)
    self.scale = v
end

--- Get Position
---
--- Returns
--- @return Vec3
---
function Transform:get_pos()
    return self.position
end

--- Get Rotation
---
--- Returns
--- @return Quat
---
function Transform:get_rotation()
    return self.rotation
end

--- Get Scale
---
--- Returns
--- @return Vec3
---
function Transform:get_scale()
    return self.scale
end

--- Get Rotation Matrix
---
--- Returns
--- @return Mat4
---
function Transform:rotationMatrix()
    local q = self.rotation
    local x, y, z, w = q.x, q.y, q.z, q.w

    return Mat4({
        1 - 2*y*y - 2*z*z,   2*x*y - 2*z*w,       2*x*z + 2*y*w,       0,
        2*x*y + 2*z*w,       1 - 2*x*x - 2*z*z,   2*y*z - 2*x*w,       0,
        2*x*z - 2*y*w,       2*y*z + 2*x*w,       1 - 2*x*x - 2*y*y,   0,
        0,                   0,                   0,                   1
    })
end

--- Get Matrix
---
--- Returns
--- @return T
---
function Transform:getMatrix()
    local T = Mat4.translate(self.position)
    local R = self:rotationMatrix()
    local S = Mat4.scale(self.scale)

    return T:mul(R):mul(S)
end