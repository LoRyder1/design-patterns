class BostonNarwin
  attr_reader :action
  def initialize action
    @action = action
  end

  def name
    self.class
  end
end
