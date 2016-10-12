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

<<-Command
The Command pattern suggests that we create objects that perform specific tasks and actions. For our example, the Quarterback object created a file, the Receiver appended to the file, and the TeamOwner object moved it. Each of the command objects completed their action through CompositeCommand#execute.

Having one object, an instance of CompositeCommand, that executes all stored commands presents us with solutions ranging from simple file manipulation to user triggered interaction. The Command pattern also allos us to "store" and "remember" commands prior to and after execution. 

Command










