defmodule Times do

  defmacro times_n(number) do
    quote bind_quoted: [number: number] do
      def unquote(:"times_#{number}")(n) do
        n * unquote(number)
      end
    end
  end

end

