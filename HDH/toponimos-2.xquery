xquery version "3.0";
declare option exist:serialize "method=xml  indent=yes";
let $cantigas := collection('/db/cartografia/cantigas')
let $toponimos := $cantigas//TOPO
let $nome := doc('/db/cartografia/autoresMdB.xml')//nome
return 
    <kml>
        <Document>
            <name>Topónimos cantigas lírica profana galego-portuguesa</name>
                    {for $resultado in $toponimos
                    let $autor:= $nome[@value = $resultado/ancestor::TEXTOCER/CT/substring-before(replace(@IDE, '(\d{3})', '$1 '), ' ')]/string()
                    return
                    <Placemark>
                        <name>{$resultado/string()}</name>
                        <description>{concat('Cantiga: ', $resultado/ancestor::TEXTOCER/CT/INCIPIT/string(),'; autor: ', $autor)}</description>
                        <Style>
                            <IconStyle>
                                <Icon>
                                    {(if($resultado/ancestor::TEXTOCER/CT/contains(@XE, 'A')) then 
                                     <href>http://www.obdurodon.org/~heb43/amor.png</href>
                                     else 
                                        (if($resultado/ancestor::TEXTOCER/CT/contains(@XE, 'E')) then
                                        <href>http://www.obdurodon.org/~heb43/escarnho.png</href>
                                        else
                                             (if($resultado/ancestor::TEXTOCER/CT/contains(@XE, 'M')) then
                                            <href>http://www.obdurodon.org/~heb43/amigo.png</href>
                                            else 
                                            <href>http://www.obdurodon.org/~heb43/menores.png</href>))
                                     )}
                                </Icon>
                            </IconStyle>
                       </Style>
                        <Point>
                            <coordinates> </coordinates>
                        </Point>
                    </Placemark>}
        </Document>
    </kml>
