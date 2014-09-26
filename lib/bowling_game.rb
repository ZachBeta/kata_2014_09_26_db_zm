class BowlingGame
  def initialize
    @score = 0
    @rolls = []
    @current_frame = Frame.new
  end

  def roll(pins)
    @current_frame = @current_frame.handle_roll(pins)
  end

  def score
    @current_frame.score
  end
end

class Frame
  def initialize(prior_frame = nil)
    @prior_frame = prior_frame
    @rolls = []
    @future_rolls = []
  end

  def handle_roll(pins)
    return self if !have_room? && number == 10

    @prior_frame && @prior_frame.handle_future_roll(pins)

    if have_room?
      stash(pins)
    else
      make_new_frame(pins)
    end
  end

  def handle_future_roll(pins)
    if strike? && @future_rolls.size < 2
      @future_rolls << pins
    end
    if spare? && @future_rolls.size < 1
      @future_rolls << pins
    end

    @prior_frame && @prior_frame.handle_future_roll(pins)
  end

  def score
    # puts self.inspect
    prior_scores = @prior_frame && @prior_frame.score || 0
    self_score = @rolls.inject(0, &:+)
    bonus_score = @future_rolls.inject(0, &:+)

    prior_scores + self_score + bonus_score
  end

  def inspect
    [@rolls, @future_rolls].inspect
  end

  def number
    if @prior_frame.nil?
      1
    else
      @prior_frame.number + 1
    end
  end

  private

  def strike?
    @rolls.first == 10
  end

  def spare?
    @rolls.inject(&:+) == 10
  end

  def have_room?
    @rolls.size < 2 && @rolls.first.to_i < 10 ||
      last_frame_shenanigans?
  end

  def last_frame_shenanigans?
    (number == 10) && (strike? || spare?) && (@rolls.size < 3)
  end

  def stash(pins)
    @rolls << pins
    self
  end

  def make_new_frame(pins)
    Frame.
      new(self).
      handle_roll(pins)
  end
end
