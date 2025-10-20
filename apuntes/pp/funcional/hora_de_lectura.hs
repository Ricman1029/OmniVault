type Titulo = String
type Autor = String
type Hojas = Int
type Libro = (Titulo, Autor, Hojas)

biblioteca :: [Libro]
biblioteca = [
    ("El visitante", "Stephen King", 592),
    ("Shingeki no Kyojin, capitulo 1", "Hajime Isayama", 40),
    ("Shingeki no Kyojin, capitulo 3", "Hajime Isayama", 40),
    ("Shingeki no Kyojin, capitulo 127", "Hajime Isayama", 40),
    ("Fundación", "Isaac Asimov", 230),
    ("Sandman", "Neil Gaiman", 35),
    ("Eragon", "Christopher Paolini", 544),
    ("Eldest", "Christopher Paolini", 704),
    ("Brisignr", "Christopher Paolini", 700),
    ("Legado", "Christopher Paolini", 811)
    ]

-- Promedio de Hojas
promedioDeHojas :: [Libro] -> Hojas
promedioDeHojas unaBiblioteca = div (hojasTotales unaBiblioteca) (cantidadDeLibros unaBiblioteca)

hojasTotales :: [Libro] -> Hojas
hojasTotales  = sum.hojasPorLibro 

hojasPorLibro :: [Libro] -> [Hojas]
hojasPorLibro = map hojas

hojas :: Libro -> Hojas
hojas (_, _, hojas) = hojas

cantidadDeLibros :: [Libro] -> Int
cantidadDeLibros = length

-- Lecturas Obligatorias
lecturaObligatoria :: Libro -> Bool
lecturaObligatoria (_, "Stephen King", _) = True
lecturaObligatoria ("Eragon", "Christopher Paolini", _) = True
lecturaObligatoria ("Eldest", "Christopher Paolini", _) = True
lecturaObligatoria ("Brisignr", "Christopher Paolini", _) = True
lecturaObligatoria ("Legado", "Christopher Paolini", _) = True
lecturaObligatoria ("Fundación", "Isaac Asimov", 230) = True
lecturaObligatoria (_, _, _) = False

-- Capaz puedo usar elem para no repetir las lineas de los libros de eragon
lecturaObligatoria2 :: Libro -> Bool
lecturaObligatoria2 (_, "Stephen King", _) = True
lecturaObligatoria2 (titulo, "Christopher Paolini", _) = esDeLaSagaEragon titulo
lecturaObligatoria2 ("Fundación", "Isaac Asimov", 230) = True
lecturaObligatoria2 (_, _, _) = False

esDeLaSagaEragon :: Titulo -> Bool
esDeLaSagaEragon titulo = elem titulo titulosDeLaSagaEragon

titulosDeLaSagaEragon = ["Eragon", "Eldest", "Brisignr", "Legado"]


-- Biblioteca fantasiosa
esFantasiosa :: [Libro] -> Bool
-- esFantasiosa unaBiblioteca = any esFantasioso (map autor unaBiblioteca)
-- el LSP me dijo que no hace falta el map, re copado.
-- el tipo de any es (a -> Bool) -> [a] -> Bool. Como yo tengo una lista de libros
-- y quería analizar los autores, pensé que necesitaba map. Pero el LSP me dice que no hace falta,
-- y me dí cuenta que es porque puedo hacer la composicion de abajo, y el any sigue recibiendo 
-- un libro y me devuelve un bool, pero adentro de la composicion yo analizo al autor
-- y no tengo que usar map!
esFantasiosa = any (esFantasioso.autor)

esFantasioso :: Autor -> Bool
esFantasioso "Christopher Paolini" = True
esFantasioso "Neil Gaiman" = True
esFantasioso _ = False

autor :: Libro -> Autor
autor (_, autor, _) = autor

-- Nombre de la biblioteca
nombreDeLaBiblioteca :: [Libro] -> String
nombreDeLaBiblioteca  = concat.titulosSinVocales.titulosDeBiblioteca

titulosDeBiblioteca :: [Libro] -> [Titulo]
titulosDeBiblioteca = map titulo

titulo :: Libro -> Titulo
titulo (titulo, _, _) = titulo

titulosSinVocales :: [Titulo] -> [String]
titulosSinVocales  = map quitarVocales 

quitarVocales :: Titulo -> String
quitarVocales  = filter noEsVocal 

vocales :: String
vocales = "AEIOUaeiou"

noEsVocal :: Char -> Bool
-- noEsVocal caracter = not (elem caracter vocales)
-- el LSP me marca que existe notElem
noEsVocal caracter = notElem caracter vocales


-- Biblioteca ligera
bibliotecaLigera :: [Libro] -> Bool
bibliotecaLigera unaBiblioteca = not $ any (>40) (hojasPorLibro unaBiblioteca)



