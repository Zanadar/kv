defmodule KV do
  use Application

  def start(type, _args) do
    IO.puts type
    IO.puts System.argv
    KV.Supervisor.start_link
  end

end
