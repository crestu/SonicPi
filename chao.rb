use_bpm 75

live_loop :hihat_pattern do
  sample :drum_cymbal_closed, amp: 0.14
  sleep 0.166
end

live_loop :clap do
  sleep 0.5
  sample :sn_generic, rpitch: 5, amp: 0.5
  sleep 3
  sample :sn_generic, rpitch: 5, amp: 0.5
  sleep 0.5
end

live_loop :kick_pattern do
  4.times do
    kick_duration = (ring 1.25, 0.5,0.25, 0.5, 1.25, 0.25)
    sample :bd_haus,amp: 2, rpitch: 11
    sleep kick_duration.tick
  end
end

live_loop :synth do
  use_synth :prophet
  with_synth_defaults cutoff: 60, amp: 0.6, release: 0.8 do
    with_fx :distortion, distort: 0.5 do
      synth_notes = (ring :e5, :ds5, :e5, :ds5, :g5, :fs5)
      synth_durations = (ring 0.75, 0.75, 0.75, 0.75, 0.5, 0.5)
      
      note = synth_notes.tick
      duration = synth_durations.look
      
      play note
      sleep duration
    end
  end
end

live_loop :ateohate do
  kick_durations = (ring 0.75, 1.25, 1.25, 0.75)
  2.times do
    with_fx :distortion, distort: 0.5 do
      sample :bd_boom, amp: 2, release: 0.5, rpitch: -3.85
      sleep kick_durations.tick
    end
  end
end
