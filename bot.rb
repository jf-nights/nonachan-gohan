Bundler.require

ako = Cinch::Bot.new do
  configure do |c|
    c.server = 'kmc-jp.irc.slack.com'
    c.nick = 'ako'
    c.password = open('/home/jf712/.slack/ako').read.chomp
    c.port = 6667
  end

  on :message do |m|
    if m.channel.name == '#nona-food-memo' && m.user.nick == 'nona7'
      date = Time.now.strftime("%Y-%m-%d")
      time = m.time.strftime("%H:%M")
      input = m.message

      open("/home/jf712/local/log/nonachan-gohan/#{date}.log", "a") do |file|
        file.puts("#{time} #{input}")
      end
    end
  end

end

ako.start
