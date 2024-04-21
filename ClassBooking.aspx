<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClassBooking.aspx.cs" Inherits="OnlineClass.ClassBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Online Class Booking</title>
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
    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>

    <script type="text/javascript">
        function startTimer() {
            // Generate a random duration between 30 and 60 seconds
            var durationInSeconds = Math.floor(Math.random() * (60 - 30 + 1)) + 30;

            // Convert duration to milliseconds
            var durationInMilliseconds = durationInSeconds * 1000;

            // Start the countdown
            setTimeout(function () { updateCountdown(durationInSeconds); }, durationInMilliseconds);
        }

        function updateCountdown(durationInSeconds) {
            // Update the label text with the remaining time
            var lblCountdown = document.getElementById('<%= lblTimeLeft.ClientID %>');
            lblCountdown.innerText = "Time Left: " + durationInSeconds + " seconds";
        }
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
                            <li><a href="Cart.aspx" >Cart<i class="fa fa-shopping-cart"></i> </a></li>
                        </ul>
                        <ul class="right-nav">
                            
                            <li class="active"><a href="Default.aspx" ><i class="fa fa-sign-in"></i>Sign up </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <section>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            
            <div style="width:100%;height:auto; text-align:center; color:#FFA500;">  
                <table style="width:100%; height:auto; vertical-align:middle; text-align:center;">
                    <tr style="width:100%; height:auto; vertical-align:middle; text-align:center;">
                        <td style="width:40%"><h1 style="text-align:left;">Claim Your Free Trail Class</h1></td>
                        <td style="width:30%"><h3><asp:Label ID="lblFreeSeat" runat="server" style="text-align:right;" Text=""></asp:Label></h3></td>
                        <td style="width:30%"><h1><asp:Label ID="lblTimeLeft" runat="server" Text=""></asp:Label></h1></td>
                        
                    </tr>
                </table>
                
                
                
            </div>
            <asp:UpdatePanel ID="updj" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvClassSchedule" Width="100%" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvClassSchedule_RowDataBound" OnRowCommand="gvClassSchedule_RowCommand">
                    <HeaderStyle BackColor="Blue" BorderColor="Blue" ForeColor="White" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" Font-Size="X-Large" Height="20px" Width="200px" HorizontalAlign="Center" />

                        <Columns>
                            <asp:TemplateField HeaderText="ScheduleID"  Visible="false">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:TextBox ID="txtScheduleID" runat="server" Text='<%# Eval("ScheduleID") %>' Visible="false" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="SubjectsID"  Visible="false">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:TextBox ID="txtSubjectsID" runat="server" Text='<%# Eval("SubjectsID") %>' Visible="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subjects" >
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label ID="txtSubjects" runat="server" Text='<%# Eval("Subjects") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Weekday" ItemStyle-HorizontalAlign="Center" HeaderText="Weekday"  />
                            <asp:BoundField DataField="ClassDate" ItemStyle-HorizontalAlign="Center" HeaderText="ClassDate"  />
                            <asp:BoundField DataField="Time" ItemStyle-HorizontalAlign="Center" HeaderText="Time"  />
                            <asp:BoundField DataField="AvailableSeats" ItemStyle-HorizontalAlign="Center" HeaderText="AvailableSeats"  />

                            <asp:TemplateField>
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Button ID="btnBook" CssClass="btn" Text='Book Now' runat="server" CommandName="BookNow" CommandArgument="<%# Container.DataItemIndex %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>


        </div>
    </form>
        </section>
</body>
</html>
