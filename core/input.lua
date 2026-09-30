local love = require("love")
Input = {}

--[[
Input Class for Input Management

Attributes
----------
[key : string] : function
    Table Included Keys with Function

Methods
-------
new()
    Create new Instance of Input
add_action(key : string, action : function)
    Add Function was executed when Key is pressed
replace_key(old_key : string, new_key : string)
    Replace a Key and Save Function to New Key
get_action()
    Returns Function from Key when exists else False
update()
    Update every Key from Input
    
Returns
-------
Input
    Returns a Instance of Input Class
--]]


--[[
Create a New Instance of Input

Returns
-------
Input
    Returns a Input Instance
--]]
function Input:new()
    local o = {}
    setmetatable(o, { __index = Input })
    return o
end

--[[
Add Action with Key | Function

Parameters
----------
key : string
    Key to Press
action : function
    Function to execute when Key pressed

Attributes
----------
[key : string] : function
    Table Included Keys with Function

Returns
-------
action
    Returns Function from new Action
--]]
function Input:add_action(key, action)
    self[key] = action
    return self[key]
end

--[[
Replace Key with Function included

Parameters
----------
old_key : string
    Key before has Replaced
new_key : string
    New Key

Attributes
----------
[key : string] : function
    Table Included Keys with Function

Returns
-------
action
    Returns Function from replaced Key when successfully else False
--]]
function Input:replace_key(old_key, new_key)
    if self[old_key] then
        self[new_key] = self[old_key]
        self[old_key] = nil
        return self[new_key]
    else
        return false
    end
end

--[[
Get Action

Parameters
----------
key : string
    Key from Action

Attributes
----------
[key : string] : function
    Table Included Keys with Funtion

Returns
-------
action
    Returns Function from Key when exists else False
--]]
function Input:get_action(key)
    if self[key] then
        return self[key]
    else
        return false
    end
end

--[[
Update Keys

Attributes
----------
[key : string] : function
    Table Included Keys with Function
--]]
function Input:update()
    for key, action in pairs(self) do
        if love.keyboard.isDown(key) then
            action()
        end
    end
end

return Input
