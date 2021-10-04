defmodule Inmana.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.Supply

  # para definir el tipo, el @variable de modulo, una constante
  @primary_key {:id, :binary_id, autogenerate: true}
  # meter la lista de params que teniamos en cada validate
  @required_params [:email, :name]
  # derive que campos quiero que sean renderizados
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "restaurants" do
    field(:email, :string)
    field(:name, :string)

    # para referenciar con los supplies
    has_many(:supplies, Supply)

    timestamps()
  end

  def changeset(params) do
    # es lo mismo que Inmana.Restaurant el __MODULE__
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
