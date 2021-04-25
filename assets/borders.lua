function createBorders()
    borders = {
        width = 10,
        height = 10,
    }

    -- border image
    borders.vimg = love.graphics.newImage("assets/border.png")

    -- add borders to world for collision
    game.world:add({name="left"}, 0, 0, borders.width, 800)
    game.world:add({name="right"}, 490, 0, borders.width, 800)
    game.world:add({name="top"}, 0, 0, 500, borders.height)
    game.world:add({name="bottom"}, 0, 790, 500, borders.height)

    return borders
end

function drawBorders(borders)
    -- left & right
    love.graphics.draw(borders.vimg, -5, 0, 0, 1, 6, 0, 0)
    love.graphics.draw(borders.vimg, 485, 0, 0, 1, 6, 0, 0)
end