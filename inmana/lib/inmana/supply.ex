defmodule Inmana.Supply do
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.Restaurant

  # para definir el tipo, el @variable de modulo, una constante
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  # meter la lista de params que teniamos en cada validate
  @required_params [:description, :expiration_date, :responsable, :restaurant_id]
  # derive que campos quiero que sean renderizados
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "supplies" do
    field(:description, :string)
    field(:expiration_date, :date)
    field(:responsable, :string)

    # para referenciar con el restaurtant
    belongs_to(:restaurant, Restaurant)

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 3)
    |> validate_length(:responsable, min: 3)
  end
end
