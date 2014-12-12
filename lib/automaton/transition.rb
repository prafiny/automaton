module Automaton

  class Transition
    attr_reader :new_state
    def initialize condition, new_state
      @condition = condition
      @new_state = new_state
    end

    def evaluate context
      return context.instance_eval(&@condition)
    end
  end

end
