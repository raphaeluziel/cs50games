--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    -- AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    -- Added different medals depending on how high the score is
  if self.score > 10 then
    scoreMessage = 'You earned a Gold medal!'
    medal = love.graphics.newImage('gold.png')
  elseif self.score > 4 then
    scoreMessage = 'You earned a Silver medal!'
    medal = love.graphics.newImage('silver.png')
  elseif self.score > 2 then
    scoreMessage = 'You earned a Bronze medal!'
    medal = love.graphics.newImage('bronze.png')
  else
    scoreMessage = "Sorry, you lost!"
    medal = love.graphics.newImage('loser.png')
  end

  love.graphics.setFont(flappyFont)
  love.graphics.printf(scoreMessage, 0, 64, VIRTUAL_WIDTH, 'center')
  love.graphics.draw(medal, VIRTUAL_WIDTH / 2 - 15, 120)


    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end
