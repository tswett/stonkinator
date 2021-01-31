defmodule StonkinatorWeb.OrderController do
    use StonkinatorWeb, :controller

    alias Stonkinator.Orders
    alias Stonkinator.Orders.Order

    def new(conn, _params) do
        changeset = Orders.change_order(%Order{})
        render(conn, "new.html", changeset: changeset)
    end

    def create(conn, %{"order" => %{"type" => "testpending"}}) do
        GenServer.call(Stonkinator.OrderProcessor, {:new_order, :testpending})

        conn
        |> put_flash(:info, "Order submitted.")
        |> redirect(to: Routes.order_path(conn, :new))
    end
end