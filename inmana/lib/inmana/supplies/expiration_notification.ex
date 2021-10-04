defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Mailer
  alias Inmana.Supplies.{ExpirationEmail, GetByExpiration}

  def send do
    data = GetByExpiration.call() #los datos que voy a precisar, vienen del otro mod

    data
    |> Task.async_stream(fn {to_email, supplies} -> send_email(to_email, supplies) end)
    |> Stream.run() #ejecutar
  end

  defp send_email(to_email, supplies) do
    to_email
    |> ExpirationEmail.create(supplies)
    |> Mailer.deliver_later!() #later porque es asincrono, o deliver_now. el ! retorna si hay una excepcion 
  end
end

#Task -> ejecutar de forma asincrona, tal funcion.
#async_stream puede recibir una lista y SPAWNA procesos para trabajar paralelamente
#sobre coleccion e datos
