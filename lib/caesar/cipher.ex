defmodule Caesar.Cipher do
  require Logger
  
  @alphabet_size Application.get_env(:caesar, :alphabet_size)

  @moduledoc """
  Caesar Cipher module, which maps characters to new characters.
  """

  @doc """
  Encrypt the message by applying a mapping that shifts the alphabet by the `shift` value.

  ## Examples

      iex> Caesar.Cipher.encrypt("hello world!", 10)
      "rovvy gybvn!"
  """
  def encrypt(msg, shift) do
    Logger.debug("encrypting \"#{msg}\" with a shift number: #{shift}")
    # convert msg to char_list
    # iterate over list apply shift mapping
    # return list as binary string
    msg |> to_charlist |> Enum.map(&shift_char(&1, shift)) |> List.to_string
  end

  @doc """
  Decrypt the message by applying a mapping that shifts the alphabet by the `shift` value.
  """
  def decrypt(msg, shift) do
    new_shift = @alphabet_size - shift
    msg |> to_charlist |> Enum.map(&shift_char(&1, new_shift)) |> List.to_string
  end
  
  defp shift_char(char, shift) do
    case char do
      chr when chr in (?a..?z) -> calculate_mapping(?a, chr, shift)
      chr when chr in (?A..?Z) -> calculate_mapping(?A, chr, shift)
      chr -> chr
    end
  end

defp calculate_mapping(base_letter, char, shift) do
    # ensure shift number is within the alphabet size
    shift = rem(shift, @alphabet_size)
    # calculate the shifted value
    rem((char + shift - base_letter),@alphabet_size) + base_letter
  end
end