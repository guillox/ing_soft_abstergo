CATEGORIES_NAMES = [ "Accesorios para Vehículos", "Animales y Mascotas", "Antigüedades", "Arte y Artesanías", "Bebés", "Cámaras y Accesorios", "Celulares y Teléfonos", "Coleccionables y Hobbies", "Computación", "Consolas y Videojuegos", "Delicatessen y Vinos", "Deportes y Fitness", "Electrodomésticos y Aires Ac.", "Electrónica, Audio y Vídeo", "Entradas para Eventos", "Hogar, Muebles y Jardín", "Industrias y Oficinas", "Instrumentos Musicales", "Joyas y Relojes", "Juegos y Juguetes", "Libros, Revistas y Comics", "Música, Películas y Series", "Ropa y Accesorios", "Salud y Belleza", "Otras categorías" ]

def create_category(name)
  Category.create(name: name)
end

task create_categories: :environment do
  Category.destroy_all

  for name in CATEGORIES_NAMES
    create_category(name)
  end

  puts "### CATEGORIAS CREADAS CON ÉXITO"
end