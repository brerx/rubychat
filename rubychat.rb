#! /usr/bin ruby

require_relative 'modules/posts'
require_relative 'modules/menu'

class RubyChat
  class << self
    def start
      clear_screen
      puts 'rubychat!'
      menu
      new_post
    end

    def new_post
      filter
      puts 'cant accept new posts right now'
    end

    def menu
      puts 'menu under construction'
    end

    def filter
      puts 'everything`s fine'
    end

    def clear_screen
      50.times { puts '' }
    end
  end
end

RubyChat.start
