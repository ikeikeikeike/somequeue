defmodule ActiveJob.QueueAdapters.SidekiqAdapter.JobWrapper do
  use Exqueue.Web, :worker

  def perform(%{"job_class"=>"EchoJob", "queue_name"=>"default", "arguments"=>args}), do: args |> IO.inspect
  def perform(args) when is_map(args), do: args |> IO.inspect
end
