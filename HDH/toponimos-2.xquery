xquery version "3.0";
declare option exist:serialize "method=xml  indent=yes";
let $cantigas := collection('/db/cantigas')
let $toponimos := $cantigas//TOPO
let $nome := doc('/db/autoresMdB.xml')//nome
return 
    <kml>
        <Document>
            <name>Topónimos cantigas lírica profana galego-portuguesa</name>
                    {for $resultado in $toponimos
                    let $metadata:= $resultado/ancestor::TEXTOCER/CT
                    let $autor:= $nome[@value = $metadata/substring-before(replace(@IDE, '(\d{3})', '$1 '), ' ')]/string()
                    let $incipit:= $metadata/INCIPIT/string()
                    return
                    <Placemark>
                        <name>{$resultado/string()}</name>
                        <description>
                            <ul>
                                <li><strong>Cantiga: </strong><em>{$incipit}</em></li>
                                <li><strong>Autor: </strong>{$autor}</li>
                            </ul>
                        </description>
                        <Style>
                            <IconStyle>
                                <Icon>
                                    {(if($metadata/contains(@XE, 'A')) then 
                                     <href>http://www.obdurodon.org/~heb43/amor.png</href>
                                     else 
                                        (if($metadata/contains(@XE, 'E')) then
                                        <href>http://www.obdurodon.org/~heb43/escarnho.png</href>
                                        else
                                             (if($metadata/contains(@XE, 'M')) then
                                            <href>http://www.obdurodon.org/~heb43/amigo.png</href>
                                            else 
                                            <href>http://www.obdurodon.org/~heb43/menores.png</href>))
                                     )}
                                </Icon>
                            </IconStyle>
                       </Style>
                        <Point>
                            <coordinates>-</coordinates>
                        </Point>
                    </Placemark>}
        </Document>
    </kml>
