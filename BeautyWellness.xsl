<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
    <html>
        <head>
            <title>BeautyWellness Salon Menu</title>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <link rel="stylesheet" href="css/BeautyWellness.css" />
            <script type="text/javascript" src="js/BeautyWellness.js">x</script>
        </head>
            <body>
                <h2>
                    <img src="img/logo.gif" alt="BeautyWellness Logo" width="58" height="100" />Welcome to BeautyWellness Salon</h2>
                <p>Select your entrees from the menu below. To calculate the amount of the bill, click the Calculate Bill button. Check the "Highlight Vegetarian Meals" box to highlight vegetarian dishes.</p>
                <table id="menuTable" border="1" class="indent">
                    <thead>
                        <tr>
                            <th colspan="3">BeautyWellness Salon Menu</th>
                        </tr>
                        <tr>
                            <th>Select</th>
                            <th>Item</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="/salonmenu/section">
                            <tr>
                                <td colspan="3">
                                    <xsl:value-of select="@name" />
                                </td>
                            </tr>
                            <xsl:for-each select="entree">
                                <tr>
                                    <xsl:attribute name="male">
                                        <xsl:value-of select="boolean(@male)" />
                                    </xsl:attribute>
                                    <td align="center">
                                        <input name="item0" type="checkbox" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="item" />
                                    </td>
                                    <td align="right">
                                        <xsl:value-of select="price" />
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </xsl:for-each>
                    </tbody>
                </table>
                <form class="indent">
                    <p>
                        <input type="button" name="btnCalcBill" value="Calculate Bill" id="calcBill" />
                Total: €
                <input type="text" name="txtBillAmt" /><input type="checkbox" name="cbOpts" value="isMale" id="showMale" /><label for="showMale">Highlight available for Male Treatment</label></p>
                </form>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
