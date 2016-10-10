require 'pry'

class BostonNarwin
  attr_reader :action
  def initialize action
    @action = action
  end

  def name
    self.class
  end
end

class Quarterback < BostonNarwin
  attr_reader :path, :play

  def initialize path, play
    super 'Hut! Hut! Red 19! Hike!'
    @path = path
    @play = play
  end

  def execute
    file = File.open path, 'w'
    file.write "#{name}: #{play}\n"
    file.close 
  end
end

class Receiver < BostonNarwin
  attr_reader :path, :play

  def initialize path, play
    super 'Run, run, run!!!'
    @path = path
    @play = play
  end

  def execute
    file = File.open path, 'a'
    file.write "#{name}: #{play}\n"
    file.close
  end
end

class TeamOwner < BostonNarwin
  attr_reader :path, :target

  def initialize path, target
    super "We are moving the team from #{prettify path} to #{prettify target}!"
    @path = path
    @target = target
  end

  def execute
    FileUtils.mv path, target
    file = File.open target, 'a'
    file.write "#{name}: We moved from #{prettify path} to #{prettify target}!"
    file.close
  end

  def prettify pathname
    (pathname.chomp File.extname(pathname)).capitalize
  end
end

class CompositeCommand < BostonNarwin
  attr_accessor :commands

  def initialize
    @commands = []
  end

  def add_command(*args)
    args.each { |arg| commands << arg }
  end

  def execute
    commands.each { |command| command.execute }
  end
end

quarterback = Quarterback.new('boston.txt', "I'm going to throw a perfect pass!")
receiver = Receiver.new('boston.txt', "I'm going to catch the ball!")
team_owner = TeamOwner.new('boston.txt', 'somerville.txt')

command = CompositeCommand.new

command.add_command quarterback, receiver, team_owner

command.execute












