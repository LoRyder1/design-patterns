require 'pry'

class CoffeeRoutine
  attr_reader :task

  def initialize task
    @task = task
  end

  def time
    0.0
  end
end

# leaf classes

class GrindCoffee < CoffeeRoutine
  def initialize
    super 'Grinding some coffee!'
  end

  def time
    0.5
  end
end

class BoilWater < CoffeeRoutine
  def initialize
    super 'Boiling some water!'
  end

  def time
    4.0
  end
end

class AddCoffee < CoffeeRoutine
  def initialize
    super 'Adding in the coffee!'
  end

  def time
    1.0
  end
end

class PressPlunger < CoffeeRoutine
  def initialize
    super 'Pressing the plunger down!'
  end

  def time
    2.0
  end
end

class PressStartButton < CoffeeRoutine
  def initialize
    super 'Pushing the start button!'
  end

  def time
    3.0
  end
end

class CompositeTasks < CoffeeRoutine
  attr_reader :task, :steps

  def initialize task
    @steps = []  
  end

  def add_step step
    steps << step  
  end

  def remove_step step
    steps.delete step  
  end

  def time_required
    total_time = 0.0
    steps.each { |step| total_time += step.time }
    total_time
  end
end

class FrenchPress < CompositeTasks

  def initialize
    super 'Using the French press to make coffee'
    @steps = []
    add_step BoilWater.new
    add_step GrindCoffee.new
    add_step AddCoffee.new

    add_step PressPlunger.new
  end
end

class DripMaker < CompositeTasks
  def initialize
    super 'Using the DripMaker to make coffee!!!'
    add_step GrindCoffee.new
    add_step BoilWater.new
    add_step AddCoffee.new

    # add_step PressStartButton.new
  end
end

frenchpress = FrenchPress.new
dripmaker = DripMaker.new

p frenchpress.time_required 
p dripmaker.time_required


