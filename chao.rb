live_loop :ateohate do
  kick_durations = (ring 0.75, 0.75, 0.75, 0.25, 0.75,0.75)
  2.times do
    with_fx :distortion, distort: 0.18 do
      sample :bd_boom
      sleep kick_durations.tick
    end
  end
end

live_loop :hihat_pattern do
  sample :drum_cymbal_closed, amp: 0.4 if (spread 8, 8).tick
  sleep 0.25
end

live_loop :kick_pattern do
  sample :bd_haus
  sleep 0.5
end
