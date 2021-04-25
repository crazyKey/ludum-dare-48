function createMenu()
    menu = {}

    str = [[
        <font>
        I AM FAR FROM HOME IN A POLLUTED OCEAN.

        HELP ME SWIM <red>DEEPER AND DEEPER</red> IN THE OCEAN AVOIDING HUMANS TRASH.

        FUN FACT: CLOWN FISH LIVE AT 15 METERS DEPTH MAX!

        PRESS space TO START.
    ]]

    menu.text = tastytext.new(str, 500, game.text_tags.regular, game.text_tags)
    menu.text.align = "center"

    return menu
end

function closeMenu()
    if love.keyboard.isDown("space") then
        game.menu = false
        game.play = true
    end
end

function drawMenu(menu)
    menu.text:draw()
end