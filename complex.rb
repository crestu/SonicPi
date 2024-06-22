use_sample_bpm :loop_amen_full, num_beats: 8

live_loop :amen_break do
  sample :loop_amen_full, amp: 0.5, num_slices: 32, slice: (ring 0, pick, pick, pick).tick
  sleep 0.25
end

live_loop :bass do
  sample :ambi_drone, amp: 0.25, rpitch: -12
  sleep 2
end

# Define the base power chords (intervals)
base_chords = [
  [:c4, :fs4], # C and F#
  [:g3, :b4],  # G and B
  [:b3, :d4],  # B and D
  [:e3, :b4]   # E and B
]

# Define a function to get a random note in a given key and scale
define :random_note_in_key do |key, scale_type|
  notes = (scale key, scale_type, num_octaves: 2)
  return notes.choose
end

live_loop :jazz_experiment do
  # Randomly select one of the base chords
  base_chord = base_chords.choose
  
  # Define the key and scale type (e.g., C major)
  key = :c3
  scale_type = :major
  
  # Select a random note in the key and scale
  random_note = random_note_in_key(key, scale_type)
  
  # Select an additional random note for extended chords
  extended_note = random_note_in_key(key, scale_type)
  
  # Play the base chord with the additional random notes
  play base_chord[0], amp: 0.8
  play base_chord[1], amp: 0.8
  play random_note, amp: 0.6
  play extended_note, amp: 0.6
  
  # Add a sleep to control the rhythm with swing feel
  sleep [0.75, 0.25].choose
end

