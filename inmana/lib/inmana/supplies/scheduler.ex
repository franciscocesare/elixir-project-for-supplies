
#AGENDADOR de procesos
defmodule Inmana.Supplies.Scheduler do
  use GenServer

  alias Inmana.Supplies.ExpirationNotification
  # parte do Client. sTART PARA INCIAR EL PROCESO!
  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  # Lado Server
  @impl true
#init define el estado de comienzo
  def init(state \\ %{}) do
    schedule_notification()
    {:ok, state}
  end

  @impl true
  #render especial dew genserver, recibe cualquier tipo de msj! cualquier proceso puede enviar
  def handle_info(:generate, state) do
    ExpirationNotification.send()

    schedule_notification()

    {:noreply, state}
  end

  #crea un proc que envia un msj para el propio genserver, ,sj :generate, despues de 10 segundos
  defp schedule_notification do
    Process.send_after(self(), :generate, 1000 * 10)  #podria ir multiplicando, hasta llegar a una semana, un dia, etc
  end
end
