# lua-libs

Isometric Lua Game Engine for @fm-labs

## Contents

- [Features](#features)
- [Dependencies](#dependencies)
- [Project Links](#project-links)
- [Authors](#authors)

## Features

- Isometric

## Dependencies

> LÖVE - 2D Game Framework
* [Website](https://love2d.org)
* [Documentation](https://www.love2d.org/wiki)

## Examples

> Input Handling with ISO

```lua
require "love"
require "core.input"

local input = Input:new()
input:addAction("enter", function () print("Spacebar") end) -- Add Action
-- OR
input:replaceKey("enter", "space") -- Replace a Key
-- OR
local space = input:getAction("space") -- Stored Function as Variable

function love.update(dt) -- Love Update
    input:update()
end
```

> Isometric Rendering with ISO

```lua
require "love"
require "core.render"

local render = Render:new()

-- Add Objects to Render for Rendering

function love.update(dt) -- Love Update
    render:update()
end

function love.draw() -- Love Draw
    render:draw()
end
```

## Project Links

> lua-iso
* [Project Site](https://github.com/mstvb/lua-iso)
* [Issues](https://github.com/mstvb/lua-iso/issues)

## Authors

> Manuel Staufer (mstvb)
* [Github](https://github.com/mstvb)
* [Email](mailto::manuel.staufervb@gmail.com)
