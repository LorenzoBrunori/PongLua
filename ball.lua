local const = require "const"
local paddle = require "paddle"
local enemypaddle = require "enemyPaddle"

local ball = {}

function ball.init()
    ball.width = 20
    ball.height = 20
    ball.x = (const.screen_width / 2) - (ball.width / 2)
    ball.y = (const.screen_height / 2) - (ball.height / 2)
    ball.speed_X = 200
    ball.speed_Y = 200
end

function ball.top_screen_coll()
    if ball.y < 0 then
        ball.speed_Y = math.abs( ball.speed_Y )
    end
end

function ball.botton_screen_coll()
    if (ball.y + ball.height) > const.screen_height then
        ball.speed_Y = -math.abs( ball.speed_Y ) 
    end
end

function ball.coll_paddle()
    if ball.x <= paddle.width and
        (ball.y + ball.height) >= paddle.y and
        ball.y < (paddle.y + paddle.height)
    then
        ball.speed_X = math.abs(ball.speed_X)
    end
end

function ball.reset_ball()
    if ball.x + ball.width < 0  then
        enemypaddle.score = enemypaddle.score + 1
        ball.init()
    
    else if ball.x > const.screen_width then
        paddle.score = paddle.score + 1
        ball.init()
    end
end
end

function ball.coll_enemy_paddle()
    if (ball.x + ball.width) >= (const.screen_width - enemypaddle.width) and
        (ball.y + ball.height) >= enemypaddle.y and
        ball.y < (enemypaddle.y + enemypaddle.height)
    then
        ball.speed_X = -math.abs(ball.speed_X)
    end
end

function ball.update(dt)
    ball.x = ball.x + (ball.speed_X * dt)
    ball.y = ball.y + (ball.speed_Y * dt)

    if paddle.score >= 5 or enemypaddle.score >= 5 then
        love.event.quit()
    end
end

function ball.draw()
    love.graphics.rectangle("line",ball.x, ball.y, ball.width, ball.height)
    love.graphics.print(paddle.score, 0, 0)
    love.graphics.print(enemypaddle.score, const.screen_width - const.magic_number, 0)

end

return ball