<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="cd">
        <html>
            <head>
                <title>CD</title>
                <style>
                    table{
                    border-collapse:collapse;
                    width:30%;
                    }
                    th, td{
                    padding:8px;
                    text-align:left;
                    }
                    th{
                    background-color: green;
                    color: white;
                    font-weight:bold;
                    font-size:20px;
                    }
                    h1, h2, p{
                    background-color:#065381;
                    font-weight:bold;
                    width:30%;
                    color: white;
                    }
                    tr:nth-child(even){background-color:#B0C4DE;}
                    tr:nth-child(odd){background-color:#D2B48C;}
                </style>
            </head>
            <body bgcolor="#9da3a6">
                <xsl:apply-templates/>
                <p class="p">Total Number of Tracks: <xsl:value-of select="count(tracklist/track)"/></p>
                <p class="p">Average Track Rating: <xsl:value-of select="sum(tracklist/track/rating) div count(tracklist/track)" /></p>
            </body>
        </html>
    </xsl:template>
    <!-- Specify the cascading XSL template rules -->
    <xsl:template match="cd/title">
        <h1 style="text-align:center">    
            <img style="float:left" src="star.gif" width="40"/>       
            <xsl:apply-templates/>  
            <img style="float:right" src="star.gif" width="40"/>          
        </h1>
    </xsl:template>
    <xsl:template match="cd/artist">        
        <h2>            
            <xsl:apply-templates/>
            <xsl:text >&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:text> 
            <img style="float:left" src="star.gif" width="40"/>    
            <img src="elvis.png" width="60" height="100"/>	
            <img style="float:right" src="star.gif" width="40"/>
        </h2>
    </xsl:template>
    <xsl:template match="tracklist">
        <table>
            <thead>
                <th>ID</th>
                <th>TITLE</th>
                <th>TIME</th>
                <th>RATING</th>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="track">
        <tr>
            <td><xsl:value-of select="@id"/></td>
            <td><xsl:value-of select="title"/></td>
            <td><xsl:value-of select="time"/></td>
            <td>
                <div style="width:100px;background:white;height:12px;">
                    <div style="width:{20*rating}px;background:green;height:12px;"></div>                    
                </div>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
