local Camera = require("core.camera")
local Input = require("core.input")
local Render = require("core.render")
local love = require 'love'

-- Player object that can be rendered
Player = {}

function Player:new(x, y)
    local o = setmetatable({}, { __index = Player })
    self.x = x or 0
    self.y = y or 0
    self.speed = 2
    return o
end

function Player:update()
    -- Player update logic can go here
end

function Player:draw()
    -- Draw player as a simple rectangle for isometric view
    local sx, sy = cam:toScreen(self.x, self.y)
    love.graphics.setColor(0, 1, 0) -- Green color
    love.graphics.rectangle("fill", sx - 16, sy - 8, 32, 16)
    love.graphics.setColor(1, 1, 1) -- Reset to white
end

function Player:move(dx, dy)
    self.x = self.x + dx
    self.y = self.y + dy
end

-- Some static objects to demonstrate rendering
StaticObject = {}

function StaticObject:new(x, y, color)
    local o = setmetatable({}, { __index = StaticObject })
    self.x = x
    self.y = y
    self.color = color or {1, 1, 1}
    return o
end

function StaticObject:update()
    -- Static objects don't need to update
end

function StaticObject:draw()
    local sx, sy = cam:toScreen(self.x, self.y)
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", sx - 8, sy - 4, 16, 8)
    love.graphics.setColor(1, 1, 1) -- Reset to white
end

function love.load()
    -- Initialize camera
    cam = Camera:new(0, 0, 2)

    -- Initialize input system
    input = Input:new()

    -- Initialize render system
    render = Render:new()

    -- Create player
    player = Player:new(100, 100)
    render:add(player)

    -- Add some static objects
    render:add(StaticObject:new(200, 200, {1, 0, 0})) -- Red
    render:add(StaticObject:new(300, 150, {0, 0, 1})) -- Blue
    render:add(StaticObject:new(50, 250, {1, 1, 0}))  -- Yellow

    -- Camera controls
    input:addAction('w', function() cam:move(0, -10) end)
    input:addAction('s', function() cam:move(0, 10) end)
    input:addAction('a', function() cam:move(-10, 0) end)
    input:addAction('d', function() cam:move(10, 0) end)
    input:addAction('q', function() cam:setScale(cam.scale + 0.1) end)
    input:addAction('e', function() cam:setScale(cam.scale - 0.1) end)

    -- Player controls
    input:addAction('up', function() player:move(0, -player.speed) end)
    input:addAction('down', function() player:move(0, player.speed) end)
    input:addAction('left', function() player:move(-player.speed, 0) end)
    input:addAction('right', function() player:move(player.speed, 0) end)

    input:addAction('escape', function() love.event.quit() end)

    love.window.setTitle("Combined Render, Camera & Input Demo")
end

function love.update(dt)
    input:update()
    render:update()
end

function love.draw()
    cam:apply()

    -- Draw a grid to show the isometric coordinate system
    love.graphics.setColor(0.5, 0.5, 0.5, 0.3)
    for x = 0, 20 do
        for y = 0, 20 do
            local sx, sy = cam:toScreen(x * 64, y * 64)
            love.graphics.rectangle("line", sx, sy, 32, 16)
        end
    end
    love.graphics.setColor(1, 1, 1)

    -- Render all objects
    render:draw()

    cam:clear()

    -- Draw UI (outside camera transform)
    love.graphics.print("Camera position: (" .. string.format("%.1f", cam.x) .. ", " .. string.format("%.1f", cam.y) .. ") Scale: " .. string.format("%.2f", cam.scale), 10, 70)
    love.graphics.print("Player position: (" .. player.x .. ", " .. player.y .. ")", 10, 90)
    love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 10, 110)
end