local const = require "const"
local paddle = {}

function paddle.init()
    paddle.width = 20
    paddle.height = 70
    paddle.x = 0
    paddle.y = (const.screen_height / 2) - (paddle.height / 2)
    paddle.speedY = 200
    paddle.score = 0
end


function paddle.draw()
    love.graphics.rectangle("line",paddle.x, paddle.y, paddle.width, paddle.height)
end

function paddle.update(dt)
    if love.keyboard.isDown("w") then
        paddle.y = paddle.y - (dt * paddle.speedY)
    end

    if love.keyboard.isDown("s") then
        paddle.y = paddle.y + (dt * paddle.speedY)
    end

    if paddle.y < 0 then
        paddle.y = 0
    elseif(paddle.y + paddle.height) >  const.screen_height then
        paddle.y = const.screen_height - paddle.height
    end
end

return paddle