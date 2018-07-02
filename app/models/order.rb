class Order < ActiveRecord::Base
  belongs_to :person
  belongs_to :supplier

  def self.import_file(file)
    raise "File can't be blank!" if file.blank?
    raise "Content invalid!" if file.split("\n").count <= 1

    total = 0

    file.split("\n").each_with_index do |line, index|
      content = line.split("\t")
      raise "Content invalid!" if content.size != 6
      if index > 0
        order = Order.new
        create_order(content)
        total += total(line[2].to_f, line[3].to_i)
      end
    end
    total
  end

  def self.create_order(content)
    person_name = content[0].blank? ? "Not informed" : content[0].force_encoding('UTF-8')
    person = Person.where(name: person_name).first_or_create

    supplier_name = content[5].blank? ? "Not informed" : content[5].force_encoding('UTF-8')
    supplier_address = content[4].blank? ? "Not informed" : content[4].force_encoding('UTF-8')
    supplier = Supplier.where(name: supplier_name, address: supplier_address).first_or_create

    transaction do
      Order.create({
        person_id: person.id,
        description: content[1],
        unity_price: content[2].to_f,
        quantity: content[3].to_i,
        supplier_id: supplier.id
      })
    end
  end

  def self.total(unity_price, quantity)
    unity_price * quantity
  end
end
