--- Imports Bindings
local gl = require("moongl")
local glfw = require("moonglfw")
local al = require("moonal")

--- Import Project Libraries
local cls = require("libraries/class")

--- @class Iso
--- @field objects table
---
local Engine = cls('Engine'):__init__()

--- Initalize Function
function Engine:__init__()
    --- @todo Initalize MoonGL
    --- @todo Initalize MoonGLFW
end

--- Update Function
function Engine:update()
    --- @todo Update Window
    --- @todo Update Objects
end

--- Draw Function
function Engine:draw()
    --- @todo Clear Window
    --- @todo Draw Objects
end