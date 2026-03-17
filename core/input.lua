Input = {}

--- @class Input
--- The Input class allows you to bind functions to specific keys and check for key presses in the update loop.
---
--- Attributes
--- self - The Input instance containing the key-action mappings.
---
--- Methods
--- addAction(key: string, action: function)
--- replaceKey(oldKey: string, newKey: string)
--- getAction(key: string): function
--- update()
---
--- Example Usage
--- local input = Input:new()
--- input:addAction("space", function() print("Space key pressed!") end)
--- function love.update(dt)
---     input:update()
--- end

--- Creates a new Input instance.
---
--- Attributes
--- self - The Input instance containing the key-action mappings.
--- key: string - The key to bind the action to.
--- action: function - The function to execute when the key is pressed.
---
--- Returns
--- Input - A new instance of the Input class.
---
function Input:new()
    local o = {}
    setmetatable(o, { __index = Input })
    return o
end

--- Adds a new action to the input system.
---
--- Parameters
--- key: string - The key to bind the action to.
--- action: function - The function to execute when the key is pressed.
---
--- Attributes
--- self - The Input instance containing the key-action mappings.
---
function Input:addAction(key, action)
    self[key] = action
end

--- Replaces an existing key binding with a new key.
---
--- Parameters
--- oldKey: string - The key to be replaced.
--- newKey: string - The new key to bind the action to.
---
--- Attributes
--- self - The Input instance containing the key-action mappings.
---
function Input:replaceKey(oldKey, newKey)
    if self[oldKey] then
        self[newKey] = self[oldKey]
        self[oldKey] = nil
    end
end

--- Retrieves the action associated with a specific key.
---
--- Parameters
--- key: string - The key to retrieve the action for.
---
--- Attributes
--- self - The Input instance containing the key-action mappings.
---
--- Returns
--- function - The function associated with the key, or nil if no action is bound to the
---
function Input:getAction(key)
    return self[key]
end

--- Updates the input system by checking for key presses and executing the associated actions.
---
--- Attributes
--- key: string - The key to check for presses.
--- action: function - The function to execute when the key is pressed.
---
function Input:update()
    for key, action in pairs(self) do
        if type(action) == "function" and love.keyboard.isDown(key) then
            action()
        end
    end
end

return Input