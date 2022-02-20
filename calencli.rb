require 'date'
# ==============Data start
id = 0

##======FECHA

events = [
  { "id" => (id = id.next),
    "start_date" => "2021-11-15T00:00:00-05:00",
    "title" => "Ruby Basics 1",
    "end_date" => "",
    "notes" => "Ruby Basics 1 notes",
    "guests" => %w[Teddy Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-15T12:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2021-11-15T13:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-16T00:00:00-05:00",
    "title" => "Ruby Basics 2",
    "end_date" => "",
    "notes" => "Ruby Basics 2 notes",
    "guests" => %w[Andre Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-16T12:45:00-05:00",
    "title" => "Soft Skills - Mindsets",
    "end_date" => "2021-11-15T13:30:00-05:00",
    "notes" => "Some extra notes",
    "guests" => ["Diego"],
    "calendar" => "soft-skills" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-17T00:00:00-05:00",
    "title" => "Ruby Methods",
    "end_date" => "",
    "notes" => "Ruby Methods notes",
    "guests" => %w[Diego Andre Teddy Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-17T12:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2021-11-15T13:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-18T09:00:00-05:00",
    "title" => "Summary Workshop",
    "end_date" => "2021-11-19T13:30:00-05:00",
    "notes" => "A lot of notes",
    "guests" => %w[Diego Teddy Andre Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-18T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-19T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-19T12:00:00-05:00",
    "title" => "English for Engineers",
    "end_date" => "2021-11-19T13:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-20T10:00:00-05:00",
    "title" => "Breakfast with my family",
    "end_date" => "2021-11-20T11:00:00-05:00",
    "notes" => "",
    "guests" => [],
    "calendar" => "default" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-20T15:00:00-05:00",
    "title" => "Study",
    "end_date" => "2021-11-20T20:00:00-05:00",
    "notes" => "",
    "guests" => [],
    "calendar" => "default" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-25T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-26T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
]

initial_week = DateTime.parse(events[0]["start_date"]).cweek

# ============Data End============

#==========Methods- Start===========
# =========           ================

# Method ACTION MENU
def print_actions_menu
  puts "-" * 65
  puts " list | create | show | update | delete | next | prev | exit "
  puts ""
end

# =========           ================

def list_events(events, week)
  puts "-----------------Welcome to CalendLi-------------"
  puts ""
  for i in 1..12
    for j in 1..31
      begin
        date = Date.new(2021, i, j)
      rescue
      else
        date = Date.new(2021, i, j)
      end

      print date.strftime('%a %b %d') if date.cweek == week

      full_day_events = []
      hour_day_events = []

      a = false

      for event in events
        if event["end_date"] == "" && Date.new(event["start_date"][0..3].to_i, event["start_date"][5..6].to_i,
                                               event["start_date"][8..9].to_i).cweek == week
          hora = "                "
          full_day_events.append([event["title"], hora, event["id"], event["start_date"]])
        #       puts "#{hora} #{event["title"]} (#{event["id"]})" if event["start_date"][0..9] == date.to_s[0..9] && date.cweek == week
        elsif Date.new(event["start_date"][0..3].to_i, event["start_date"][5..6].to_i,
                       event["start_date"][8..9].to_i).cweek == week
          hora = "#{event["start_date"][11..15]} #{event["end_date"][11..15]}"
          a = false
          #       puts "#{hora} #{event["title"]} (#{event["id"]})" if event["start_date"][0..9] == date.to_s[0..9] && date.cweek == week
          hour_day_events.append([event["title"], hora, event["id"], event["start_date"]])
        end

      end
      full_day_events = full_day_events.uniq
      hour_day_events = hour_day_events.uniq

      full_day_events.each { |x| puts "#{x[1]}    #{x[0]} (#{x[2]})" if x[3][0..9] == date.to_s[0..9] }

      hour_day_events.each { |x| puts "#{x[1]} #{x[0]} (#{x[2]})" if x[3][0..9] == date.to_s[0..9] }
      events_per_day = 0
      events.each { |event| events_per_day += 1 if event["start_date"][0..9] == date.to_s[0..9] && date.cweek == week }

      puts "                No events" if events_per_day == 0 && date.cweek == week

    end
  end
end

def create_event(events)
  print "date: "
  date = gets.chomp # YYYY-MM-DD (REQUIRED)

  while date == ""
    puts "Type a valid date: YYYY-MM-DD"
    print "date: "
    date = gets.chomp # YYYY-MM-DD (REQUIRED)
  end

  print "title: "
  title = gets.chomp # TEXT (REQUIRED)

  while title == ""
    puts "Cannot be blank"
    print "title: "
    title = gets.chomp # TEXT (REQUIRED)
  end

  print "calendar: "
  calendar = gets.chomp # tech/english/soft skills

  print "start_end: "
  start_end = gets.chomp # 23:00 23:30
  validation = true
  while validation
    start_end_arr = start_end.split(/[\s,:]/).map(&:to_i) # los separo por espacio(\s) y por ":"
    if start_end_arr.length == 4
      # valido que la hora de inicio sea menor que la hora de término
      if start_end_arr[0] < start_end_arr[2]
        validation = false
      else
        puts "Cannot end before start"
        print "start_end: "
        start_end = gets.chomp # 23:00 23:30
      end
    elsif start_end.empty?
      validation = false
    else
      puts "Format: 'HH:MM HH:MM' or leave it empty"
      print "start_end: "
      start_end = gets.chomp # 23:00 23:30
    end
  end

  print "notes: "
  notes = gets.chomp # TEXT
  print "guests: "
  guests = gets.chomp # NAMES (fabio, leandro)

  # Condiciones en caso el usuario no ingrese valores de start_end
  start_end_arr = [0, 0, 0, 0] if start_end_arr.length == 0
  end_date = ""
  # ======= Terminan las condiciones

  date_arr = date.split("-").map(&:to_i) # divido el date por guiones

  unless start_end == ""
    # En caso el usuario sí haya ingresado valores y estos hayan sido validados
    end_date = DateTime.new(date_arr[0], date_arr[1], date_arr[2], start_end_arr[2], start_end_arr[3], 0, "-5").to_s
  end

  start_date = DateTime.new(date_arr[0], date_arr[1], date_arr[2], start_end_arr[0], start_end_arr[1], 0, "-5").to_s

  id = events.last["id"] # el último id del array

  hash_create = {
    "id" => (id = id.next),
    "start_date" => start_date,
    "title" => title,
    "end_date" => end_date,
    "notes" => notes,
    "guests" => guests.split(" "),
    "calendar" => ""
  }

  events.append(hash_create)
end

# =========           ================

def update_event(hashes, update_id)
  print "date: "
  date = gets.chomp # YYYY-MM-DD (REQUIRED)

  while date == ""
    puts "Type a valid date: YYYY-MM-DD"
    print "date: "
    date = gets.chomp # YYYY-MM-DD (REQUIRED)
  end

  print "title: "
  title = gets.chomp # TEXT (REQUIRED)

  while title == ""
    puts "Cannot be blank"
    print "title: "
    title = gets.chomp # TEXT (REQUIRED)
  end

  print "calendar: "
  calendar = gets.chomp # tech/english/soft skills

  print "start_end: "
  start_end = gets.chomp # 23:00 23:30
  validation = true
  while validation
    start_end_arr = start_end.split(/[\s,:]/).map(&:to_i) # los separo por espacio(\s) y por ":"
    if start_end_arr.length == 4
      # valido que la hora de inicio sea menor que la hora de término
      if start_end_arr[0] < start_end_arr[2]
        validation = false
      else
        puts "Cannot end before start"
        print "start_end: "
        start_end = gets.chomp # 23:00 23:30
      end
    elsif start_end.empty?
      validation = false
    else
      puts "Format: 'HH:MM HH:MM' or leave it empty"
      print "start_end: "
      start_end = gets.chomp # 23:00 23:30
    end
  end

  print "notes: "
  notes = gets.chomp # TEXT
  print "guests: "
  guests = gets.chomp # NAMES (fabio, leandro)

  # Condiciones en caso el usuario no ingrese valores de start_end
  start_end_arr = [0, 0, 0, 0] if start_end_arr.length == 0
  end_date = ""
  # ======= Terminan las condiciones

  date_arr = date.split("-").map(&:to_i) # divido el date por guiones

  unless start_end == ""
    # En caso el usuario sí haya ingresado valores y estos hayan sido validados
    end_date = DateTime.new(date_arr[0], date_arr[1], date_arr[2], start_end_arr[2], start_end_arr[3], 0, "-5").to_s
  end

  start_date = DateTime.new(date_arr[0], date_arr[1], date_arr[2], start_end_arr[0], start_end_arr[1], 0, "-5").to_s

  for x in hashes
    if x["id"] == update_id
      x["start_date"] = start_date
      x["title"] = title
      x["end_date"] = end_date
      x["notes"] = notes
      x["guest"] = guests.split(" ")
      x["calendar"] = calendar
    end
  end
end

# =========           ================

def delete_event(calendar, event_id)
  for i in calendar
    calendar.delete(i) if i["id"] == event_id.to_i
 end
  #  events.delete(events[event_id])
end

# =========           ================

def show_event(events, event_id)
  for event in events
    if event["id"] == event_id.to_i
      puts "date: #{event["start_date"][0..9]}"
      puts "title: #{event["title"]}"
      puts "calendar: #{event["calendar"]}"

      if event["end_date"] == ""
        start_end = "00:00 - 23:59"
      else
        start_end = event["start_date"].slice(11, 5) + " " + event["end_date"].slice(11, 5)
      end
      puts "start_end:#{start_end} "
      puts "notes: #{event["notes"]}"
    end
  end
end

# ============= Methods ends

# ============= Main Program starts

# ======== ACTION ==========
action = nil
while action != "exit"
  print "action:   "
  action = gets.chomp
  # capture the action as a <string>
  case action
  # ===========LIST ACTION ===========
  when "list"

    list_events(events, initial_week)

    print_actions_menu
    puts "list "
  # ========== CREATE action ======
  when "create"

    # funciona de create pendiente
    # print_actions_menu
    create_event(events)
    puts "create"
  # ========== SHOW ACTION ===========
  when "show"

    print "Event id: "
    event_id = gets.chomp.to_i
    show_event(events, event_id)
    print_actions_menu

  # ========== Update Action=========
  when "update"
    print "Event id: "
    update_id = gets.chomp.to_i
    update_event(events, update_id)
    list_events(events, initial_week)

  # ========== DELETE Action ==========
  when "delete"

    print "Event ID: "
    delete_id = gets.chomp
    delete_event(events, delete_id)
    print_actions_menu

  # =========== Next =========
  when "next"
    initial_week += 1
    list_events(events, initial_week)
    print_actions_menu
    puts "next"
  # =========== Prev  =========
  when "prev"
    initial_week -= 1
    list_events(events, initial_week)
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

# ============= Main Program starts
