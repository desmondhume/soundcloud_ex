defmodule SoundcloudEx.User do
  import SoundcloudEx
  alias SoundcloudEx.User.Me

  defstruct [
    :id,
    :permalink,
    :username,
    :uri,
    :permalink_url,
    :avatar_url,
    :country,
    :full_name,
    :city,
    :description,
    :discogs,
    :myspace,
    :website,
    :website,
    :online,
    :track_count,
    :playlist_count,
    :followers_count,
    :followings_count,
    :public_favorites_count,
    :avatar_data
  ]

  def me(client) do
    get("/me", client)
    |> Poison.decode!(as: Me)
  end

  def find(user_id, client) do
    get("/users/#{user_id}", client)
    |> Poison.decode!(as: %__MODULE__{})
  end

  def search(query \\ "", client) do
    get("/users", client, [q: query])
    |> Poison.decode!(as: [%__MODULE__{}])
  end

  def follow(user_id, client) do
    put("/me/followings/#{user_id}", client)
    :ok
  end

  def unfollow(user_id, client) do
    delete("/me/followings/#{user_id}", client)
    :ok
  end
end