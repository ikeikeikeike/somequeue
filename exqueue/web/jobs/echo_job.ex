defmodule EchoJob do
  def perform(msg) when is_map(msg) do
    IO.inspect(msg)
  end
end
