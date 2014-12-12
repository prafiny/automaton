require_relative 'automaton/core'
require_relative 'automaton/state'
require_relative 'automaton/transition'

module Automaton

module_function

  def def_automaton &block
    @automaton = AutomatonCore.new self
    @automaton.instance_eval &block
  end

  def method_missing(sym, *args, &block)
    if @automaton.respond_to? sym
      return @automaton.send(sym, *args, &block)
    else
      super
    end
  end
end
