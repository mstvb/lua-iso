local cls = require("libraries.class")
local Transform = require("math3d.transform")

local Entity = cls("Entity")

--- @class Entity
--- 
--- Parameters
--- @param name string
---
--- Attributes
--- @field name string
--- @field transform Transform
--- @field components table
--- @field active boolean
---
--- Methods
--- @field __init__ fun(name) Class Constructor
--- @field addComponent fun(component) 
--- @field getComponent fun(typeName)
--- @field removeComponent fun(typeName)
--- @field update fun(dt)
--- @field setActive fun(active)
--- @field isActive fun()
--- @field __str__ fun()
---
--- Returns
--- @return Entity
---
function Entity:__init__(name)
    self.name = name or "Entity"
    self.transform = Transform()
    self.components = {}
    self.active = true
end

--- Add Component
---
--- Parameters
--- @param component
---
--- Returns
--- @return component
---
function Entity:addComponent(component)
    local typeName = component.__name__ or tostring(component)
    self.components[typeName] = component
    component.entity = self
    if component.onAdd then component:onAdd() end
    return component
end

--- Get Component
---
--- Parameters
--- @param typeName string
--- 
--- Returns
--- @return component
---
function Entity:getComponent(typeName)
    return self.components[typeName]
end

--- Remove Component
--- 
--- Parameters
--- @param typeName 
--- 
function Entity:removeComponent(typeName)
    local comp = self.components[typeName]
    if comp and comp.onRemove then comp:onRemove() end
    self.components[typeName] = nil
end

--- Update Entity
---
--- Parameters
--- @param dt number
--- 
function Entity:update(dt)
    for _, comp in pairs(self.components) do
        if comp.update then
            comp:update(dt)
        end
    end
end

--- Set Active
---
--- Parameters
--- @param active boolean
--- 
function Entity:setActive(active)
    self.active = active
end

--- is Active
---
--- Returns
--- @return active boolean
---
function Entity:isActive()
    return self.active
end

--- Class as String
---
--- Returns
--- @return string
---
function Entity:__str__()
    return ("Entity('%s, %s')"):format(self.name, self.components)
end

return Entity