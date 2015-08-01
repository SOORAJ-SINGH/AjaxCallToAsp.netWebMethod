<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AjaxCallToAsp.netWebMethod.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ajax call to the web Method on clicking the Button userControl</title>
    <script src="Scripts/jquery-2.1.4.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Ajax call to the web Method on clicking the Button userControl</h2>

        <div>
            <table>
                <tr>
                    <td>Name:
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Number:
                    </td>
                    <td>
                        <asp:TextBox ID="txtNumber" runat="server"></asp:TextBox>form submitted only if number is  5
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" OnClientClick="return CallWebMethod()"></asp:Button>
                        <span id="spanClick">Click</span>
                    </td>
                </tr>

            </table>
        </div>
    </form>


    <script type="text/javascript">
        $(function () {
            $('#spanClick').click(function () {
                console.log("spanClick");

                var num = $('#<%=txtName.ClientID%>').val();
                var ajaxResult = $.ajax({
                    type: "POST",
                    url: "Default.aspx/AjaxCall",
                    data: '{num: "' + num + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (msg) {
                        // On success
                        alert(msg);
                        return false;

                    },
                    Error: function (x, e) {
                        // On Error
                        alert(e);
                    }

                });
            });

        });
        function CallWeb() {
            console.log('in callWeb');
            if ($('#<%= txtNumber.ClientID%>').val() == '5') {
                console.log('true');
                return true
            }
            else {
                console.log('false');
                return false;
            }
        }

        function CallWebMethod() {
            console.log('in callWebMethod');

            var num = $('#<%=txtNumber.ClientID%>').val();
            var flag;
            $.ajax({
                type: "POST",
                url: "Default.aspx/AjaxCall",
                data: '{num: "' + num + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    // On success
                    alert(data.d);
                    flag = data.d;
                    //return true;

                },
                Error: function (x, e) {
                    // On Error
                    alert(e);
                }

            });


            if (flag == 'true') {
                return true;
            }
            else {
                return false;
            }
        }
    </script>
</body>
</html>
