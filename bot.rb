Bundler.require

ako = Cinch::Bot.new do
  configure do |c|
    c.server = 'kmc-jp.irc.slack.com'
    c.nick = 'ako'
    c.password = open('/home/jf712/.slack/ako').read.chomp
    c.port = 6667
  end

  on :message do |m|
  end

end

ako.start
