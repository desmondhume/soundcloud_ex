defmodule SoundcloudEx.Client do
  defstruct client_id: nil,
            client_secret: nil,
            auth_token: nil,
            redirect_uri: nil,
            endpoint: "https://api.soundcloud.com"

  def new(%{client_id: client_id, client_secret: client_secret, redirect_uri: redirect_uri}) do
    %__MODULE__{client_id: client_id, client_secret: client_secret, redirect_uri: redirect_uri}
  end
  def new(%{client_id: client_id}), do: %__MODULE__{client_id: client_id}
end