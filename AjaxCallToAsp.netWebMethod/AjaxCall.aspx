<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AjaxCall.aspx.cs" Inherits="AjaxCallToAsp.netWebMethod.AjaxCall" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/jquery-2.1.4.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

    <script type="text/javascript">
        $(function () {
            $('#spanClick').click(function () {
                console.log("spanClick");

                var num = $('#<%=txtName.ClientID%>').val();
                var ajaxResult = $.ajax({
                    type: "POST",
                    url: "AjaxCall.aspx/AjaxCallbyjquery",
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
           
            var num = $('#ContentPlaceHolder1_txtNumber').val();
            var flag;
            $.ajax({
                type: "POST",
                url: "AjaxCall.aspx/AjaxCallbyjquery",
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
                var lenCount = $('#mySpan').length;
                if (lenCount > 0) {
                    $('#mySpan').remove();
                    
                    $('<span id="mySpan">false</span>').insertAfter('#<%=btnSubmit.ClientID %>');
                }
                else {
                    $('<span id="mySpan">false</span>').insertAfter('#<%=btnSubmit.ClientID %>');
                }
                return false;
            }
        }
    </script>
</asp:Content>
