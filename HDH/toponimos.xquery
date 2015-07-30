(:xquery version "3.0";
declare option exist:serialize "method=xml  indent=yes";:)
let $cantigas := collection('/db/toponimia')//TEXTOCER
let $toponimos := $cantigas//TOPO
let $unicas:= distinct-values($toponimos)
let $nome := doc('/db/autoresMdB.xml')//nome
return 
    <kml xmlns="http://www.opengis.net/kml/2.2">
        <Document>
            <name>Topónimos cantigas lírica profana galego-portuguesa</name>
                    {for $resultado in $toponimos[. = $unicas]
                    return
                    <Placemark>
                        <name>{$resultado/string()}</name>
                        <description>
                            <ul>
                                <li><strong>Cantiga</strong>: <em>{$resultado/ancestor::*[name()='TEXTOCER']//INCIPIT}</em></li>
                                <li><strong>Autor</strong>: {$nome[@value = $resultado/ancestor::*[name()='TEXTOCER']/CT/substring-before(replace(@IDE, '(\d{3})', '$1 '), ' ')]}</li>
                            </ul>
                            </description>
                        <Style>
                            <IconStyle>
                                <Icon>
                                    {(if($resultado/ancestor::CT/substring-before(@XE, ' ') = 'A' or 'CA') then 
                                     <href>http://www.obdurodon.org/~heb43/amor.png</href>
                                     else 
                                        (if($resultado/ancestor::CT/substring-before(@XE, ' ') = 'T' or 'L' or 'PR' or 'PAR' or 'PG') then
                                        <href>http://www.obdurodon.org/~heb43/menores.png</href>
                                        else
                                             (if($resultado/ancestor::CT/substring-before(@XE, ' ') = 'M') then
                                            <href>http://www.obdurodon.org/~heb43/amigo.png</href>
                                            else 
                                            <href>http://www.obdurodon.org/~heb43/escarnho.png</href>))
                                     )}
                                </Icon>
                            </IconStyle>
                       </Style>
                        <Point>
                            <coordinates></coordinates>
                        </Point>
                    </Placemark>}
        </Document>
    </kml>
