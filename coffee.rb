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

# g = GrindCoffee.new
# p g.task
# p g.time

class FrenchPress < CoffeeRoutine
  attr_reader :task, :steps

  def intialize task
    super 'Using the French press to make coffee'
    @steps = []
    add_step BoilingWater.new
    add_step GrindCoffee.new
    add_step AddCoffee.new
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