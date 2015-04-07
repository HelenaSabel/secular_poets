xquery version "3.0";
declare option exist:serialize "method=html5 media-type=text/html omit-xml-declaration=yes indent=yes";
let $cantigas := collection('/db/toponimia')//TEXTOCER
let $toponimos := $cantigas//TOPO
let $nome := doc('/db/autores-pinheiro/autores.xml')//option
return 
    <html>
        <head>
        <title>Resultados</title>
        </head>
        <body>
            <ul>
                {for $resultado in $toponimos
                return
                     <li>{concat($resultado/string(),' -- Cantiga: ', $resultado/ancestor::*[name()='TEXTOCER']//INCIPIT,
                     '. Autor: ', $nome[@value = $resultado/ancestor::*[name()='TEXTOCER']/CT/substring-before(replace(@IDE, '(\d{3})', '$1 '), ' ')])}</li>}
            </ul>
        </body>
    </html>
