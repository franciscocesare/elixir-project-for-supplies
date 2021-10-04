defmodule Inmana.Welcomer do
  # recibir un nombre, una edad de ususario
  # si usuario se llama pepe y tiene 35 el recibe un ms especial
  # si fuera mayor de edad, recibe un msj normal
  # si fuera menor de edad retornamos un error
  # tratart nome de usuario para entradas erradas, "PePe" por ej

  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "You are very special banana"}
  end

  defp evaluate(name, idade) when idade >= 18 do
    {:ok, "Welcome #{name}, you are #{idade} years old"}
  end

  defp evaluate(name, idade) do
    {:error, "You nao pode passar #{name}, #{idade} nao alcanza"}
  end
end
