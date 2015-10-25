defmodule EchoJob do
  def perform(msg \\ "no args") do
    IO.puts(msg)
  end
end
