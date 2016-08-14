defmodule My do

  defmacro unless(condition, clauses) do
    do_clause = Keyword.get(clauses, :do, nil)
    else_clause = Keyword.get(clauses, :else, nil)


    quote do
      if not unquote(condition) do
        unquote(do_clause)
      else
        unquote(else_clause)
      end
    end
  end
end
