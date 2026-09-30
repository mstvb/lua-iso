Render = {}

--[[
Module / Class to manage Rendering from Objects in Isometric

Attributes
----------
objects : table
    List / Table for Objects to Render

Methods
-------
new()
    Create new Instance of Render
add(object)
    Add Object to Objects for Rendering
remove(object)
    Remove Object from Objects for Rendering
update()
    Update Objects with Update Function from every Object
draw()
    Draw Objects

Returns
-------
Render
    A Instance of Render Class
--]]


--[[
Create a new Instance of Render

Returns
-------
Render
    Returns A Render Instance 
--]]
function Render:new()
    local o = setmetatable({}, { __index = Render })
    o.objects = {}
    return o
end


--[[
Add Object for Rendering

Parameters
----------
object : object
    Add a Object with Included Update / Draw Function

Attributes
----------
objects : table
    List / Table of Objects

Returns
-------
objects : table
    List / Table of Objects

--]]
function Render:add(object)
    table.insert(self.objects, object)
    return self.objects[#self.objects]
end


--[[
Remove Object for Rendering

Parameters
----------
object : object
    Remove a Object with Included Update / Draw Function

Attributes
----------
object : table
    List / Table of Objects

Returns
-------
objects : table
    List / Table of Objects
--]]
function Render:remove(object)
    for i, obj in ipairs(self.objects) do
        if object == obj then
            table.remove(self.objects, i)
            break
        end
    end
    return self.objects[#self.objects]
end


--[[
Update Objects with Included Update Function

Attributes
----------
objects : table
    List / Table of Objects
--]]
function Render:update()
    for _, object in ipairs(self.objects) do
        object:update()
    end
end

--[[
Draw Object with Included Draw Function

Attributes
----------
objects : table
    List / Table of Objects

--]]
function Render:draw()
    for _, object in ipairs(self.objects) do
        object:draw()
    end
end

return Render