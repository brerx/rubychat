#! /usr/bin ruby

require_relative 'modules/posts'
require_relative 'modules/menu'

class RubyChat
  class << self
    def start
      clear_screen
      puts 'hello'
    end

    def clear_screen
      50.times { puts '' }
    end
  end
end

RubyChat.start
