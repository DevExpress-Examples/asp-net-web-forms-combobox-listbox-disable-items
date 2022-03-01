<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Solution.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to disabled items in a ListBox or ComboBox</title>
    <style type="text/css">
        .disabled {
            pointer-events: none;
            color: silver;
        }
    </style>
    <script type="text/javascript">
        var enabledState = true;

        function enableItems(editor, enable) {
            for (i = 0; i < editor.GetItemCount(); i++) {
                if (editor.GetItem(i).value % 2 == 0)//Your custom codition here
                    if (enable)
                        editor.RemoveItemCssClass(i, 'disabled');//Enable Item
                    else
                        editor.AddItemCssClass(i, 'disabled'); //Disable item
            }
        }

        function onInit(s, e) {
            enableItems(s, false); 
        }

        function onClick(s, e) {
            enableItems(listbox, enabledState)
            enableItems(cmb, enabledState)
            enabledState = !enabledState;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td style="width: 150px">
                        <h3>ListBox</h3>
                        <dx:ASPxListBox ID="ASPxListBox1" ClientInstanceName="listbox" runat="server" ValueType="System.String" SelectionMode="CheckColumn" Width="100%">
                            <Items>
                                <dx:ListEditItem Text="Item 1" Value="1" />
                                <dx:ListEditItem Text="Item 2" Value="2" />
                                <dx:ListEditItem Text="Item 3" Value="3" />
                                <dx:ListEditItem Text="Item 4" Value="4" />
                                <dx:ListEditItem Text="Item 5" Value="5" />
                            </Items>
                            <ClientSideEvents Init="onInit" />
                        </dx:ASPxListBox>
                    </td>
                    <td style="width: 150px"></td>
                    <td style="width: 150px">
                            <h3>ComboBox</h3>
                            <dx:ASPxComboBox ID="ASPxComboBox1" ClientInstanceName="cmb" runat="server" ValueType="System.String" Width="100%">
                            <Items>
                                <dx:ListEditItem Text="Item 1" Value="1" />
                                <dx:ListEditItem Text="Item 2" Value="2" />
                                <dx:ListEditItem Text="Item 3" Value="3" />
                                <dx:ListEditItem Text="Item 4" Value="4" />
                                <dx:ListEditItem Text="Item 5" Value="5" />
                            </Items>
                            <ClientSideEvents Init="onInit" />
                        </dx:ASPxComboBox>
                    </td>
                </tr>
            </table>
            <br />
            <dx:ASPxButton ID="enableBtn" runat="server" Text='Enable/Disable "Even" Items' AutoPostBack="false">
                <ClientSideEvents Click="onClick" />
            </dx:ASPxButton>
        </div>
    </form>
</body>
</html>
