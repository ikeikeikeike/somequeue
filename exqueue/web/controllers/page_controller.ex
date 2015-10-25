defmodule Exqueue.PageController do
  use Exqueue.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
