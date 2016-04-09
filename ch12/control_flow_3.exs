defmodule CheckParameters do

  def ok!(param) do
    case param do
      {:ok, data} -> data
      {atom, data} -> raise RuntimeError, message: "Invalid parameter received. #{atom} -- #{data}"
    end
  end
end

IO.puts "Trying to open an existing file..."
existing_file = CheckParameters.ok! File.open("control_flow_3.exs")
IO.inspect "Existing file is a valid PID: #{is_pid existing_file}"
IO.puts "Now, something check for a non existing file..."
_file = CheckParameters.ok! File.open "something"
