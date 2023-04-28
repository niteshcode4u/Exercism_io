defmodule Secrets do
  @moduledoc """
    ## Instructions

    In this exercise, you've been tasked with writing the software for an encryption device that works by performing transformations on data. You need a way to flexibly create complicated functions by combining simpler functions together.

    For each task, return an anonymous function that can be invoked from the calling scope.

    All functions should expect integer arguments. Integers are also suitable for performing bitwise operations in Elixir.

    ## 1. Create an adder

    Implement `Secrets.secret_add/1`. It should return a function which takes one argument and adds to it the argument passed in to `secret_add`.

    ```elixir
    adder = Secrets.secret_add(2)
    adder.(2)
    # => 4
    ```

    ## 2. Create a subtractor

    Implement `Secrets.secret_subtract/1`. It should return a function which takes one argument and subtracts the secret passed in to `secret_subtract` from that argument.

    ```elixir
    subtractor = Secrets.secret_subtract(2)
    subtractor.(3)
    # => 1
    ```

    ## 3. Create a multiplier

    Implement `Secrets.secret_multiply/1`. It should return a function which takes one argument and multiplies it by the secret passed in to `secret_multiply`.

    ```elixir
    multiplier = Secrets.secret_multiply(7)
    multiplier.(3)
    # => 21
    ```

    ## 4. Create a divider

    Implement `Secrets.secret_divide/1`. It should return a function which takes one argument and divides it by the secret passed in to `secret_divide`.

    ```elixir
    divider = Secrets.secret_divide(3)
    divider.(32)
    # => 10
    ```

    Make use of integer division so the output is compatible with the other functions' expected input.

    ## 5. Create an "and"-er

    Implement `Secrets.secret_and/1`. It should return a function which takes one argument and performs a bitwise _and_ operation on it and the secret passed in to `secret_and`.

    ```elixir
    ander = Secrets.secret_and(1)
    ander.(2)
    # => 0
    ```

    ## 6. Create an "xor"-er

    Implement `Secrets.secret_xor/1`. It should return a function which takes one argument and performs a bitwise _xor_ operation on it and the secret passed in to `secret_xor`.

    ```elixir
    xorer = Secrets.secret_xor(1)
    xorer.(3)
    # => 2
    ```

    ## 7. Create a function combiner

    Implement `Secrets.secret_combine/2`. It should return a function which takes one argument and applies to it the two functions passed in to `secret_combine` in order.

    ```elixir
    multiply = Secrets.secret_multiply(7)
    divide = Secrets.secret_divide(3)
    combined = Secrets.secret_combine(multiply, divide)

    combined.(6)
    # => 14
    ```
  """

  @spec secret_add(any) :: (number -> number)
  def secret_add(secret), do: &(&1 + secret)

  @spec secret_subtract(any) :: (number -> number)
  def secret_subtract(secret), do: &(&1 - secret)

  @spec secret_multiply(any) :: (number -> number)
  def secret_multiply(secret), do: &(&1 * secret)

  @spec secret_divide(any) :: (integer -> integer)
  def secret_divide(secret), do: &div(&1, secret)

  @spec secret_and(any) :: (integer -> integer)
  def secret_and(secret), do: &Bitwise.band(&1, secret)

  @spec secret_xor(any) :: (integer -> integer)
  def secret_xor(secret), do: &Bitwise.bxor(&1, secret)

  @spec secret_combine(any, any) :: (any -> any)
  def secret_combine(secret_function1, secret_function2),
    do: &secret_function2.(secret_function1.(&1))
end
