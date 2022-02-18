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
    
    }
]
# ============Data End============

#==========Metothods- Start===========
# =========           ================

# Metho ACTION MENU
def print_actions_menu
  puts "-"*65
  puts " action | create | show | update | delete | next | prev | next " 
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

events_list(events) # LIST EVENT
print_actions_menu # WATCH ACTIONS

# ======== ACTION ==========
action = nil
while action != "exit"
  print "action:   "
  action = gets.chomp 
  #capture the action as a <string>
  case action
  # ===========LIST ACTION ===========
  when "list"
    puts "list "
  # ========== CREATE action ======
  when "create"
    puts "create"
  # ========== SHOW ACTION ===========
  when "show"
    puts "Event ID "
  # ========== Update Action=========
  when "update"
    puts "update"
  # ========== DELETE Action ==========
  when "delete"
    puts "Event ID"
  # =========== Next =========
  when "next"
    puts "next"
  # =========== Prev  =========
  when "prev"
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

end

def list_events

end

def show_event(argument)

end

def update_event(argument)

end

def delete_event()

end 

def next_week(arguement)

end

def prev_week(argument)

end

def exit()

end

# ============= Methods ends

# ============= Main Program starts


# ============= Main Program starts

