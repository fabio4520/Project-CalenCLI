require 'date'
# ==============Data start
id = 0

##======FECHA

events = [
  {"id" => 1,
    "start_date" => "2021-11-15T00:00:00-05:00",
    },
    {
      "id" => 1,
    "start_date" => "2021-11-15T00:00:00-05:00",
    
    "id" => (id = id.next),
    "start_date" => "2021-11-15T00:00:00-05:00",
    "title" => "Ruby Basics 1",
    "end_date" => "",
    "notes" => "Ruby Basics 1 notes",
    "guests" => %w[Teddy Codeka],
    "calendar" => "web-dev" }
    },
    { "id" => (id = id.next),
      "start_date" => "2021-11-15T12:00:00-05:00",
      "title" => "English Course",
      "end_date" => "2021-11-15T13:30:00-05:00",
      "notes" => "English notes",
      "guests" => ["Stephanie"],
      "calendar" => "english" },
]

# ============Data End============

#==========Methods- Start===========
# =========           ================

# Method ACTION MENU
def print_actions_menu
  puts "-"*65
  puts " list | create | show | update | delete | next | prev | next " 
  puts ""
end
# ========= END A.M========
# ========== M. EVENT_LIST==========
def events_list(events)
  puts "-----------------Welcome to CalendLi-------------"
  puts ""
  events.each do |event|
  puts "#{event["id"]}. #{event["start_date"]}" 
  end
end
# ========= END M.E_L===========

#events_list(events) # LIST EVENT

#print_actions_menu # WATCH ACTIONS

# ======== ACTION ==========
action = nil
while action != "exit"
  print "action:   "
  action = gets.chomp 
  #capture the action as a <string>
  case action
  # ===========LIST ACTION ===========
  when "list"
    events_list(events)
    print_actions_menu
    puts "list "
  # ========== CREATE action ======
  when "create"


    #funciona de create pendiente
    print_actions_menu
    puts "create"
  # ========== SHOW ACTION ===========
  when "show"

    print_actions_menu
    puts "Event ID "
  # ========== Update Action=========
  when "update"

    print_actions_menu
    puts "update"
  # ========== DELETE Action ==========
  when "delete"
    delete_event()
    print_actions_menu
    puts "Event ID"
  # =========== Next =========
  when "next"

    print_actions_menu
    puts "next"
  # =========== Prev  =========
  when "prev"

    print_actions_menu
    puts "prev"
  # ======== invalid action =====
  when "exit"
    puts "Thanks for using calenCLI"
  # ======== invalid action =====
  else 
    puts "invalid action"
  end 
end


# ============= Methods  Añadiendo los metodos mínimos que se necesitarán usar (si se necesitan más lo añadimos luego)

def create_event(arguments)
  print "date: "
  date =  date = gets.chomp # YYYY-MM-DD (REQUIRED)
  print "title: "
  title = gets.chomp # TEXT (REQUIRED)
  print "calendar: "
  calendar = gets.chomp # tech/english/soft skills
  print "start_end: "
  start_end = gets.chomp # 23:00 23:30
  print "notes: "
  notes = gets.chomp # TEXT
  print "guests: "
  guests = gets.chomp # NAMES (fabio, leandro)

  

  date_arr = date.split("-").map(&:to_i)
  start_end_arr = start_end.split(/[\s,:]/).map(&:to_i) # los separo por espacio(\s) y por ":"

  start_date = DateTime.new(date_arr[0],date_arr[1],date_arr[2],start_end_arr[0],start_end_arr[1], 0,"-5").to_s
  end_date = DateTime.new(date_arr[0],date_arr[1],date_arr[2],start_end_arr[2],start_end_arr[3], 0,"-5").to_s

end

def show_event(argument)

end

def update_event(argument)

end

def delete_event(event_id)
  events.delete(events[event_id])
  list_actions
  
end 

def next_week(arguement)

end

def prev_week(argument)

end


# ============= Methods ends

# ============= Main Program starts

# ============= Main Program starts

