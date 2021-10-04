defmodule Inmana.Supplies.Get do
  # con el . agrego mas de uno
  alias Inmana.{Repo, Supply}

  def call(uuid) do
    case Repo.get(Supply, uuid) do
      nil -> {:error, %{result: "Supply not found", status: :not_found}}
      supply -> {:ok, supply}
    end
  end
end
#en create.ex esta hecho con 2 funciones handle, aqui esta con CASES
#llamada, y los casos. para en casi de error, y recibir nil manejarlo.
#otro ejemplo distinto a create, haciendo CASE
