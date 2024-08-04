use_bpm 90

live_loop :woop do
  2.times do
    sample :glitch_bass_g
    sleep 4
  end
  2.times do
    sample :glitch_bass_g, rpitch: 1
    sleep 1.05
    sample :glitch_bass_g, rpitch: 1
    sleep 2.95
  end
end

live_loop :clap do
  sleep 0.75
  sample :sn_generic, rpitch: 5
  sleep 2.75
  sample :sn_generic, rpitch: 5
  sleep 0.5
end



live_loop :kick_pattern do
  4.times do
    kick_duration = (ring 1.75,0.75,1.5)
    sample :bd_haus,amp: 1, rpitch: 1
    sleep kick_duration.tick
  end
end


live_loop :hihat_pattern do
  sleep 0.5
  sample :drum_cymbal_closed
  sleep 1.5
  sample :drum_cymbal_closed
end

live_loop :hihat_pattern2 do
  
  sample :drum_cymbal_closed, rpitch: -2, amp: 0.5
  sleep 0.25
end

##| live_loop :subclap do
##|   sleep 2
##|   sample :sn_generic, rpitch: -5, amp: 0.5
##|   sleep 4
##|   sample :sn_generic, rpitch: -5, amp: 0.5
##|   sleep 2
##| end
