require_relative "./appointment.rb"
require_relative "./patient.rb"

class Doctor 
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self 
  end 
  
  def new_appointment(date, patient) 
    Appointment.new(date, patient, self)
  end
  
  def appointments 
    Appointment.all.select {|a| a.doctor == self } 
  end 
  
  def patients 
    appointments.map(&:patient).uniq 
  end 
  
end 