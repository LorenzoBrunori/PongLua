local const = require "const"
local enemypaddle = {}

function enemypaddle.init()
    enemypaddle.width = 20
    enemypaddle.height = 70
    enemypaddle.x = const.screen_width - enemypaddle.width
    enemypaddle.y = (const.screen_height / 2) - (enemypaddle.height / 2)
    enemypaddle.speedY = 200
    enemypaddle.score = 0
end


function enemypaddle.draw()
    love.graphics.rectangle("line",enemypaddle.x, enemypaddle.y, enemypaddle.width, enemypaddle.height)
end

function enemypaddle.update(dt)
    if love.keyboard.isDown("up") then
        enemypaddle.y = enemypaddle.y - (dt * enemypaddle.speedY)
    end

    if love.keyboard.isDown("down") then
        enemypaddle.y = enemypaddle.y + (dt * enemypaddle.speedY)
    end

    if enemypaddle.y < 0 then
        enemypaddle.y = 0
    elseif(enemypaddle.y + enemypaddle.height) >  const.screen_height then
        enemypaddle.y = const.screen_height - enemypaddle.height
    end
end

return enemypaddle