<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    
    <ns prefix="edirom" uri="http://www.edirom.de/ns/1.2" />
    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0" />
    <ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace" />

    <pattern id="edition_id">
        <rule context="edirom:edition">
            <assert test="matches(./@xml:id, 'edition-[0-9]{8}')">Die ID eines edition-Elements muss dem Muster 'edition-[0-9]{8}' folgen</assert>
        </rule>
    </pattern>

    <pattern id="voiceGroup_id">
        <rule context="edirom:voiceGroup">
            <assert test="matches(./@xml:id, 'voiceGroup-[0-9]+')">Die ID eines voiceGroup-Elements muss dem Muster 'voiceGroup-[0-9]+' folgen</assert>
        </rule>
    </pattern>
    
    <pattern id="navigatorItem_id">
        <rule context="edirom:navigatorItem">
            <assert test="matches(./@xml:id, 'navItem-[0-9]+')">Die ID eines navigatorItem-Elements muss dem Muster 'navItem-[0-9]+' folgen</assert>
        </rule>
    </pattern>
    
    <pattern id="navigatorCategory_id">
        <rule context="edirom:navigatorCategory">
            <assert test="matches(./@xml:id, 'navCategory-[0-9]+')">Die ID eines navigatorCategory-Elements muss dem Muster 'navCategory-[0-9]+' folgen</assert>
        </rule>
    </pattern>
    
    <pattern id="voice_id">
        <rule context="edirom:voice">
            <assert test="matches(./@xml:id, 'voice-[0-9]+')">Die ID eines voice-Elements muss dem Muster 'voice-[0-9]+' folgen</assert>
        </rule>
    </pattern>
    
    <pattern id="part_id">
        <rule context="edirom:part">
            <assert test="matches(./@xml:id, 'part-[0-9]+')">Die ID eines part-Elements muss dem Muster 'part-[0-9]+' folgen</assert>
        </rule>
    </pattern>
    
    <pattern id="text_id">
        <rule context="edirom:texts/edirom:text">
            <assert test="matches(./@xml:id, 'text-[0-9]+')">Die ID eines text-Elements muss dem Muster 'text-[0-9]+' folgen</assert>
        </rule>
    </pattern>
    
    <pattern id="facsimile_id">
        <rule context="edirom:facsimiles/edirom:facsimile">
            <assert test="matches(./@xml:id, 'facsimile-[0-9]+')">Die ID eines facsimile-Elements muss dem Muster 'facsimile-[0-9]+' folgen</assert>
        </rule>
    </pattern>
    
    <pattern id="barGroup_id">
        <rule context="edirom:bars/edirom:barGroup">
            <assert test="matches(./@xml:id, 'barGroup-[0-9]+')">Die ID eines barGroup-Elements muss dem Muster 'barGroup-[0-9]+' folgen</assert>
        </rule>
    </pattern>
    
    <pattern id="bar_id">
        <rule context="edirom:bars/edirom:bar">
            <assert test="matches(./@xml:id, 'bar-[0-9]+')">Die ID eines bar-Elements muss dem Muster 'bar-[0-9]+' folgen</assert>
        </rule>
    </pattern>
    
    <pattern id="source_id">
        <rule context="edirom:source">
            <assert test="matches(./@xml:id, 'source-[0-9]+')">Die ID eines source-Elements muss dem Muster 'source-[0-9]+' folgen</assert>
        </rule>
    </pattern>
    
    <pattern id="description_id">
        <rule context="edirom:description">
            <assert test="matches(./@xml:id, 'description-[0-9]+')">Die ID eines description-Elements muss dem Muster 'description-[0-9]+' folgen</assert>
        </rule>
    </pattern>
    
    <pattern id="layer_id">
        <rule context="edirom:source/edirom:layers/edirom:layer">
            <assert test="matches(./@xml:id, 'layer-[0-9]+')">Die ID eines layer-Elements muss dem Muster 'layer-[0-9]+' folgen</assert>
        </rule>
    </pattern>
    
    <pattern id="annotation_id">
        <rule context="edirom:annotation">
            <assert test="matches(./@xml:id, 'annotation-([0-9a-zA-Z]+-)?[0-9]+')">Die ID eines annotation-Elements muss dem Muster 'annotation-([0-9a-zA-Z]+-)?[0-9]+' folgen</assert>
        </rule>
    </pattern>
    
    <pattern id="work_id">
        <rule context="edirom:work">
            <assert test="matches(./@xml:id, 'work-[0-9]+')">Die ID eines work-Elements muss dem Muster 'work-[0-9]+' folgen</assert>
        </rule>
    </pattern>
    

    <pattern id="tei_TEI">
        <rule context="edirom:source/edirom:description|edirom:texts/edirom:text">
            <assert test="./tei:TEI">Der Text muss in einem vollständigen TEI-Dokument vorliegen.</assert>
        </rule>
    </pattern>
    
    <pattern id="any_tei">
        <rule context="edirom:source/edirom:description|edirom:texts/edirom:text">
            <assert test="not(./tei:*[@xml:lang] and ./tei:*[not(@xml:lang)])" xml:lang="de">Es müssen entweder alle tei-Elemente ein xml:lang-Attribut haben oder keines.</assert>
            <assert test="1 >= count(./tei:*[not(@xml:lang)])" xml:lang="de">Es darf nur ein tei-Element geben, ohne ein xml:lang-Attribut</assert>
            <assert test="count(./tei:*/@xml:lang) = count(distinct-values(./tei:*/@xml:lang))" xml:lang="de">Jede Sprache darf nur einmal vorkommen.</assert>
        </rule>
    </pattern>
    
    <pattern id="tei_date">
        <rule context="edirom:dating">
            <assert test="./tei:date" xml:lang="de">Innerhalb eines dating-Elements darf nur ein date-Element aus dem TEI-Namespace existieren</assert>
            <assert test="./tei:date/@when or ./tei:date/text() != ''">Entweder muss eine Datumsangabe als Textinhalt vorliegen, oderd as Attribut when muss enthalten sein und ein valides Datum angeben.</assert>
        </rule>
    </pattern>
    
    <pattern id="names">
        <rule context="edirom:names">
            <assert test="not(./edirom:name[@xml:lang] and ./edirom:name[not(@xml:lang)])" xml:lang="de">Es müssen entweder alle Elemente ein xml:lang-Attribut haben oder keines.</assert>
            <assert test="1 >= count(./edirom:name[not(@xml:lang)])" xml:lang="de">Es darf nur ein Element geben, ohne ein xml:lang-Attribut</assert>
            <assert test="count(./edirom:name/@xml:lang) = count(distinct-values(./edirom:name/@xml:lang))" xml:lang="de">Jede Sprache darf nur einmal vorkommen.</assert>
            
            <assert test="not(parent::node()/@name)" xml:lang="de">Es ist nicht möglich sowohl ein name-Attribut als auch ein names-Element zu nutzen</assert>
        </rule>
    </pattern>
    
    <pattern id="labels">
        <rule context="edirom:labels">
            <assert test="not(./edirom:label[@xml:lang] and ./edirom:label[not(@xml:lang)])" xml:lang="de">Es müssen entweder alle Elemente ein xml:lang-Attribut haben oder keines.</assert>
            <assert test="1 >= count(./edirom:label[not(@xml:lang)])" xml:lang="de">Es darf nur ein Element geben, ohne ein xml:lang-Attribut</assert>
            <assert test="count(./edirom:label/@xml:lang) = count(distinct-values(./edirom:label/@xml:lang))" xml:lang="de">Jede Sprache darf nur einmal vorkommen.</assert>
            
            <assert test="not(parent::node()/@label)" xml:lang="de">Es ist nicht möglich sowohl ein name-Attribut als auch ein names-Element zu nutzen</assert>
        </rule>
    </pattern>

    <pattern id="annotationsContent">
        <rule context="edirom:annotation/contents">
            <assert test="not(./edirom:content[@xml:lang] and ./edirom:content[not(@xml:lang)])" xml:lang="de">Es müssen entweder alle Elemente ein xml:lang-Attribut haben oder keines.</assert>
            <assert test="1 >= count(./edirom:content[not(@xml:lang)])" xml:lang="de">Es darf nur ein Element geben, ohne ein xml:lang-Attribut</assert>
            <assert test="count(./edirom:content/@xml:lang) = count(distinct-values(./edirom:content/@xml:lang))" xml:lang="de">Jede Sprache darf nur einmal vorkommen.</assert>
        </rule>
    </pattern>
    
    <pattern id="annotationParticipant">
        <rule context="edirom:annotation">
            <assert test="not(exists(./edirom:participants) and (exists(./@firstBar) or exists(./@lastBar) or exists(./@sources) or exists(./@part) or exists(./@voices)))" xml:lang="de">Es dürfen entweder Participants oder Attribute (@firstBar, @lastBar, etc.) angegeben werden</assert>
            <assert test="not(exists(./edirom:participants) and not(exists(./edirom:participants/child::*)))">Es muss mindestens ein Participant angegeben werden</assert>
            <assert test="not(exists(./edirom:participants) and not(exists(./edirom:names)))">Wenn Participants genutzt werden, muss ein Name für die Anmerkung vergeben werden</assert>
        </rule>
    </pattern>
    
    <pattern id="check_bar">
        <rule context="edirom:facsimileFlow/item|edirom:annotation[exists(@firtBar) or exists(@lastBar)]">
            <let name="firstBar" value="./@firstBar"/>
            <let name="lastBar" value="./@lastBar"/>
            <assert test="//edirom:bar[@name = $firstBar] or //edirom:barGroup[@name = $firstBar]">Der Start-Takt muss auf einen existierenden Takt verweisen</assert>
            <assert test="//edirom:bar[@name = $lastBar] or //edirom:barGroup[@name = $lastBar]">Der End-Takt muss auf einen existierenden Takt verweisen</assert>
        </rule>
    </pattern>
    
    <pattern id="name">
        <rule context="edirom:names/edirom:name">
            <assert test="string-length(./text()) > 0 or tei:persName">Es muss entweder ein Name oder ein tei:persName Element angegeben werden</assert>
        </rule>
    </pattern>
    
</schema>
