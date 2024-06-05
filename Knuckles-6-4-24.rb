use_sample_bpm :loop_compus, num_beats: 6

live_loop :chop do
  16.times do
    sample :loop_compus, num_slices: 64, slice: (ring 0, pick, pick, 5).tick
    sleep 0.25
  end
end

live_loop :lead do
  use_synth :blade
  use_synth_defaults release: 0.5, cutoff: 80, amp: 1.5
  
  notes = (ring :e2, :g2, :b2, :d3, :e3, :g3, :b3, :d4)
  durations = (ring 0.5, 0.25, 0.75, 1, 0.25, 0.75, 0.25, 0.25)
  
  8.times do
    play notes.tick, release: 0.5, cutoff: rrand(70, 100)
    sleep durations.look
  end
end

live_loop :bass do
  use_synth :fm
  use_synth_defaults divisor: 2, depth: 1, release: 0.3, cutoff: 60
  
  bass_notes = (ring :e2, :e2, :e3, :e2, :e2, :e2, :e3, :e3)
  bass_durations = (ring 0.5, 0.25, 1, 0.5, 0.5,0.25, 0.5, 0.5)
  
  8.times do
    play bass_notes.tick, release: 0.3, cutoff: rrand(50, 70)
    sleep bass_durations.look
  end
end

live_loop :chords do
  use_synth :prophet
  use_synth_defaults release: 1.5, cutoff: 80, amp: 1.2
  
  chords = [
    chord(:e3, :m7),
    chord(:g3, :major7),
    chord(:a3, :madd9),
    chord(:b3, :add9, num_octaves: 2).map { |note| note + 1 }
  ]
  
  play chords.tick
  sleep 2
end
