<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <let name="IDs" value="//@xml:id"/>
    <pattern>
        <rule context="tei:person">
            <assert test="@xml:id">Falta código autor</assert>
            <assert test="tei:nationality">Falta nacionalidade</assert><!--
            <assert test="occupation">Falta ocupaçom</assert>
            <assert test="socecStatus">Falta condiçom social</assert>-->
            <assert test="tei:floruit[@period]">Falta o período</assert>
        </rule>
        <rule context="tei:affiliation">
            <assert test="if (@corresp) then substring(@corresp,2) = $IDs else true()">O valor da referência nom foi declarado</assert>
        </rule>
    </pattern>
</schema>