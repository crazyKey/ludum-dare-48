require("assets.fish")
require("assets.borders")
require("assets.rubbish")
require("assets.menu")
require("assets.end-screen")

game = {
    debug = false,
    menu = true,
    play = false,
    win = false,
}

delta = 0.1

function game:init()
    game.text_tags = {
        font  = love.graphics.newFont('fonts/FindetNemo.ttf', 26),
        red     = {255,0,0,255},
        ['/red']= {255,255,255},
        regular = love.graphics.newFont(39),
    }

    love.graphics.setBackgroundColor({50/255, 150/255, 250/255})

    love.graphics.setDefaultFilter("nearest", "nearest")

    initGame()
end

function initGame()
    game.world = bump.newWorld()

    -- borders

    game.fish = createFish()
    game.borders = createBorders()
    game.rubbish = createRubbish()
    game.menu_screen = createMenu()
    game.end_screen = createEndScreen()
end

function resetGame()
    game.menu = true
    game.play = false

    soundtrack:play()

    initGame()
end

function game:update(dt)
    delta = dt

    if game.play then
        fish = moveFish(game.fish)
        rubbish = moveRubbish(game.rubbish, game.fish)
    elseif game.menu then
        closeMenu()
    else
        if not game.win and love.keyboard.isDown("space") then
            resetGame()
        end
    end
end

function game:draw()
    if game.play then
        drawFish(game.fish)
        drawDepth(game.fish)
        drawBorders(game.borders)
        drawRubbish(game.rubbish)
    elseif game.menu then
        drawMenu(game.menu_screen)
    else
        drawEndScreen(game.end_screen)
    end

    -- show collision boxes
    if game.debug then
        local items, len = game.world:getItems()
        for i = 1, len do
            local x, y, w, h = game.world:getRect(items[i])
            love.graphics.rectangle("line", x, y, w, h)
        end
    end
end
