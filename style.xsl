<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/aeroport">
        <html>
            <head>
                <title>Informations de l'Aéroport</title>
                <style>
                    body { font-family: Arial, sans-serif; }
                    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
                    th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                    h1 { text-align: center; }
                </style>
            </head>
            <body>
                <h1>Informations des Vols</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Compagnie</th>
                            <th>Date</th>
                            <th>Heure de départ</th>
                            <th>Heure d'arrivée</th>
                            <th>Type d'avion</th>
                            <th>Numéro de piste</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="infrastructures/compagniesAeriennes/compagnie"/>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="compagnie">
        <xsl:apply-templates select="avions/avion/vols/vol"/>
    </xsl:template>
    
    <xsl:template match="vol">
        <tr>
            <td>
                <xsl:value-of select="../nom"/>
            </td>
            <td>
                <xsl:value-of select="depart/date"/>
            </td>
            <td>
                <xsl:value-of select="depart/heure"/>
            </td>
            <td>
                <xsl:value-of select="arrivee/heure"/>
            </td>
            <td>
                <xsl:value-of select="../modele"/>
            </td>
            <td>
                <xsl:value-of select="piste/numero"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>