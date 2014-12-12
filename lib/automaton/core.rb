module Automaton

  class AutomatonCore < Hash

    def initialize context
      super
      @context = context
      @current_state = nil
    end
 
    def act
      self[@current_state].act
    end

    def current_state *arg
      if arg.include? :obj
        return self[@current_state]
      else
        return @current_state
      end
    end

    def evaluate_state 
      transition = self[@current_state].evaluate_transitions(:first)
      unless transition.nil?
        @current_state = transition.new_state
        s = self[@current_state]
        s.activate!
      end
    end

  private
    def state name, &block
      s = State.new(@context)
      s.instance_eval(&block)
      @current_state = name if self.empty?
      self[name] = s
    end

  end

end
