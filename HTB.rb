use_bpm 122

##| live_loop :bass do
##|   8.times do
##|     sample :bass_hit_c, rpitch: 6
##|     sleep 3
##|     sample :bass_hit_c, rpitch: 6
##|     sleep 0.5
##|     sample :bass_hit_c, rpitch: 7
##|     sleep 1.5
##|     sample :bass_hit_c, rpitch: 7
##|     sleep 2
##|     sample :bass_hit_c, rpitch: 7
##|     sleep 1
##|   end
##| end

live_loop :hats do
  2.times do
    sample :hat_gem, amp: 0.75
    sleep 0.5
  end
end

HTB = "/Users/Creed/Downloads/hit-the-blunt-gimisum-family-instrumental-remake.wav"

sample HTB





