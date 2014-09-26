require 'spec_helper'
require 'bowling_game'

describe BowlingGame do
  describe 'start-up specs' do
    it 'is super awesome' do
      BowlingGame.new
    end

    it 'can take a roll' do
      BowlingGame.new.roll(2039)
    end

    it 'has a score' do
      expect(BowlingGame.new.score).to eq(0)
    end
  end

  let(:bowling_game) { BowlingGame.new }

  it 'keeps track of rolls also roles also hoagies' do
    bowling_game.roll(1)
    bowling_game.roll(1)

    expect(bowling_game.score).to eq(2)
  end

  it 'can score a strike correctly' do
    bowling_game.roll(10)

    bowling_game.roll(1)
    bowling_game.roll(2)

    expect(bowling_game.score).to eq(10 + 1 + 2 + 1 + 2)
  end

  it 'can score a single spare correctly' do
    bowling_game.roll(6)
    bowling_game.roll(4) # Frame A: meh

    bowling_game.roll(3)
    bowling_game.roll(1)

    expect(bowling_game.score).to eq(10 + 3 + 3 + 1)
  end

  it 'can score an off-set spare correctly' do
    bowling_game.roll(4)
    bowling_game.roll(4)

    bowling_game.roll(6)   # this 'looks like' a spare
    bowling_game.roll(1)   # this should only count once

    expect(bowling_game.score).to eq(4 + 4 + 6 + 1)
  end

  it 'gutterballs then turkeys' do
    9.times do
      bowling_game.roll(0)
      bowling_game.roll(0)
    end

    bowling_game.roll(10)
    bowling_game.roll(10)
    bowling_game.roll(10)

    expect(bowling_game.score).to eq 30
  end

  it 'knows game over'

  it 'scores a perfect game' do
    9.times do
      bowling_game.roll(10)
    end

    bowling_game.roll(10)
    bowling_game.roll(10)
    bowling_game.roll(10)

    expect(bowling_game.score).to eq 300
  end

  it 'handles doule strikes' do
    bowling_game.roll(10)

    bowling_game.roll(10)

    bowling_game.roll(1)
    bowling_game.roll(2)

    expected_score = 10 + 10 + 1 +
      10 + 1 + 2 +
      1 + 2
    expect(bowling_game.score).to eq(expected_score)
  end
end
