defmodule Inmana.Supplies.ExpirationEmail do
  import Bamboo.Email

  alias Inmana.Supply

  def create(to_email, supplies) do
    new_email(
      to: to_email,
      from: "app@inmana.com.br",
      subject: "Supplies that are about to expire",
      html_body: "<p>Test de HTML<p>",
      text_body: email_text(supplies)
    )
  end

  def email_text(supplies) do
    initial_text = "----- Supplies that are about to expire: -----\n"

    Enum.reduce(supplies, initial_text, fn supply, text -> text <> supply_string(supply) end)
  end

  def supply_string(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsable: responsable
       }) do
    "Description: #{description}, Expiration Date: #{expiration_date}, Responsable: #{responsable}\n"
  end
end

#Enum.reduce(supplies, initial_text, fn supply, text -> text <> supply_string(supply) end)
#para mi coleccion "supplies", y para mi "initial text", con fn anon. para c/ sup y mi ttxt actual, agarro el texto y concateno
#con un string del supri que saque de la otra fn "supply_string", con descr, exp.date, y resp