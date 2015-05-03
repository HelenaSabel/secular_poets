<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <let name="IDs" value="//@xml:id"/>
    <let name="places" value="doc('../XML/common-affiliations.xml')//tei:place/@xml:id"/>
    <pattern>
        <rule context="tei:person">
            <assert test="@xml:id">Falta código autor</assert>
            <!--<assert test="tei:nationality">Falta nacionalidade</assert>
            <assert test="occupation">Falta ocupaçom</assert>
            <assert test="socecStatus">Falta condiçom social</assert>-->
            <assert test="tei:floruit[@period]">Falta o período</assert>
        </rule>
        <rule context="tei:affiliation">
            <assert test="if (@corresp) then substring(@corresp,2) = $IDs or substring(@corresp,2) = $places else true()">O valor da referência nom foi declarado</assert>
            <assert test="@n">Falta tipologia genérica</assert>
            <assert test="@n = 'social' or 'geo' or 'predio'">A tipologia nom é correta</assert>
            <assert test="if (@key) then @key ='mecenas' or 'familia' or 'contemporaneo' or 'propriedade' else true()">A relaçom nom tem um valor conhecido</assert>
        </rule>
        <rule context="tei:nationality">
            <assert test="@key = 'gl' or 'pt' or 'cas' or 'oc' or 'arag' or 'sev' or 'it'">Nacionalidade nom conhecida</assert>
        </rule>
    </pattern>
</schema>