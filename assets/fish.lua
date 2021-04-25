function createFish()
    fish = {
        x = 250,
        y = 400,
        width = 20,
        height = 30,
        speed = 100,
        angle = 4.1,
        depth = 0,
    }

    -- fish image
    fish.image = love.graphics.newImage("assets/fish-game.png")
    fish.origin_x = fish.image:getWidth() / 2
    fish.origin_y = fish.image:getHeight() / 2

    -- add fish to world for collision
    game.world:add(fish, fish.x - fish.origin_x, fish.y - fish.origin_y, fish.width, fish.height)

    return fish
end

function moveFish(fish)
    -- turn right
    if love.keyboard.isDown("right") then
        fish.angle = fish.angle + 2.5 * delta
    end

    -- turn left
    if love.keyboard.isDown("left") then
        fish.angle = fish.angle - 2.5 * delta
    end

    -- calculate position
    cos = math.cos(fish.angle)
    sin = math.sin(fish.angle)

    local goalX = fish.x + fish.speed * cos * delta
    local goalY = fish.y + fish.speed * sin * delta

    -- move fish
    local actualX, actualY, cols, len = game.world:move(fish, goalX - fish.origin_x, goalY - fish.origin_y)
    fish.x = actualX + fish.origin_x
    fish.y = actualY + fish.origin_y

    -- check collision
    if len > 0 then
        game.play = false

        sfxWah:play()
        soundtrack:stop()
    end

    -- swim deeper
    fish.depth = fish.depth + 0.25 * delta

    -- check depth
    if fish.depth >= 15 then
        game.play = false
        game.win = true

        soundtrack:stop()
    end

    return fish
end

function drawFish(fish)
    love.graphics.draw(fish.image, fish.x, fish.y, fish.angle+1.5708, 2.5, 2.5, fish.origin_x, fish.origin_y)
end

function drawDepth(fish)
    fish.text = tastytext.new(string.format("<font>%d meters", fish.depth), 800, game.text_tags.regular, game.text_tags)
    fish.text.align = "center"

    fish.text:draw()
end