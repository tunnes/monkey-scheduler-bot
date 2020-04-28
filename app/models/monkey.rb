class Monkey
  class << self
    def now
       time = Time.now

      if time.hour == 0 and time.min < 5
        thing = {size: 34, text: 'OFICIAL'}
        time = "MEIA NOITE"
        other_thing = {size: 50, text: 'ÓLEO'}
        file = File.open("public/macaco-primordial.jpg")
      else
        thing = thing_label
        time = time_label
        other_thing = other_thing_label
        file = File.open(monkey_image_sample_the_guitarra)
      end

      image = MiniMagick::Image.open(file)
      image.resize('500x350!')

      image.combine_options do |i|
          i.gravity 'center'
          i.fill "#FFFFFF"
          i.font "public/timr45w.ttf"
          i.pointsize 45
          i .draw "text 0,-100 '#{time_label}!!!'"
          i.pointsize thing[:size]
          i .draw "text 0,-50 'HORÁRIO #{thing[:text]} DO'"
          i.pointsize 50
          i .draw "text 0,0 #{other_thing[:text]}"
          i.pointsize 45
          i .draw "text 0,50 'DE'"
          i.pointsize 50
          i .draw "text 0,95 'MACACO'"
          i.quality 13
      end

      file.close
      image.write "tmp/new_monkey.jpg"
      image.path
    end

    private

    def time_label
       time = Time.now

       case time.hour
         when 0..12
           "#{time.strftime("%HH%M")} DA MANHÃ"
         when 12..20
           "#{time.strftime("%HH%M")} DA TARDE"
         when 20..0
           "#{time.strftime("%HH%M")} DA NOITE"
       end
    end

    def thing_label
      [{size: 34, text: 'NACIONAL'},
       {size: 32, text: 'CONSTITUCIONAL'},
       {size: 34, text: 'FEDERAL'},
       {size: 34, text: 'INCREMENTAL'}].sample
    end

    def other_thing_label
      [{size: 50, text: 'AFAGO'},
       {size: 50, text: 'ACONCHEGO'},
       {size: 50, text: 'RUGIDO'},
       {size: 50, text: 'BABA'}, # Hilder references
       {size: 50, text: 'MORTAL'},
       {size: 50, text: 'MALABARES'}
       ].sample
    end

    def monkey_image_sample_the_guitarra
      "public/macaco-#{rand(1..7)}.jpg"
    end
  end
end
