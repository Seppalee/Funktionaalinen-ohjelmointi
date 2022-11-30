defmodule Blackjack do

  def draw do
    # Not sure how to implement aces correctly, so just draw between 1 and 11
    Enum.random(1..11)
  end

  def dealer_ai(dealer) do
    current_score = Agent.get(dealer, fn state -> state end)
    if current_score <= 16 do
      Agent.update(dealer, fn state -> state + draw() end)
      after_draw = Agent.get(dealer, fn state -> state end)
      IO.puts("Dealer drew, current score of dealer is #{after_draw}")
      if after_draw <= 16 do
        dealer_ai(dealer)
      end
    end
  end

  def start_game do
    {:ok, dealer} = Agent.start_link(fn -> 0 end)
    {:ok, player} = Agent.start_link(fn -> 0 end)

    # Drawing two starting cards for each
    Agent.update(dealer, fn state -> state + draw() end)
    Agent.update(dealer, fn state -> state + draw() end)
    Agent.update(player, fn state -> state + draw() end)
    Agent.update(player, fn state -> state + draw() end)

    game(dealer, player)
  end

  def game(dealer, player) do
    player_score = Agent.get(player, fn state -> state end)
    dealer_score = Agent.get(dealer, fn state -> state end)
    IO.puts("Player: #{player_score} Dealer #{dealer_score}")
    user_input = IO.gets("Draw? (y/n): ") |> String.trim()

    cond do
      user_input == "n" ->
        dealer_ai(dealer)
        check_winner(player, dealer)

      user_input == "y" ->
        Agent.update(player, fn state -> state + draw() end)

        if Agent.get(player, fn state -> state end) < 21 and Agent.get(dealer, fn state -> state end) < 21 do
          game(dealer, player)
        else
          check_winner(player, dealer)
        end
    end
  end
  def check_winner(player, dealer) do
    player_score = Agent.get(player, fn state -> state end)
    dealer_score = Agent.get(dealer, fn state -> state end)

    if player_score == 21 or dealer_score > 21 do
      IO.puts("Player won with score of #{player_score} (Dealer score #{dealer_score})")
    end
    if dealer_score == 21 or player_score > 21 do
      IO.puts("Dealer won with score of #{dealer_score} (Player score #{player_score})")
    end
    if player_score > dealer_score and player_score < 21 do
      IO.puts("Player won with score of #{player_score} (Dealer score #{dealer_score})")
    end
    if dealer_score > player_score and dealer_score < 21 do
      IO.puts("Dealer won with score of #{dealer_score} (Player score #{player_score})")
    end
    if dealer_score == player_score do
      IO.puts("It's a draw")
    end
    new_game = IO.gets("Want to play again? (y/n): ") |> String.trim()
    cond do
      new_game == "y" ->
        start_game()
      new_game == "n" ->
        IO.puts("Quitting the application")
    end
  end
end

Blackjack.start_game()
