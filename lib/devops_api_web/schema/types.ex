defmodule DevopsApiWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias DevopsApiWeb.Schema.Types

  import_types(Types.Usertype)
  import_types(Types.Sessiontype)
end
