use_sample_bpm :loop_compus, num_beats: 6

live_loop :chop do
  2.times do
    sample :loop_compus, amp: 1, num_slices: 64, slice: (ring 0, pick, pick, 5).tick
    sleep 0.125
  end
end

live_loop :kick do
  kick_durations = (ring 1.25, 0.75, 0.75,0.5, 0.75)
  2.times do
    sample :bd_haus, amp: 1.3
    sleep kick_durations.tick
  end
end

live_loop :hats do
  velocities = (ring 0.1, 0.14, 0.14, 0.14, 0.14, 0.14, 0.15, 0.14)
  
  8.times do |i|
    with_fx :echo, phase: 0.6, decay: 0.28, mix: 0.09 do
      sample :drum_cymbal_closed, amp: velocities[i] unless i == 7
      sleep 0.125
    end
  end
end

live_loop :snap do
  4.times do |i|
    with_fx :reverb, mix: 0.42, room: 0.6 do
      sleep 0.75
      sample :perc_snap, amp: 0.3 unless i == 2
      sleep 0.25
    end
  end
end

##| live_loop :bass do
##|   use_synth :fm
##|   use_synth_defaults divisor: 2, depth: 1, release: 0.3, cutoff: 60, amp: 0.76

##|   bass_notes = (ring :e2, :e2, :g3, :e2, :b2, :fs2, :b3, :e3)
##|   bass_durations = (ring 0.5, 0.25, 1, 0.5, 0.5,0.25, 0.5, 0.5)

##|   8.times do

##|     play bass_notes.tick, release: 0.3, cutoff: rrand(50, 70)

##|     sleep bass_durations.look

##|   end
##| end

live_loop :chords do
  use_synth :blade
  use_synth_defaults release: 1.76, cutoff: 80, amp: 1.44, attack: 0.18, reverse: 1
  
  chords = [
    chord(:e2, :m7),
    chord(:g2, :major7),
    chord(:a2, :madd9),
    chord(:b2, :add9, num_octaves: 2).map { |note| note +1 }
  ]
  with_fx :eq, low: -0.52, mid: -0.1, high: 0.45 do
    
    play chords.tick
  end
  sleep 2
end
