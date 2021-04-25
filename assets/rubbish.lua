function createRubbish()
    rubbish = {
        {
            image = love.graphics.newImage("assets/straw.png"),
            width = 30, height = 80,
        },
        {
            image = love.graphics.newImage("assets/bag.png"),
            width = 60, height = 80,
        },
        {
            image = love.graphics.newImage("assets/bottle.png"),
            width = 70, height = 30,
        },
        {
            image = love.graphics.newImage("assets/cup.png"),
            width = 40, height = 60,
        },
        {
            image = love.graphics.newImage("assets/net.png"),
            width = 120, height = 120,
        },
    }

    for k,r in ipairs(rubbish) do
        -- init rubbish positions
        resetRubbish(r)

        -- add rubbish to world for collision
        game.world:add(r, r.x, r.y, r.width, r.height)
    end

    return rubbish
end

local rubbishCollisionFilter = function(item, other)
    return "cross"
end

function moveRubbish(rubbish, fish)
    for k,r in ipairs(rubbish) do
        -- move rubbish
        r.y = r.y - r.speed * delta - (r.speed * delta * (fish.depth / 10))
        local actualX, actualY, cols, len = game.world:move(r, r.x, r.y, rubbishCollisionFilter)

        if len > 0 then
            print(("Attempted to move to 0,64, but ended up in %d,%d due to %d collisions"):format(actualX, actualY, len))
        else
            print("Moved B to 100,100 without collisions")
        end

        --check collision with fish
        for i=1,len do
            local col = cols[i]

            if col.other.name == "fish" then
                game.play = false

                sfxWah:play()
                soundtrack:stop()
            end
        end

        -- reset positions
        if r.y < 0 then
            resetRubbish(r)
        end
    end

    return rubbish
end

function drawRubbish(rubbish)
    for k,r in ipairs(rubbish) do
        love.graphics.draw(r.image, r.x, r.y, 0, 1, 1, 0, 0)
    end
end

function resetRubbish(r)
    r.x = love.math.random(0, 500)
    r.y = 800
    r.speed = love.math.random(50, 200)
end