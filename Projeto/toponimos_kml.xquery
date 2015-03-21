xquery version "3.0";
declare option exist:serialize "method=xml  indent=yes";
let $cantigas := collection('/db/toponimia')//TEXTOCER
let $toponimos := $cantigas//TOPO
let $nome := doc('/db/autores-pinheiro/autores.xml')//option
return 
    <kml xmlns="http://www.opengis.net/kml/2.2">
        <Document>
            <name>Topónimos cantigas</name>
                    {for $resultado in $toponimos
                    return
                    <Placemark>
                        <name>{$resultado/string()}</name>
                        <description>{concat('Cantiga: ', $resultado/ancestor::*[name()='TEXTOCER']//INCIPIT,
                        '. Autor: ', $nome[@value = $resultado/ancestor::*[name()='TEXTOCER']/CT/substring-before(replace(@IDE, '(\d{3})', '$1 '), ' ')])}</description>
                        <coordinates></coordinates>
                    </Placemark>}
        </Document>
    </kml>
