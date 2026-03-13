local Transform = require("math.transform")
Entity = {}

--- @class Entity
--- 
--- Parameters
--- name: string - The name of the entity.
---
--- Attributes
--- self - The Entity instance containing the name, transform, components, and active state.
--- name: string - The name of the entity.
--- transform: Transform - The transform component of the entity, containing position, rotation, and scale
--- components: table - A table containing the components attached to the entity, indexed by their type name.
--- active: boolean - A flag indicating whether the entity is active or not.
---
--- Methods
--- new(name: string): Entity
--- addComponent(component: any): any
--- getComponent(typeName: string): any
--- removeComponent(typeName: string)
--- update(dt: number)
--- setActive(active: boolean)
--- isActive(): boolean
--- __str__(): string
---

--- Create a new Entity instance.
---
--- Parameters
--- name: string - The name of the entity.
--- 
--- Returns
--- Entity - A new instance of the Entity class.
---
function Entity:new(name)
    setmetatable({}, self)
    self.name = name or "Entity"
    self.transform = Transform()
    self.components = {}
    self.active = true
    return self
end

--- Add Component
--- 
--- Parameters
--- component: any - The component to be added to the entity. It should have an optional
--- 
--- Attributes
--- self - The Entity instance containing the name, transform, components, and active state.
--- component - The component being added to the entity.
--- 
function Entity:addComponent(component)
    local typeName = component.__name__ or tostring(component)
    self.components[typeName] = component
    return component
end

--- Get Component
--- 
--- Parameters
--- typeName: string - The type name of the component to retrieve.
--- 
--- Attributes
--- self - The Entity instance containing the name, transform, components, and active state.
--- 
--- Returns
--- any - The component instance associated with the given type name, or nil if not found.
function Entity:getComponent(typeName)
    return self.components[typeName]
end

--- Remove Component
---
--- Parameters
--- typeName: string - The type name of the component to remove.
---
--- Attributes
--- self - The Entity instance containing the name, transform, components, and active state.
--- typeName - The type name of the component being removed from the entity.
--- 
function Entity:removeComponent(typeName)
    self.components[typeName] = nil
end

--- Update Entity
---
--- Parameters
--- dt: number - The delta time since the last update, used for time-based updates
--- 
--- Attributes
--- self - The Entity instance containing the name, transform, components, and active state.
--- dt - The delta time since the last update, used for time-based updates.
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
--- active: boolean - A flag indicating whether the entity should be active or not.
--- 
--- Attributes
--- self - The Entity instance containing the name, transform, components, and active state.
--- active - A flag indicating whether the entity should be active or not.
--- 
function Entity:setActive(active)
    self.active = active
end

--- is Active
---
--- Attributes
--- self - The Entity instance containing the name, transform, components, and active state.
---
--- Returns
--- boolean - A flag indicating whether the entity is active or not.
--- 
function Entity:isActive()
    return self.active
end

--- Class as String
---
--- Attributes
--- self - The Entity instance containing the name, transform, components, and active state.
---
--- Returns
--- string - A string representation of the Entity instance, including its name and components.
--- 
function Entity:__str__()
    return ("Entity('%s, %s')"):format(self.name, self.components)
end