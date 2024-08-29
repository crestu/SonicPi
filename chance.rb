use_bpm 140

chance = "/Users/Creed/OneDrive/Desktop/new-xperience_3.wav"
kick = "/Users/Creed/OneDrive/Desktop/new-xperience_5.wav"
eight08 = "/Users/Creed/Downloads/Don Toliver - Life of a DON Deconstructed Drum Kit-20240821T015802Z-001/Don Toliver - Life of a DON Deconstructed Drum Kit/Way Bigger/808 3 {3} [ diamond piece ] (accurate).wav"

live_loop :sample do
  2.times do
    with_fx :eq, amp: 0.7 do
      with_fx :reverb, mix: 0.3 do
        sample chance, num_slices: 16, slice: 0
        sleep 2
        sample chance, num_slices: 16, slice: 6
        sleep 1.5
        sample chance, num_slices: 16, slice: 9, start: 0, finish: 0.5
        sleep 1
        sample chance, num_slices: 16, slice: 1, start: 0, finish: 0.5
        sleep 1.5
        sample chance, num_slices: 16, slice: 8, start: 0, finish: 0.5
        sleep 1
        sample chance, num_slices: 16, slice: 8, start: 0, finish: 0.5
        sleep 1
      end
    end
  end
end

live_loop :kick do
  2.times do
    with_fx :eq, high: -1, amp: 1.4  do
      sample kick
      sleep 1
      sample kick
      sleep 1
      sample kick
      sleep 0.75
      sample kick
      sleep 0.75
      sample kick
      sleep 0.5
    end
  end
end

live_loop :eight08 do
  1.times do
    with_fx :eq, amp: 0.7 do
      with_fx :lpf, mix: 0.5 do
        sample eight08, rpitch: 8, start: 0, finish: 0.25
        sleep 1
        sample eight08, rpitch: -4, start: 0, finish: 0.25
        sleep 1
        sample eight08, rpitch: -4, start: 0, finish: 0.25
        sleep 0.5
        sample eight08, rpitch: 8, start: 0, finish: 0.25
        sleep 1
        sample eight08, rpitch: 8, start: 0, finish: 0.25
        sleep 1
        sample eight08, rpitch: -4, start: 0, finish: 0.25
        sleep 1.5
        sample eight08, rpitch: 8, start: 0, finish: 0.25
        sleep 1
        sample eight08, rpitch: -4, start: 0, finish: 0.25
        sleep 1
      end
    end
  end
end

live_loop :synth do
  4.times do
    with_fx :eq, amp: 0.075 do
      with_fx :lpf, mix: 0.6 do
        use_synth :supersaw
        
        play :gs3, release: 5
        sleep 4
        play :b4, release: 3
        sleep 2
        play :as4, release: 3
        sleep 2
      end
    end
  end
end
