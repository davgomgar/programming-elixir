defmodule LinkedProcess do
  def notify(parent) do
    send(parent, "Hi Dad!")
    raise "Exception"
  end

  def parent do
    :timer.sleep 500
    receive_all_messages
  end

  def receive_all_messages do
    receive do
      message -> IO.inspect message
      receive_all_messages
    after
       0 -> IO.puts "No more pending messages"
    end
  end
end

parent = self
#Process.flag :trap_exit, true
child =  spawn_link(LinkedProcess, :notify, [parent])
LinkedProcess.parent
