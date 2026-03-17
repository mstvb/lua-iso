<<<<<<< HEAD
=======
local love = require("love")
>>>>>>> 8c6dc952760cf9b3aebc8794507b1297525a20df
Input = {}

--- @class Input
--- The Input class allows you to bind functions to specific keys and check for key presses in the update loop.
<<<<<<< HEAD
---
--- Attributes
--- self - The Input instance containing the key-action mappings.
---
=======
--- 
--- Attributes
--- self - The Input instance containing the key-action mappings.
--- 
>>>>>>> 8c6dc952760cf9b3aebc8794507b1297525a20df
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
<<<<<<< HEAD
---
=======
--- 
>>>>>>> 8c6dc952760cf9b3aebc8794507b1297525a20df
--- Attributes
--- self - The Input instance containing the key-action mappings.
--- key: string - The key to bind the action to.
--- action: function - The function to execute when the key is pressed.
<<<<<<< HEAD
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
=======
--- 
--- Returns
--- Input - A new instance of the Input class.
--- 
function Input:new()
    setmetatable({}, self)
    return self
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
>>>>>>> 8c6dc952760cf9b3aebc8794507b1297525a20df
function Input:addAction(key, action)
    self[key] = action
end

--- Replaces an existing key binding with a new key.
<<<<<<< HEAD
---
--- Parameters
--- oldKey: string - The key to be replaced.
--- newKey: string - The new key to bind the action to.
---
--- Attributes
--- self - The Input instance containing the key-action mappings.
---
=======
--- 
--- Parameters
--- oldKey: string - The key to be replaced.
--- newKey: string - The new key to bind the action to.
--- 
--- Attributes
--- self - The Input instance containing the key-action mappings.
--- 
>>>>>>> 8c6dc952760cf9b3aebc8794507b1297525a20df
function Input:replaceKey(oldKey, newKey)
    if self[oldKey] then
        self[newKey] = self[oldKey]
        self[oldKey] = nil
    end
end

--- Retrieves the action associated with a specific key.
<<<<<<< HEAD
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
=======
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
>>>>>>> 8c6dc952760cf9b3aebc8794507b1297525a20df
function Input:getAction(key)
    return self[key]
end

--- Updates the input system by checking for key presses and executing the associated actions.
<<<<<<< HEAD
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
=======
--- 
--- Attributes
--- key: string - The key to check for presses.
--- action: function - The function to execute when the key is pressed.
--- 
function Input:update()
  for key, action in pairs(self) do
    if love.keyboard.isDown(key) then
      action()
    end
  end
end
>>>>>>> 8c6dc952760cf9b3aebc8794507b1297525a20df
