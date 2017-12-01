module Talk
  def talk(words)
    puts("#{words}")
  end
end

class NicksClass
  include Talk
end

nick = NicksClass.new
nick.talk("Hey guys!")
