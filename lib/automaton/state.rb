module Automaton

  class State
    def initialize context
      @context = context
      @transitions = []
      @behaviour = nil
      @activated = false
    end

    def act
      @context.instance_eval(&@behaviour)
      @activated = false
    end

    def evaluate_transitions rule
      case rule
      when :first
        t = @transitions.detect{ |t| t.evaluate(@context) }
      end
      t
    end
  
    def activate!
      @activated = true
    end

    def activated?
      @activated
    end
    
  private

    def transition_to state, &block
      @transitions << Transition.new(block, state)
    end

    def behaviour &block
      @behaviour = block
    end
  end

end
