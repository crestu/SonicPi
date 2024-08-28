use_bpm 140

chance = "/Users/Creed/OneDrive/Desktop/new-xperience_3.wav"
kick = "/Users/Creed/OneDrive/Desktop/new-xperience_5.wav"
eight08 = "/Users/Creed/Downloads/Don Toliver - Life of a DON Deconstructed Drum Kit-20240821T015802Z-001/Don Toliver - Life of a DON Deconstructed Drum Kit/Way Bigger/808 3 {3} [ diamond piece ] (accurate).wav"

live_loop :sample do
  2.times do
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

live_loop :kick do
  8.times do
    with_fx :eq, high: -1  do
      sample kick
      sleep 1
      sample kick
      sleep 1
      sample kick
      sleep 0.66
      sample kick
      sleep 0.66
      sample kick
      sleep 0.68
    end
  end
end

##| live_loop :eight08 do
##|   8.times do
##|     with_fx :eq, high: -1  do
##|       sample eight08, pitch: 8, start: 0, finish: 0.5
##|       sleep 1
##|       sample eight08, pitch: -4, start: 0, finish: 0.5
##|       sleep 1
##|       sample eight08, pitch: -4, start: 0, finish: 0.5
##|       sleep 1
##|       sample eight08, pitch: 8, start: 0, finish: 0.5
##|       sleep 1
##|       sample eight08, pitch: 8, start: 0, finish: 0.5
##|       sleep 1
##|       sample eight08, pitch: -4, start: 0, finish: 0.5
##|       sleep 1
##|       sample eight08, pitch: 8, start: 0, finish: 0.5
##|       sleep 1
##|       sample eight08, pitch: -4, start: 0, finish: 0.5
##|       sleep 1
##|     end
##|   end
##| end
