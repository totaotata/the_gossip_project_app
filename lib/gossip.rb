class Gossip
  attr_accessor :author, :content, :id
  def initialize(author, content)
    @author = author
    @content = content
    @id = id
  end
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
      end
  end
  def self.all
    @@all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      @@all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return @@all_gossips
  end
  def self.find(id)
    all_gossips = Gossip.all
    return all_gossips[id-1]
    # all_gossips = Gossip.all
    # #id = id - 1
    # all_gossips(id)
  end
end
