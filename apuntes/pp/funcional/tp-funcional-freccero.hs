type Codigo = Char
type Descripcion = String
type Precio = Float
type PresentacionDeHelado = (Codigo, Descripcion, Precio)

tablaTiposPresentacionesHelado :: [PresentacionDeHelado]
tablaTiposPresentacionesHelado = [
    ('S', "cono simple", 2500), 
    ('D', "cono doble", 3500), 
    ('T', "cono triple", 4000),
    ('P', "pinito gigante", 5900)
    ]

precioPorCodigo :: Codigo -> Precio
precioPorCodigo unCodigo
    | esUnCodigoDePresentacion unCodigo = (precio . head . filter (esElCodigoDeLaPresentacion unCodigo)) tablaTiposPresentacionesHelado 
    | otherwise = 0

cantidadDeHeladosMasCarosQue :: [Codigo] -> Precio -> Int
cantidadDeHeladosMasCarosQue unaListaDeCodigos unPrecio = (length . filter (>unPrecio) . map precioPorCodigo) unaListaDeCodigos

preciosEntre :: [Precio] -> Precio -> Precio -> [Precio]
preciosEntre unaListaDePrecios precioMinimo precioMaximo = (filter (>=precioMinimo) . filter (<=precioMaximo)) unaListaDePrecios


preciosEntreRecursivo :: [Precio] -> Precio -> Precio -> [Precio]
preciosEntreRecursivo unaListaDePrecios precioMinimo precioMaximo = (listaMayoresAlMinimo precioMinimo . listaMenoresAlMaximo precioMaximo) unaListaDePrecios

listaMayoresAlMinimo :: Precio -> [Precio] -> [Precio]
listaMayoresAlMinimo unMinino [] = []
listaMayoresAlMinimo unMinimo (cabeza:cola)
    | cabeza >= unMinimo = cabeza : listaMayoresAlMinimo unMinimo cola
    | otherwise = listaMayoresAlMinimo unMinimo cola

listaMenoresAlMaximo :: Precio -> [Precio] -> [Precio]
listaMenoresAlMaximo unMaximo [] = []
listaMenoresAlMaximo unMaximo (cabeza:cola)
    | cabeza <= unMaximo = cabeza : listaMenoresAlMaximo unMaximo cola
    | otherwise = listaMenoresAlMaximo unMaximo cola

informacionPorCodigo :: Codigo -> (Descripcion, Precio)
informacionPorCodigo unCodigo 
    | esUnCodigoDePresentacion unCodigo = (presentacionSinCodigo . head . filter (esElCodigoDeLaPresentacion unCodigo)) tablaTiposPresentacionesHelado
    | otherwise = ("", 0.0)

esElCodigoDeLaPresentacion :: Codigo -> PresentacionDeHelado -> Bool
esElCodigoDeLaPresentacion unCodigo unaPresentacion = unCodigo == codigo unaPresentacion

codigo :: PresentacionDeHelado -> Codigo
codigo (unCodigo, _, _) = unCodigo

presentacionSinCodigo :: PresentacionDeHelado -> (Descripcion, Precio)
presentacionSinCodigo (_, unaDescripcion, unPrecio) = (unaDescripcion, unPrecio)

esUnCodigoDePresentacion :: Codigo -> Bool
esUnCodigoDePresentacion unCodigo = any (esElCodigoDeLaPresentacion unCodigo) tablaTiposPresentacionesHelado 

precio :: PresentacionDeHelado -> Precio
precio (_, _, unPrecio) = unPrecio

