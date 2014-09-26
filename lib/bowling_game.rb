class BowlingGame
  def initialize
    @score = 0
    @rolls = []
  end

  def roll(pins)
    if prior_strike?
      @score += pins
    end

    @rolls << pins
    @score += pins
  end

  def score
    @score
  end

  private

  def prior_strike?
    @rolls[-1] == 10 ||
      @rolls[-2] == 10
  end
end
