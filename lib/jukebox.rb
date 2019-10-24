require "pry"

songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end


def redesign_list(songlist)
  retyped_list = []
  songlist.each_with_index { | song, index |
    new_index = index + 1
    retyped_list[index] = "#{new_index}. #{song}"
    }
  retyped_list
end

def list(songlist)
  list_to_print = redesign_list(songlist)

  list_to_print.each { | song |
    puts song
  }

end

def match_by_name(input_string,songlist)
  matched_song = ""
  list_to_scan = redesign_list(songlist)

  list_to_scan.each_with_index { | song, index |
    if song.include?(input_string)
      matched_song = songlist[index]
    end
  }
    matched_song
end

def play(songlist)
  puts "Please enter a song name or number:"
  response = gets.strip
  selected_song = match_by_name(response,songlist)

  if selected_song == ""
    puts "Invalid input, please try again"
  else
  puts "Playing #{selected_song}"
  end
end

def exit_jukebox
  puts "Goodbye"
end

def menu_input
  input = gets.strip
end

def run(songlist)
  continue = true
  while continue do
    puts "Please enter a command:"
    input = menu_input
    if input == "help"
      help
    elsif input == "list"
      list(songlist)
    elsif input == "play"
      play(songlist)
    elsif input == "exit"
      exit_jukebox
      continue = false
    else
      puts "Something went wrong!"
    end
  end
end
