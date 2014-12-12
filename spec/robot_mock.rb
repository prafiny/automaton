require_relative '../lib/automaton'

class Robot
  include Automaton
  attr_reader :n

  def initialize n
    @n = n

    def_automaton do
      state :increase do
        transition_to(:decrease) { @n > 100 } 

        behaviour do
          @n += 1
        end
      end

      state :decrease do
        transition_to(:increase) { @n < -100 }

        behaviour do
          @n -= 1
        end
      end
    end

  end

  def move
    act
    evaluate_state
  end
end
