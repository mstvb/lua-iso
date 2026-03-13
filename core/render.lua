--- @todo: Isometric Rendering Class
Render = {}

--- @class Render
--- 
--- Attributes
--- self - The Render instance containing the list of objects to render.
--- objects - A table containing all objects to be rendered. Each object should have update() and draw() methods.
--- 
--- Methods
--- new() - Creates a new Render instance.
--- add(object) - Adds an object to the render list.
--- remove(object) - Removes an object from the render list.
--- update() - Updates all objects in the render list.
--- draw() - Draws all objects in the render list.
--- 

--- New Render instance.
--- 
--- Attributes
--- self - The Render instance containing the list of objects to render.
--- 
--- Returns
--- Render - A new instance of the Render class.
--- 
function Render:new()
    setmetatable({}, self)
    self.objects = {}
    return self
end

--- Adds an object to the render list.
--- 
--- Parameters
--- object - The object to be added to the render list. The object should have update()
--- and draw() methods.
--- 
--- Attributes
--- self - The Render instance containing the list of objects to render.
--- 
--- Returns
--- The last object in the render list after adding the new object.
--- 
function Render:add(object)
    table.insert(self.objects, object)
    return self.objects[#self.objects]
end

--- Removes an object from the render list.
--- 
--- Parameters
--- object - The object to be removed from the render list.
---
--- Attributes
--- self - The Render instance containing the list of objects to render.
--- 
--- Returns
--- The last object in the render list after removing the specified object.
--- 
function Render:remove(object)
    for i, obj in ipairs(self.objects) do
        if object == obj then
            table.remove(self.objects, i)
            break
        end
    end
    return self.objects[#self.objects]
end

--- Updates all objects in the render list.
--- 
--- Attributes
--- self - The Render instance containing the list of objects to render.
--- 
function Render:update()
    for _, object in ipairs(self.objects) do
        object:update()
    end
end

--- Draws all objects in the render list.
--- 
--- Attributes
--- self - The Render instance containing the list of objects to render.
--- 
function Render:draw()
    for _, object in ipairs(self.objects) do
        object:draw()
    end
end