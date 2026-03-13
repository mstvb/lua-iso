Logger = {}

--- @class Logger
---
--- Parameters
--- @param prefix string
--- @param suffix string
---
--- Attributes
--- @field prefix string
--- @field suffix string
---
--- Methods
--- @field __init__ fun(prefix, suffix) Class Constructor
--- @field send_message fun(message)
---
--- Returns
--- @return Logger
---
function Logger:new(prefix, suffix)
    setmetatable({}, self)
    self.prefix = prefix or "[Logger]"
    self.suffix = suffix or string.format("[%s]", os.date("%H:%M:%S"))
    return self
end

--- Send Message
---
--- Parameters
--- @param message string
---
function Logger:send_message(message)
    print(string.format("%s >> %s %s", self.prefix, message, self.suffix))
end