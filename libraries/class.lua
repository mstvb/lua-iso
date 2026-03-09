--- @class cls
---
--- Parameters
--- @param className string Name of Class
--- @return cls | table 
---
--- Attributes
--- @field __name string Name of Class
--- @field __index table Intheritance Table 
---
--- Methods
--- @field __init__ function Class Constructor
--- @field __name__ function Get Class Name
---
--- Returns
--- @return table instance
---
function cls(className)
    
    local class = {}
    
    --- @type class.__index table<string, any>
    class.__name = className
    
    --- @type class.__index table<string, any>
    class.__index = class

    --- Class Constructor
    ---
    --- Parameters
    --- @param attributes? table Class Attributes
    ---
    --- Attributes
    --- @field attributes table Class Attributes
    --- @field class table Class Table
    ---
    --- Returns
    --- @return table instance
    ---
    function class:__init__(attributes)
        local instance = setmetatable(attributes or {}, class)
        return instance
    end

    --- Returns Class Name
    ---
    --- Returns
    --- @return string __name
    ---
    function class:__name__()
        return self.__name
    end

    return class
end