defmodule  Inmana.Restaurants.Create do
  alias Inmana.{Repo, Restaurant}  #con el . agrego mas de uno
  
#aca viene la derivacion por delegate, del inmana.ex
  def call(params)do
  params
  |> Restaurant.changeset()
  |> Repo.insert()
  |> handle_insert()
  end

  defp handle_insert({:ok, %Restaurant{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}

end
