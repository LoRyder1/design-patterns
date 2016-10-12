#Invoker
class Switch
  attr_reader :history

  def execute cmd
    @history ||= []
    @history << cmd.execute
  end
end

#Command Interface
class Command
  attr_reader :obj

  def initialize obj
    @obj = obj
  end

  def execute
    raise "NotImplementedError"
  end
end

#Command for turning on
class TurnOnCommand < Command
  def execute
    obj.turn_on
  end
end

#Command for turning off
class TurnOffCommand < Command
  def execute
    obj.turn_off
  end
end

# Receiver
class Light
  def turn_on
    'the light is on'
  end

  def turn_off
    'the light is off'
  end
end

# Client
class LightSwitchClient
  attr_reader :switch

  def initialize
    @lamp = Light.new
    @switch = Switch.new
  end

  def switch_for cmd
    case cmd
    when 'on' then
      @switch.execute(TurnOnCommand.new(@lamp))
    when 'off' then
      @switch.execute(TurnOffCommand.new(@lamp))
    else puts 'Sorry, I so sorry'
    end
  end
end

client = LightSwitchClient.new
client.switch_for('on')
client.switch_for('off')
p client.switch.history #=> [ 'the light is on', 'the light is off']

<<-CommandPattern
  The command pattern is a behavioral design pattern in which an object is used to encapsulate all information needed to perform an aciton or trigger an event at a later time. This information includes the method name, the object that owns the method and values for the method parameters
  Four terms always associated with the command pattern are command, receiver, invoker and client. A command object knows about receiver adn invokes a method of the receiver. Values for parameters of the receiver method are stored in the command. The receiver then does the work. An invoker object knows how to execute a command, and optionally does bookkeeping about the command execution. The invoker does not know anything about a concrete command, it knows only about command interface. Both an invoker object and several command objects are held by a client object. The client decides which commands to execute at which points. To execute a command, it passes the command object to the invoker object. 
  Using the command objects makes it easier to construct general components that need to delegate, sequence or execute method calls at a time of their choosing without the need to know the class of the method or the method parameters. Using an invoker object allows bookkeeping about command executions to be conveniently performed, as well as implementing different modes for commands, which are managed by the invoker object, without the need for the client to be aware of the existence of bookkeeping or modes.
CommandPattern
