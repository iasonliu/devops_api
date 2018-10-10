defmodule DevopsApiWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias DevopsApiWeb.Schema.Types

  import_types(Types.UserType)
  import_types(Types.SessionType)
  import_types(Types.PostType)
  import_types(Types.CommentType)
end
