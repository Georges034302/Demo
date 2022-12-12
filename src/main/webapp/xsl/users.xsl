<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="5.0">
    <xsl:output method="html"/>
    <xsl:template match="users">
        <html>
            <head>
                <title>Admin View</title>
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
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="users">
        <table>
            <thead>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Date of Birth</th>
                <th>Blogs</th>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="/users/user">
        <tr>
            <td><xsl:value-of select="ID"/></td>
            <td><xsl:value-of select="name"/></td>
            <td>
                <xsl:variable name="emailurl" select="email"></xsl:variable>
                <a href="http://localhost:8080/demo/account.jsp?email={$emailurl}">
                    <xsl:value-of select="email"/>
                </a>
            </td>
            <td><xsl:value-of select="DOB"/></td>
            <td><xsl:value-of select="count(blogs/blog)"/></td>
        </tr>        
    </xsl:template>
</xsl:stylesheet>
