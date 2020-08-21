<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FightingTask.UILayer.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

table{border-collapse:collapse;border-spacing:0;}
table{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline;}
tbody{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline;}
tr{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline;}
td{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline;}
strong{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline;}
        .auto-style1 {
            width: 100%;
        }
        .auto-style46 {
            height: 23px;
        }
        .auto-style45 {
            font-size: xx-large;
        }
        .auto-style47 {
            text-align: center;
        }
    </style>
</head>
<body>
    <table class="auto-style1">
        <tr>
            <td>&nbsp;</td>
            <td>
        <table class="auto-style1">
            <tr>
                <td class="auto-style46"><strong>
                    <asp:Label ID="Label3" runat="server" ForeColor="#FF3399" Text="Todo Application" CssClass="auto-style45" Font-Size="70pt" Width="799px"></asp:Label>
                        </strong></td>
            </tr>
            
        </table>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
    <form id="form1" runat="server">
        <div>
            <table align="center" style="width: 761px; height: 628px; margin-left: 0">
                <tr>
                    <td style="width: 312px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 312px">&nbsp;If you have an account with us, please log in.<br />
                        <br />
                        <strong>Email Address</strong><br />
                        <br />
                        <asp:TextBox ID="txt_mail" runat="server" Height="35px" TextMode="Email" Width="306px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 312px">
                        <br />
                        <strong>Password</strong><br />
                        <br />
                        <asp:TextBox ID="txt_pass" runat="server" Height="35px" TextMode="Password" Width="306px"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="width: 312px">
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="btn_login" runat="server" BackColor="#666666" BorderStyle="None" ForeColor="White" Height="33px" OnClick="btn_login_Click" Style="border-radius:15px;border:hidden" Text="Log in" Width="137px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="width: 312px">
                        <br />
                        &nbsp;
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="width: 312px">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style47">
                <h2>
                    <asp:Label ID="Label4" runat="server" Text="All rights reserved to pianola "></asp:Label>
                </h2>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</body>
</html>
