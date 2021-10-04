defmodule Inmana.RestaurantTest do
  use Inmana.DataCase

  alias Inmana.Restaurant
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Siri Cascudo", email: "siri@cascudo.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{changes: %{name: "Siri Cascudo", email: "siri@cascudo.com"}, valid?: true}  = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{name: "S", email: ""}
      expected_response = %{email: ["can't be blank"], name: ["should be at least 2 character(s)"]}

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: false}  = response

      assert errors_on(response) == expected_response
    end
  end
end

#DataCase, archivo que trae funcionalidades para testar base de datos o changeset por ej
#msj de error con el errors_on. Traduce el msj de error
