defmodule DevopsApi.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias DevopsApi.Accounts.User

  schema "posts" do
    field(:content, :string)
    field(:published, :boolean, default: false)
    field(:title, :string)
    belongs_to(:user, User)

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content, :published, :user_id])
    |> validate_required([:title, :content, :published, :user_id])
  end
end
