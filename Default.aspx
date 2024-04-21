﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineClass.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Lora&family=Yeseva+One&display=swap");

        * {
            --hibiscus-love: #fc465c;
            --fine-ii: #f9b198;
            --afl: #fac8af;
            --mexican-sky: #cfdddd;
            --brasillia-peach: #facb85;
            --free: #33032d;
            --captured: #2b2120;
            --primary-color: var(--brasillia-peach);
            --secondary-color: var(--hibiscus-love);
            --tertiary-color: var(--fine-ii);
            --quadrary-color: var(--afl);
            --bg-color: var(--mexican-sky);
            --text-color: var(--free);
            --header-color: var(--captured);
            --error-color: var(--hibiscus-love);
            --success-color: #73d12e;
            box-sizing: border-box;
        }

        h1,
        h2,
        h3,
        h4,
        h5 {
            font-family: "Yeseva One", Georgia, cursive;
            color: var(--header-color);
        }

        body {
            font-family: "Lora", "Times New Roman", serif;
            background-color: var(--bg-color);
            color: var(--free);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-flow: column nowrap;
            min-height: 100vh;
        }

        .container {
            width: 400px;
            border-radius: 0.6em;
            padding: 20px;
            background-color: var(--primary-color);
            box-shadow: 20px 20px 60px #97a1a1, -20px -20px 60px #ffffff;
            margin: 20px auto;
        }

        .form {
            padding: 30px 40px;
        }

            .form h2 {
                text-align: center;
                margin: 0 0 20px;
            }

        .form-control {
            margin-bottom: 10px;
            padding-bottom: 20px;
            position: relative;
        }

            .form-control label {
                color: var(--text-color);
                display: block;
                margin-bottom: 5px;
            }

            .form-control .input {
                border-radius: 6px;
                background: var(--primary-color);
                box-shadow: inset 3px 3px 7px #e9bd7c, inset -3px -3px 7px #ffd98e;
                min-height: 2.618em;
                border: var(--quadrary-color) solid 2px;
                display: block;
                width: 100%;
                font-size: 14px;
                padding: 10px;
            }

                .form-control .input:focus {
                    outline: 0;
                    border-color: var(--tertiary-color);
                }

            .form-control.success .input {
                border-color: var(--success-color);
            }

            .form-control.error .input {
                border-color: var(--error-color);
            }

            .form-control small {
                color: var(--error-color);
                position: absolute;
                bottom: 0;
                left: 0;
                visibility: hidden;
            }

            .form-control.error small {
                visibility: visible;
            }

        .form .button {
            cursor: pointer;
            background: var(--secondary-color);
            box-shadow: 4px 4px 8px #c19c66, -4px -4px 8px #fffaa4;
            border: 1px solid #ec263c66;
            color: #fff;
            font-size: 16px;
            padding: 0.618em 1.2em;
            border-radius: 0.4em;
            font-family: "Yeseva One", Georgia, cursive;
            display: block;
            margin-top: 1.2em;
            width: 100%;
        }

            .form .button:active,
            .form .button:focus {
                outline: 0;
                background-color: #fc364c;
            }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <asp:Panel ID="pnlregister" runat="server">
        <div class="container">
            <div id="form" class="form">
                <h2>New User/Register!</h2>
                <div class="form-control">
                    <label for="username">Username</label>
                    <asp:TextBox id="txtUsername" CssClass="input" runat="server" placeholder="Enter username"></asp:TextBox>                    
                </div>
                <div class="form-control">
                    <label for="email">Email</label>
                    <asp:TextBox id="txtEmail" CssClass="input" runat="server" placeholder="Enter email"></asp:TextBox>
                </div>
                <div class="form-control">
                    <label for="password">Password</label>
                    <asp:TextBox id="txtpassword" CssClass="input" runat="server" placeholder="Enter password"></asp:TextBox>
                </div>
                <div class="form-control">
                    <label for="password2">Confirm password</label>
                    <asp:TextBox id="txtpassword2" CssClass="input" runat="server" placeholder="Renter your password"></asp:TextBox>

                </div>
                <asp:Button id="BtnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click"  CssClass="button" />
                <asp:Button ID="btnLogin" runat="server" Text="Alreay register/Login" OnClick="btnLogin_Click" CssClass="button" />
            </div>
        </div>
    </asp:Panel>
            <asp:Panel ID="pnlLogin" runat="server">
        <div class="container">
            <div id="form1" class="form">
                <h2>Login!</h2>
                <div class="form-control">
                    <label for="username">Username</label>
                    <asp:TextBox id="txtuser" CssClass="input" runat="server" placeholder="Enter username"></asp:TextBox>                    
                </div>
                <div class="form-control">
                    <label for="password">Password</label>
                    <asp:TextBox id="txtpass" CssClass="input" runat="server" placeholder="Enter password"></asp:TextBox>
                </div>
                <asp:Button id="btnLogin1" runat="server" Text="Login" OnClick="btnLogin1_Click"  CssClass="button" />
            </div>
        </div>
    </asp:Panel>

    </form>


</body>

</html>
