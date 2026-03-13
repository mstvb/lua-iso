Mat4 = {}

--- @class Mat4
---
--- Parameters
--- @param m table
---
--- Attributes
--- @field m table
---
--- Methods
--- @field new fun(m) Class Constructor
--- @field mul fun(b) Multiply
--- @field translate fun(v) Translate
--- @field scale fun(v) Scale
--- @field rotateX fun(a) Rotate X Axis
--- @field rotateY fun(a) Rotate Y Axis
--- @field rotateZ fun(a) Rotate Z Axis
---
--- Returns
--- @return Mat4
---
function Mat4:new(m)
    setmetatable({}, self)
    self.m = m or {
        1,0,0,0,
        0,1,0,0,
        0,0,1,0,
        0,0,0,1
    }
    return self
end

--- Multiply Function
---
--- Parameters
--- @param b Mat4
---
--- Returns
--- @return Mat4
---
function Mat4:mul(b)
    local a = self.m
    local c = {}
    local bm = b.m

    for row=0,3 do
        for col=0,3 do
            local sum = 0
            for k=0,3 do
                sum = sum + a[row*4+k+1] * bm[k*4+col+1]
            end
            c[row*4+col+1] = sum
        end
    end

    return Mat4(c)
end

--- Translate Function
---
--- Parameters
--- @param v Vec3
---
--- Returns
--- @return Mat4
---
function Mat4.translate(v)
    return Mat4({
        1,0,0,v.x,
        0,1,0,v.y,
        0,0,1,v.z,
        0,0,0,1
    })
end

--- Scale Function
---
--- Parameters
--- @param v Vec3
--- 
--- Returns
--- @return Mat4
---
function Mat4.scale(v)
    return Mat4({
        v.x,0,0,0,
        0,v.y,0,0,
        0,0,v.z,0,
        0,0,0,1
    })
end

--- Rotate X Axis
---
--- Parameters
--- @param a number
---
--- Returns
--- @return Mat4
---
function Mat4.rotateX(a)
    local c,s = math.cos(a), math.sin(a)
    return Mat4({
        1,0,0,0,
        0,c,-s,0,
        0,s,c,0,
        0,0,0,1
    })
end

--- Rotate Y Axis
---
--- Parameters
--- @param a number
---
--- Returns
--- @return Mat4
---
function Mat4.rotateY(a)
    local c,s = math.cos(a), math.sin(a)
    return Mat4({
        c,0,s,0,
        0,1,0,0,
        -s,0,c,0,
        0,0,0,1
    })
end

--- Rotate Z Axis
---
--- Parameters
--- @param a number
--- 
--- Returns
--- @return Mat4
---
function Mat4.rotateZ(a)
    local c,s = math.cos(a), math.sin(a)
    return Mat4({
        c,-s,0,0,
        s,c,0,0,
        0,0,1,0,
        0,0,0,1
    })
end