ActiveRecord::Schema.define do
  create_table :clients do |t|
    t.string :name
    t.string :address
    t.string :city
    t.string :postcode, limit: 6
  end

  create_table :jobs do |t|
    t.string     :name
    t.column     :pricing_type, "ENUM('fixed', 'hourly')", default: 'fixed'
    t.float      :pricing_value
    t.belongs_to :client
  end

  create_table :sessions do |t|
    t.string     :name
    t.datetime   :start_date
    t.datetime   :end_date
    t.text       :description
    t.belongs_to :job
  end

  create_table :invoices do |t|
    t.string     :no, limit: 8
    t.datetime   :date
  end

  create_table :invoices_jobs, id: false do |t|
    t.belongs_to :invoice
    t.belongs_to :job
  end
end