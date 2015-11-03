defmodule Mix.Tasks.Exqueue.Enqueue do
  use Mix.Task

  @shortdoc "Sends a some data to Redis"

  @moduledoc """
    Sends a some data to Redis for dequeue workers.
  """

  def run(args) do
    Application.put_env(:phoenix, :serve_endpoints, false, persistent: false)
    Mix.Task.run "app.start", args

    Exq.enqueue :exq, 
    "default", 
    "ActiveJob::QueueAdapters::SidekiqAdapter::JobWrapper", 
    [
      %{"arguments" => [%{"exqueue" => args}, %{"heha" => args}],
        "queue_name" => "default", 
        "job_class" => "EchoJob"}
    ]

    # Mix.shell.info args
  end

  # We can define other functions as needed here.
end
