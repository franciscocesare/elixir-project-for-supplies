defmodule  Inmana.Supplies.Create do
  alias Inmana.{Repo, Supply}  #con el . agrego mas de uno

  def call(params)do
  params
  |> Supply.changeset()
  |> Repo.insert()
  |> handle_insert()
  end

  defp handle_insert({:ok, %Supply{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}

end

#en get.ex hicimos otro caso para manejarlo, en lugar de dos funciones, esta con un "case"