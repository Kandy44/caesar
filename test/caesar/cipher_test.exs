defmodule Caesar.CipherTest do
  use ExUnit.Case
  doctest Caesar.Cipher
  
  import Caesar.Cipher
  
  test "encrypt shift cipher mapping" do
    assert encrypt("abcd",1) == "bcde"
  end
  test "encrypt handles capital letters" do
    assert encrypt("BcdE",1) == "CdeF"
  end
  test "encrypt handles spaces" do
    assert encrypt("Bc dE",1) == "Cd eF"
  end
  test "encrypt handles a large shift number" do
    assert encrypt("abcd", 27) == "bcde"
  end

  test "decrypt shift cipher mapping" do
    assert decrypt("bcde",1) == "abcd"
  end
  test "decrypt handles a large shift number" do
    assert decrypt("bcde",27) == "abcd"
  end
end
