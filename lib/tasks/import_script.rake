namespace :import_script do
  desc "Create new characters from text file"
  task characters: :environment do
    filepath = ENV['FILE']
    min_tabs = Integer(ENV['TABS'] || 1)

    throw "'FILE' required" unless filepath

    file = IO.read(filepath)
    lines = file.split("\n").reject{|l| l.empty?}

    character_names = lines
      .select{|l|l.present? && l.strip == l.strip.upcase}
      .reject{|l|l.strip =~ /^ACT/}
      .map(&:strip)
      .sort.uniq

    character_names.each do |character_name|
      if Character.find_by(name: character_name)
        puts "#{character_name} already exists"
        next
      end

      puts "\nCreate character #{character_name} (y/n/e)? "
      answer = STDIN.gets.chomp

      case answer.upcase
      when "Y"
        Character.create(name: character_name)
      when "E"
        puts "\nEnter name: "
        custom_name = STDIN.gets.chomp
        Characer.create(name: custom_name)
      else
        puts "\nSkipping #{character_name}"
      end
    end
  end

  desc "Parse script from simpsoncrazy.com"
  task simpsoncrazy: :environment do
    filepath = ENV['FILE']
    min_tabs = Integer(ENV['TABS'] || 1)

    throw "'FILE' required" unless filepath

    file = IO.read(filepath)
    lines = file.split("\n").reject{|l| l.strip.empty?}

    beat_starts = lines.each_with_index
      .map{|l,idx| idx unless l =~ /^\t\t/}
      .compact

    beat_starts.each_with_index do |ln, idx|
      #TODO: other types besides dialogue and action
      beat_type = is_all_caps(lines[ln]) ? :dialogue : :action
      content_start = beat_type == :dialogue ? ln + 1 : ln
      beat_content_lines = idx == beat_starts.length - 1 ? lines[content_start..-1] : lines[content_start...beat_starts[idx+1]]
      beat_content = beat_content_lines.map(&:strip).join(' ')

      beat_preview =
        case beat_type
        when :dialogue then "#{lines[ln].strip}\n#{beat_content}"
        else beat_content
        end

      print "\nCreate script beat: \n#{beat_preview}\n(y/n/e)? "
      answer = STDIN.gets.chomp

      next unless answer.upcase == 'Y'

      script_beat = ScriptBeat.new(
        start_line: ln,
        beat_type: beat_type,
        content: beat_content
      )

      if beat_type == :dialogue
        character_name = lines[ln].strip
        begin
          script_beat.characters << Character.find_by(name: character_name)
        rescue ActiveRecord::AssociationTypeMismatch
          binding.pry
        end
      end

      script_beat.save
    end
  end

  desc "Parse dialogue beats from an SRT subtitles file"
  task srt: :environment do
    filepath = ENV['FILE']
    season   = Integer(ENV['SN'] || 0)
    episode  = Integer(ENV['EP'] || 0)

    throw "'FILE', 'SN' and 'EP' are all required" unless filepath && episode > 0 && season > 0

    episode = Episode.find_by(
      sequence: episode,
      season: Season.find_by(sequence: season)
    )

    file = SRT::File.parse(File.new(filepath))
    file.lines.each do |line|
      script_beat = ScriptBeat.create(
        start_line: line.sequence,
        start_time: line.start_time,
        end_time: line.end_time,
        beat_type: :dialogue,
        content: line.text.join(" "),
        episode: episode
      )
    end
  end

  def indent_count(line)
    matches = line.match(/^(\t+)(.*)/)
    return 0 unless matches.length > 2 && matches[1].split('').uniq == "\t"
    matches[1].length
  end

  def is_all_caps(line)
    non_whitespace = line.strip
    non_whitespace == non_whitespace.upcase
  end

  def is_blank(line)
    line.empty? || line.strip.empty?
  end

  def dialogue_beat(start_line)

  end
end
