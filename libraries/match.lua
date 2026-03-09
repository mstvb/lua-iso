--- @class statement
---
--- Attributes
--- @field __index table<string, any> Match Table
--- @field default function | boolean Default Function or Value
---
--- Methods
--- @field add function Add a Match Statement
--- @field set_default function Set a Default Match Statement
--- @field get function Get a Match Statement
---
--- Returns
--- @return statement
---
function statement() 
	local match = {}

	--- @type match.__index table<string, any>
    match.__index = match
	
	--- @type match.__index function
	match.default = false

	--- Add Function
	---
	--- Parameters
	--- @param key string
	--- @param statement function
	---
	--- Attributes
	--- @field key string Key to Match
	--- 
	--- Returns
	--- @return boolean
	---
	function match:add(key, statement)	
		if not key then
			error('key is required')
		elseif not statement then
			error('statement is required')
		else
			self[key] = statement
			return true
		end
	end

	--- Set Default Function
	---
	--- Parameters
	--- @param default function
	---
	--- Attributes
	--- @field default function Default Function
	---
	--- Returns
	--- @return boolean
	---
	function match:set_default(default)
		if not default then
			error('default required')
		else
			self.default = default
			return true
		end
	end

	--- Get Function
	---
	--- Parameters
	--- @param equal any
	---
	--- Attributes
	--- @field default function Default Function
	---
	--- Returns
	--- @return function
	--- 
	function match:get(equal)
		if not equal then
			error('Not Exists')
		elseif type(self.default) == 'function' then
			return self.default()
		else
			return self[equal]
		end
	end

	return match

end