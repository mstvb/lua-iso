local Camera = require("core.camera")
local Input = require("core.input")
local love = require 'love'

function love.load()
    cam = Camera:new(0, 0, 2)
	input = Input:new()
	input:addAction('w', function () cam:move(0, -5) end )
	input:addAction('s', function () cam:move(0, 5) end)
	input:addAction('a', function () cam:move(-5, 0) end)
	input:addAction('d', function () cam:move(5, 0) end)
	input:addAction('+', function () cam:setScale(cam.scale + 0.01) end)
	input:addAction('-', function () cam:setScale(cam.scale - 0.01) end)
	input:addAction('escape', function() love.event.quit() end)
end

function love.update(dt)
	input:update()
end

function love.draw()
    cam:apply()

    -- Beispiel: 10x10 isometrische Tiles
    for x = 0, 10 do
        for y = 0, 10 do
            local sx, sy = cam:toScreen(x * 64, y * 64)
            love.graphics.rectangle("line", sx, sy, 32, 16)
        end
    end

    cam:clear()
end