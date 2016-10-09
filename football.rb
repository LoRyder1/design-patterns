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

