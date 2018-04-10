require("pg")

class BountyHunter

  attr_reader :id
  attr_accessor :name, :species, :bounty_value, :favourite_weapon

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @species = options["species"]
    @bounty_value = options["bounty_value"]
    @favourite_weapon = options["favourite_weapon"]
  end

  def save()
    db = PG.connect({dbname: "bountyhunter", host: "localhost"})
    sql = "INSERT INTO bounty_hunter (name, species, bounty_value, favourite_weapon) VALUES ($1, $2, $3, $4) RETURNING id;"
    values = [@name, @species, @bounty_value, @favourite_weapon]
    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    db.close()
    @id = result[0]["id"].to_i
  end

  def delete()
    db = PG.connect({dbname: "bountyhunter", host: "localhost"})
    sql = "DELETE FROM bounty_hunter WHERE id = $1"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()
  end

  def update()
    db = PG.connect({dbname: "bountyhunter", host: "localhost"})
    sql = "UPDATE bounty_hunter SET (name, species, bounty_value, favourite_weapon) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@name, @species, @bounty_value, @favourite_weapon, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def self.all()
    db = PG.connect({dbname: "bountyhunter", host: "localhost"})
    sql = "SELECT * FROM bounty_hunter"
    db.prepare("all", sql)
    hunted = db.exec_prepared("all")
    db.close()
    return hunted.map {|each| BountyHunter.new(each)}
  end

  def self.find_by_name(name)
    db = PG.connect({dbname: "bountyhunter", host: "localhost"})
    sql = "SELECT * FROM bounty_hunter WHERE name = '#{name}'"
    db.prepare("find_by_name", sql)
    results = db.exec_prepared("find_by_name")
    db.close()
    return results
  end

  def self.find_by_id(id)
    db = PG.connect({dbname: "bountyhunter", host: "localhost"})
    sql = "SELECT * FROM bounty_hunter WHERE id = '#{id}'"
    db.prepare("find_by_id", sql)
    results = db.exec_prepared("find_by_id")
    db.close()
    return results
  end


  def self.delete_all()
    db = PG.connect({dbname: "bountyhunter", host: "localhost"})
    sql = "DELETE FROM bounty_hunter"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end


end
