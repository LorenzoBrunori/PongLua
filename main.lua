world = love.physics.newWorld(0, 100, true)

local ball = require "ball"
local const = require "const"
local paddle = require "paddle"
local enemypaddle = require "enemyPaddle"

function love.load()
    love.physics.setMeter(64)

    ball.init()
    paddle.init()
    enemypaddle.init()
    love.window.setMode(const.screen_width, const.screen_height)
end

function love.update(dt)
    world:update(dt)
    ball.top_screen_coll()
    ball.botton_screen_coll()
    ball.coll_paddle()
    ball.coll_enemy_paddle()
    ball.reset_ball()
    ball.update(dt)
    paddle.update(dt)
    enemypaddle.update(dt)
end

function love.draw()
    ball.draw()
    paddle.draw()
    enemypaddle.draw()
end