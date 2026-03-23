local Input = require("core.input")
local love = require 'love'

Player = {}
function Player:new()
    local o = setmetatable({}, { __index = Player })
    self.x = 100
    self.y = 100
    self.speed = 1
    return o
end

function Player:move(dx, dy)
    self.x = self.x + dx
    self.y = self.y + dy
end

function love.load()
    player = Player:new()
    input = Input:new()
    love.window.setTitle("Input Demo")

    -- Example input bindings
    input:addAction('w', function () player:move(0, -player.speed) end)
    input:addAction('s', function () player:move(0, player.speed) end)
    input:addAction('a', function () player:move(-player.speed, 0) end)
    input:addAction('d', function () player:move(player.speed, 0) end)
    input:addAction('escape', function() love.event.quit() end) 
end

function love.update(dt)
    input:update()
end

function love.draw()
    love.graphics.print("Player position: (" .. player.x .. ", " .. player.y .. ")", 10, 30)
    love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 10, 50)
    love.graphics.circle("fill", player.x, player.y, 10)
end