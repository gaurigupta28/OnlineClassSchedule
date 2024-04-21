<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subjects.aspx.cs" Inherits="OnlineClass.Subjects" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Class</title>
    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="Style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".mob-menu span").click(function () {
                $(".main-menu").slideToggle();
            });
        });

    </script>
</head>
<body>
    <header>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-lg-12 col-xl-3">
                    <div class="logo">
                        <a href="/" title="logo">Class Schedule</a>
                    </div>
                    <div class="mob-menu">
                        <span>
                            <i class="fa fa-bars"></i>
                        </span>
                    </div>
                </div>
                <div class="col-md-12 col-sm-12 col-lg-12 col-xl-9">
                    <div class="main-menu">
                        <ul class="nav">
                            <li><a href="Subjects.aspx">Home </a></li>
                            <li><a href="Cart.aspx" >Cart <i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                        <ul class="right-nav">
                            <li class="active"><a href="Default.aspx"><i class="fa fa-sign-in"></i>Sign up </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <section>
        <form id="form1" runat="server">
            <div>
                <asp:GridView ID="gvClassSchedule" runat="server" AutoGenerateColumns="false" OnRowCommand="gvClassSchedule_RowCommand" Width="100%"> 

                    <HeaderStyle BackColor="Blue" BorderColor="Blue" ForeColor="White" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" Font-Size="X-Large" Height="20px" Width="200px" HorizontalAlign="Center" />

                    <Columns>
                        <asp:TemplateField HeaderText="Id" Visible="false">
                            
                            <ItemTemplate>
                                <asp:TextBox ID="txtId" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Subjects" ItemStyle-HorizontalAlign="Center"  HeaderText="Subjects" />
                        <asp:BoundField DataField="Days" ItemStyle-HorizontalAlign="Center" HeaderText="Days" />
                        <asp:BoundField DataField="Time" ItemStyle-HorizontalAlign="Center" HeaderText="Time" />
                        <asp:TemplateField>
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Button Text='Book Now'  CssClass="btn" runat="server" CommandName="BookNow" CommandArgument="<%# Container.DataItemIndex %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </form>
    </section>
</body>
</html>
