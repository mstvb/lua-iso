--[[
Entity Class

Parameters
----------
x : float
    Position of the entity on the x-axis.
y : float
    Position of the entity on the y-axis.
scale : float
    Scale of the entity.

Attributes
----------

Methods
-------
new(x : float, y : float, scale : float)
    Create new Instance of Entity
set_position(x : float, y : float)
    Set the position of the entity.
move(dx : float, dy : float)
    Move the entity by dx and dy.
set_scale(scale : float)
    Set the scale of the entity.
update(dt : float)
    Update the entity's state.
draw()
    Draw the entity on the screen.

Returns
-------
Entity
    Returns a Instance of Entity Class
--]]

--[[
Create a New Instance of Entity

Parameters
----------
x : float
    Position of the entity on the x-axis.
y : float
    Position of the entity on the y-axis.
scale : float
    Scale of the entity.

Returns
-------
Entity
    Returns a new instance of the Entity class.
--]]
function Entity:new(x: float, y: float, scale: float)
    local o = {}
    setmetatable(o, { __index = Entity })
    o.x = x or 0
    o.y = y or 0
    o.scale = scale or 1
    return o
end

--[[--
Set the position of the entity.

Parameters
----------
x : float
    Position of the entity on the x-axis.
y : float
    Position of the entity on the y-axis.

Attributes
----------
x : float
    Updated position of the entity on the x-axis.
y : float
    Updated position of the entity on the y-axis.

Returns
-------
x : float
    Updated position of the entity on the x-axis.
y : float
    Updated position of the entity on the y-axis.
--]]
function Entity:set_position(x: float, y: float)
    self.x = x
    self.y = y
    return self.x, self.y
end

--[[
Move Camera with Delta Values

Parameters
----------
dx : float
    Change Position X from Camera
dy : float
    Change Position Y from Camera

Attributes
----------
x : float
    Updated position of the entity on the x-axis.
y : float
    Updated position of the entity on the y-axis.

Returns
-------
x : float
    Updated position of the entity on the x-axis.
y : float
    Updated position of the entity on the y-axis.
--]]
function Entity:move(dx: float, dy: float)
    self.x = self.x + dx
    self.y = self.y + dy
    return self.x, self.y
end

--[[
Set the scale of the entity.

Parameters
----------
scale : float
    Scale of the entity.

Attributes
----------
scale : float
    Updated scale of the entity.

Returns
-------
scale : float
    Updated scale of the entity.
--]]
function Entity:set_scale(scale: float)
    self.scale = scale
    return self.scale
end

--[[
Update the entity's state.

Parameters
----------
dt : float
    Delta time since the last update.
--]]
function Entity:update(dt)
    -- Placeholder for update logic
end

--[[
Draw the entity on the screen.
--]]
function Entity:draw()
    -- Placeholder for drawing logic
end