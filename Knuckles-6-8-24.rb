use_sample_bpm :loop_compus, num_beats: 6

use_osc "local host", 10000
osc "/hello/world"

live_loop :chop do
  "/interactive/box1"
  2.times do
    sample :loop_compus, amp: 0.65, num_slices: 64, slice: (ring 0, pick, pick, 5).tick
    sleep 0.125
  end
end

live_loop :kick do
  kick_durations = (ring 1.25, 0.75, 0.75,0.5, 0.75)
  2.times do
    with_fx :eq, high: -0.5 do
      sample :bd_haus, amp: 0.8
      sleep kick_durations.tick
    end
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

live_loop :chords do
  use_synth :blade
  use_synth_defaults release: 1.76, cutoff: 80, amp: 1, attack: 0.18, reverse: 1
  
  chords = [
    chord(:a3, :madd9),
    chord(:b3, :add9, num_octaves: 2).map { |note| note +1 },
    chord(:e4, :m7),
    chord(:g4, :major7)
  ]
  with_fx :eq, low: -0.52, high: 0.45 do
    play chords.tick
  end
  sleep 2
end

live_loop :bass do
  use_synth :subpulse
  use_synth_defaults cutoff: 75, amp: 1
  
  bass_notes = (ring :b2, :b2, :e1, :b2, :b2, :e1, :g2)
  bass_durations = (ring 0.5, 0.25, 1.25, 0.5, 0.25, 0.75, 0.5)
  
  8.times do
    play bass_notes.tick, release: 0.25
    sleep bass_durations.look
  end
end

live_loop :fm_bass do
  use_synth :fm
  use_synth_defaults cutoff: 70, amp: 0.3  # Adjust amp as needed to balance the mix
  
  bass_notes = (ring :b2, :b2, :e1, :b2, :b2, :e1, :g2)
  bass_durations = (ring 0.5, 0.25, 1.25, 0.5, 0.25, 0.75, 0.5)
  
  8.times do
    play bass_notes.tick, release: 0.25
    sleep bass_durations.look
  end
end

live_loop :synth do
  use_synth :square
  use_synth_defaults amp: 0.08, attack: 0.1
  
  bass_notes = (ring :e3, :g3, :g3, :e3)
  bass_durations = (ring 0.25, 0.25, 0.25)
  
  sleep 1.5
  
  2.times do
    with_fx :reverb, mix: 0.8, room: 0.8 do
      note = bass_notes.tick
      pan_value = (note == :e3) ? -0.5 : 0.5
      play note, release: 0.25, pan: pan_value
      sleep bass_durations.look
    end
  end
  sleep 2
end

