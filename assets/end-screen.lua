function createEndScreen()
    end_screen = {}

    end_screen.won_text = [[
        <font>
        YOU WIN!

        THE HAPPY CLOWN FISH IS BACK TO ITS ANEMONE!

        SAD FACT: YOU AVOIDED 5.25 TRILLION PIECES OF PLASTIC HUMANS DUMPED IN THE OCEANS.

        KEEP HELPING FISH BY RECYCLING.
    ]]

    end_screen.lost_text = [[
        <font>
        OUCH!

        YOU LOST.

        SAD FACT: YOU HAVE BEEN HIT BY ONE OF THE 5.25 TRILLION PIECES OF PLASTIC HUMANS DUMPED IN THE OCEANS.

        HELP REAL FISH BY RECYCLING.

        PRESS space TO TRY AGAIN.
    ]]

    return end_screen
end

function drawEndScreen(end_screen)
    local str = end_screen.lost_text
    local img = "assets/fish-lost.png"

    if game.win then
        str = end_screen.won_text
        img = "assets/fish-won.png"
    end

    end_screen.text = tastytext.new(str, 500, game.text_tags.regular, game.text_tags)
    end_screen.text.align = "center"

    end_screen.text:draw()

    love.graphics.draw(love.graphics.newImage(img), 275, 550, 0.75, 7, 7, 0, 0)
end