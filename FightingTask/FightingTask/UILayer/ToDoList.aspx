<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ToDoList.aspx.cs" Inherits="FightingTask.UILayer.ToDoList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 100%;
        }
        .auto-style21 {
            width: 86px;
            height: 23px;
        }
        .auto-style27 {
            width: 166px;
            height: 23px;
        }
        .auto-style30 {
            height: 23px;
            width: 82px;
        }
        .auto-style33 {
            width: 35px;
            height: 23px;
        }
        .auto-style25 {
            width: 260px;
            height: 23px;
        }
        .auto-style26 {
            width: 32px;
            height: 23px;
        }
        .auto-style14 {
            width: 86px;
        }
        .auto-style8 {
            height: 36px;
            width: 166px;
        }
        .auto-style31 {
            width: 82px;
        }
        .auto-style34 {
            width: 35px;
        }
        .auto-style2 {
            width: 260px;
        }
        .auto-style4 {
            width: 32px;
        }
        .auto-style6 {
            height: 38px;
            width: 166px;
        }
        .auto-style7 {
            height: 110px;
            width: 166px;
        }
        .auto-style28 {
            width: 166px;
        }
        .auto-style29 {
            width: 86px;
            height: 30px;
        }
        .auto-style17 {
            height: 30px;
            width: 166px;
        }
        .auto-style32 {
            width: 82px;
            height: 30px;
        }
        .auto-style35 {
            width: 35px;
            height: 30px;
        }
        .auto-style37 {
            margin-left: 0px;
        }
        .auto-style38 {
            width: 47px;
            height: 30px;
        }
        .auto-style10 {
            text-align: left;
            height: 30px;
        }
        .auto-style13 {
            width: 32px;
            height: 30px;
        }
        .auto-style39 {
            width: 86px;
            height: 40px;
        }
        .auto-style40 {
            width: 166px;
            height: 40px;
        }
        .auto-style41 {
            width: 82px;
            height: 40px;
        }
        .auto-style42 {
            width: 35px;
            height: 40px;
        }
        .auto-style43 {
            width: 260px;
            height: 40px;
        }
        .auto-style44 {
            width: 32px;
            height: 40px;
        }
        .auto-style45 {
            font-size: xx-large;
        }
        .auto-style46 {
            height: 23px;
        }
        </style>
</head>
<body>
    <form id="form2" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style46" colspan="7"><strong>
                    <asp:Label ID="Label3" runat="server" ForeColor="#FF3399" Text="Todo Application" CssClass="auto-style45" Font-Size="70pt" Width="799px"></asp:Label>
                        </strong></td>
            </tr>
            <tr>
                <td class="auto-style46" colspan="7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14" rowspan="3">&nbsp;</td>
                <td class="auto-style8">
                    <h1><strong>
                    <asp:Label ID="Label1" runat="server" ForeColor="#FF3399" Text="Categories"></asp:Label>
                        </strong></h1>
                </td>
                <td rowspan="3" class="auto-style31">&nbsp;</td>
                <td rowspan="3" class="auto-style34" colspan="2">
                    <asp:Calendar ID="Calendar1" runat="server" Height="250px" Width="330px"  SelectedDate="<%# DateTime.Now %>" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" NextPrevFormat="ShortMonth">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                        <DayStyle BackColor="#CCCCCC" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                        <TodayDayStyle BackColor="#999999" ForeColor="White" />
                    </asp:Calendar>
                </td>
                <td class="auto-style2" rowspan="3">
                    &nbsp;</td>
                <td class="auto-style4" rowspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:DropDownList ID="ddl_category" runat="server" Height="43px" Width="137px" OnSelectedIndexChanged="ddl_category_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style39"></td>
                <td class="auto-style40">
                    <h1>
                    <asp:Label ID="Label2" runat="server" ForeColor="#FF3399" Text="ToDoList"></asp:Label>
                    </h1>
                </td>
                <td class="auto-style41"></td>
                <td class="auto-style42" colspan="2">&nbsp;</td>
                <td class="auto-style43">
                    <asp:Label ID="calStatus_lbl" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style44"></td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style28">
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" Font-Bold="True" Font-Size="20pt" Height="201px" Width="134px" AutoPostBack="True" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
                    </asp:CheckBoxList>
                </td>
                <td class="auto-style31">&nbsp;</td>
                <td class="auto-style34" colspan="2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style28">
                    <asp:ListBox ID="Del_List_Box" runat="server" Width="138px" OnSelectedIndexChanged="Del_List_Box_SelectedIndexChanged"></asp:ListBox>
                </td>
                <td class="auto-style31">&nbsp;</td>
                <td class="auto-style34" colspan="2">&nbsp;</td>
                <td class="auto-style2">
                    <h1>&nbsp;</h1>
                </td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style21"></td>
                <td class="auto-style27">
                    <asp:Button ID="del_btn" runat="server" Font-Bold="True" Font-Size="30px" Height="49px" Text="Delete" Width="138px" OnClick="del_btn_Click" />
                </td>
                <td class="auto-style30"></td>
                <td class="auto-style33" colspan="2"></td>
                <td class="auto-style25"></td>
                <td class="auto-style26"></td>
            </tr>
            <tr>
                <td class="auto-style21">&nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style30">&nbsp;</td>
                <td class="auto-style33" colspan="2">&nbsp;</td>
                <td class="auto-style25">&nbsp;</td>
                <td class="auto-style26">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style29"></td>
                <td class="auto-style17">
                    <asp:Button ID="convert_mode_btn" runat="server" Font-Bold="True" Font-Size="18pt" Height="44px" OnClick="convert_mode_btn_Click" Text="Convert To Delete Mode" Width="317px" />
                </td>
                <td class="auto-style32"></td>
                <td class="auto-style35">
                    <asp:TextBox ID="ToDoList_txtbox" runat="server" CssClass="auto-style37" Height="41px" Width="141px"></asp:TextBox>
                </td>
                <td class="auto-style35">
                    <asp:Button ID="add_btn" runat="server" Text="Add" Font-Bold="True" Font-Size="30px" Width="94px" OnClick="add_btn_Click" />
                </td>
                <td class="auto-style38">
                    <asp:Label ID="lbl_status" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style13"></td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style28">&nbsp;</td>
                <td class="auto-style31">&nbsp;</td>
                <td class="auto-style34" colspan="2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style28">&nbsp;</td>
                <td class="auto-style31">&nbsp;</td>
                <td class="auto-style34" colspan="2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            
        </table>
    </form>
   
</body>
</html>
