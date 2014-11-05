class Categoria < ActiveRecord::Base
validates :nombre, presence:true, uniqueness:true, numericality:false, lenght:{ minimum: 0, maximux:20 }
end
