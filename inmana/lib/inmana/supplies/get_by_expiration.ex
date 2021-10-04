#modulo que retorno todos los suprimentos por fecha de
defmodule Inmana.Supplies.GetByExpiration do
  import Ecto.Query

  alias Inmana.{Repo, Restaurant, Supply}

  def call do
    today = Date.utc_today()   #que dia es hoy, para luego saber comienzo y final de la semana que es
    beginning_of_week = Date.beginning_of_week(today) 
    end_of_week = Date.end_of_week(today)

    query =
      from(supply in Supply,  #un suministro en modulo Supply
        where:
          supply.expiration_date >= ^beginning_of_week and supply.expiration_date <= ^end_of_week,
        preload: [:restaurant]  #pasar la lista de lo que quiero precargar, aqui solo restau  para tener el relacionamiento!
      )

    query
    |> Repo.all()
    |> Enum.group_by(fn %Supply{restaurant: %Restaurant{email: email}} -> email end) #para c/supr, cada uno tiene un restau, que dentro tiene un email
                                                                                      #agruparlos por email!
  end
end

 #preload para cargar tb los datos del restaurant

      #para enviar os email a cada restaurant el group_by
