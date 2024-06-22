use_sample_bpm :loop_amen_full, num_beats: 8

live_loop :chop do
  2.times do
    sample :loop_amen_full, amp: 0.65, num_slices: 32, slice: (ring 0, pick, pick, pick).tick
    sleep 0.25
  end
end
