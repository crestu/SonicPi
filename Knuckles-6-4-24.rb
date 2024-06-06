use_sample_bpm :loop_compus, num_beats: 6

live_loop :chop do
  2.times do
    sample :loop_compus, amp: 1.5, num_slices: 32, slice: (ring 0, pick, pick, 5).tick
    sleep 0.25
  end
end

live_loop :hats do
  4.times do |i|
    if i != 3
      0.3
      sample :hat_bdu, amp: 0.35
    end
    sleep 0.25
  end
end

live_loop :clap do
  sleep 0.75
  sample :perc_snap, amp: 0.5
  sleep 0.25
end

live_loop :bass do
  use_synth :fm
  use_synth_defaults divisor: 2, depth: 1, release: 0.3, cutoff: 60
  
  bass_notes = (ring :e2, :e2, :g3, :e2, :b2, :fs2, :b3, :e3)
  bass_durations = (ring 0.5, 0.25, 1, 0.5, 0.5,0.25, 0.5, 0.5)
  
  8.times do
    play bass_notes.tick, release: 0.3, cutoff: rrand(50, 70)
    sleep bass_durations.look
  end
end

live_loop :chords do
  use_synth :blade
  use_synth_defaults release: 1.76, cutoff: 80, amp: 1.2, attack: 0.176, reverse: 1
  
  chords = [
    chord(:e2, :m7),
    chord(:g2, :major7),
    chord(:a2, :madd9),
    chord(:b2, :add9, num_octaves: 2).map { |note| note + 1 }
  ]
  
  play chords.tick
  sleep 2
end
