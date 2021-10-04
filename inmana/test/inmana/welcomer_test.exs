defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, return a special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You are very special banana"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is not special, return a message" do
      params = %{"name" => "rafael", "age" => "25"}
      expected_result = {:ok, "Welcome rafael, you are 25 years old"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is under age, return an error" do
      params = %{"name" => "rafael", "age" => "17"}
      expected_result = {:error, "You nao pode passar rafael, 17 nao alcanza"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end

# describe => es el bloque de la fn a testear
# test => nombre de test
# result => llamar al modulo, la fun y pasar los parametros
# assert => el resultado que espero
