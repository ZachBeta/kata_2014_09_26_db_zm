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
		expect(bowling_game.score).to eq(16)
	end
end
