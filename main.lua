local Camera = require("core.camera")
local Input = require("core.input")
local Render = require("core.render")
local love = require 'love'

-- Ball object that bounces around
Ball = {}

function Ball:new(x, y, dx, dy, radius, color)
    local o = setmetatable({}, { __index = Ball })
    self.x = x or 0
    self.y = y or 0
    self.dx = dx or 0
    self.dy = dy or 0
    self.radius = radius or 10
    self.color = color or {1, 1, 1}
    return o
end

function Ball:update()
    -- Move the ball
    self.x = self.x + self.dx
    self.y = self.y + self.dy

    -- Bounce off walls
    if self.x - self.radius < 0 or self.x + self.radius > 800 then
        self.dx = -self.dx
        self.x = math.max(self.radius, math.min(800 - self.radius, self.x))
    end
    if self.y - self.radius < 0 or self.y + self.radius > 600 then
        self.dy = -self.dy
        self.y = math.max(self.radius, math.min(600 - self.radius, self.y))
    end
end

function Ball:draw()
    -- Draw ball as a circle
    local sx, sy = cam:toScreen(self.x, self.y)
    love.graphics.setColor(self.color)
    love.graphics.circle("fill", sx, sy, self.radius * cam.scale)
    love.graphics.setColor(1, 1, 1) -- Reset to white
end

function love.load()
    -- Initialize camera
    cam = Camera:new(0, 0, 1)

    -- Initialize input system
    input = Input:new()

    -- Initialize render system
    render = Render:new()

    -- Create 10 bouncing balls with random properties
    math.randomseed(os.time())
    for i = 1, 10 do
        local x = math.random(50, 750)
        local y = math.random(50, 550)
        local dx = math.random(-5, 5)
        local dy = math.random(-5, 5)
        local radius = math.random(5, 20)
        local color = {math.random(), math.random(), math.random()}

        render:add(Ball:new(x, y, dx, dy, radius, color))
    end

    -- Camera controls
    input:addAction('w', function() cam:move(0, -5) end)
    input:addAction('s', function() cam:move(0, 5) end)
    input:addAction('a', function() cam:move(-5, 0) end)
    input:addAction('d', function() cam:move(5, 0) end)
    input:addAction('+', function() cam:setScale(cam.scale + 0.01) end)
    input:addAction('-', function() cam:setScale(cam.scale - 0.01) end)

    -- Reset balls
    input:addAction('r', function()
        render.objects = {}
        for i = 1, 10 do
            local x = math.random(50, 750)
            local y = math.random(50, 550)
            local dx = math.random(-5, 5)
            local dy = math.random(-5, 5)
            local radius = math.random(5, 20)
            local color = {math.random(), math.random(), math.random()}

            local ball = Ball:new(x, y, dx, dy, radius, color)
            render:add(ball)
        end
    end)

    input:addAction('escape', function() love.event.quit() end)

    love.window.setTitle("Bouncing Balls Demo")
end

function love.update(dt)
    input:update()
    render:update()
end

function love.draw()
    cam:apply()

    -- Draw background grid
    love.graphics.setColor(0.2, 0.2, 0.2, 0.5)
    for x = 0, 800, 50 do
        local sx1, sy1 = cam:toScreen(x, 0)
        local sx2, sy2 = cam:toScreen(x, 600)
        love.graphics.line(sx1, sy1, sx2, sy2)
    end
    for y = 0, 600, 50 do
        local sx1, sy1 = cam:toScreen(0, y)
        local sx2, sy2 = cam:toScreen(800, y)
        love.graphics.line(sx1, sy1, sx2, sy2)
    end
    love.graphics.setColor(1, 1, 1)

    -- Render all balls
    render:draw()

    cam:clear()

    -- Draw UI (outside camera transform)
    -- WASD to move, Q/E to zoom, R to reset balls
    -- R to reset balls, ESC to quit
    love.graphics.print("Camera: (" .. string.format("%.1f", cam.x) .. ", " .. string.format("%.1f", cam.y) .. ") Scale: " .. string.format("%.2f", cam.scale), 10, 70)
    love.graphics.print("Balls: " .. #render.objects, 10, 90)
    love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 10, 110)
end