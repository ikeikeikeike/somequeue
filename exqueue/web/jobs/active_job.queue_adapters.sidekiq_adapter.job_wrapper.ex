defmodule ActiveJob.QueueAdapters.SidekiqAdapter.JobWrapper do
  use Exqueue.Web, :worker

  def perform(%{"job_class"=>"EchoJob", "queue_name"=>"default", "arguments"=>arguments}) do
    IO.inspect(arguments)
  end

  def perform(msg) when is_map(msg) do
    IO.inspect(msg)
  end
end
