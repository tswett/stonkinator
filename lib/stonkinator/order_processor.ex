defmodule Stonkinator.OrderProcessor do
    use GenServer

    def start_link(opts) do
        GenServer.start_link(__MODULE__, :ok, opts)
    end

    @impl true
    def init(:ok) do
        {:ok, nil}
    end
    
    @impl true
    def handle_call({:new_order, :testpending}, _from, _state) do
        Stonkinator.Orders.create_order(%{type: "testpending", status: "pending"})
        {:reply, nil, nil}
    end
end