##| live_loop :ateohate do
##|   kick_durations = (ring 0.75, 0.75, 0.75, 0.25, 0.75,0.75)
##|   2.times do
##|     with_fx :distortion, distort: 0.5 do
##|       sample :bd_boom, amp: 1.5, release: 0.5
##|       sleep kick_durations.tick
##|     end
##|   end
##| end

live_loop :hihat_pattern do
  sample :drum_cymbal_closed, amp: 0.4 if (spread 8, 8).tick
  sleep 0.25
end

live_loop :kick_pattern do
  2.times do
    kick_duration = (ring 0.5, 1.25, 0.25)
    sample :bd_haus
    sleep kick_duration.tick
  end
end

live_loop :synth do
  use_synth :prophet
  with_synth_defaults cutoff: 60, amp: 0.1, release: 0.8 do
    with_fx :distortion, distort: 0.5 do
      synth_notes = (ring :e4, :ds4, :d4, :cs4, :c4, :b3, :as3, :a3, :gs3, :g3, :fs3, :f3)
      synth_durations = (ring 0.33, 0.335, 0.335, 0.33, 0.335, 0.335, 0.33, 0.335, 0.335, 0.33, 0.335, 0.335)
      
      note = synth_notes.tick
      duration = synth_durations.look
      
      play note
      sleep duration
    end
  end
end
