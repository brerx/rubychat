require 'highline'

module Menu
  CLI = HighLine.new

  def self.ask(string)
    CLI.ask string
  end

  def self.list(array)
    list = "Choose:\n\n"
    array.each_with_index do |elem, i|
      list << "[#{i + 1}] #{elem}\n\n"
    end
    CLI.ask list
  end
end
