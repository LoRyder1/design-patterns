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

