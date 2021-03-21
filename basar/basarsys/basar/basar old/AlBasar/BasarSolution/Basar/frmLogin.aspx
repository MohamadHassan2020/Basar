<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="Basar.frmLogin" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="google-site-verification" content="2CmPxty4pllQHVdHaJS_0IEH5WjlUYFTwHqrCNrNdGk" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>مؤسسة البصر  العالمية</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="css/sb-admin-2.css" rel="stylesheet" />
    <link href="css/style_mh.css" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
</head>
<body>
    <div class="container">
        <div class="row">

            <div class="col-md-4 col-md-offset-4">

                <div class="login-panel panel panel-default  div_shadow">
                    <img src="images/logo_1.jpeg" style="width: 150px; height: 120px" class="img-circle center-block" />


                    <div class="panel-body">

                        <form role="form" id="frmLogin" runat="server">
                            <fieldset>
                                <div class="form-group">
                                    <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" required="required" placeholder="المستخدم" TextMode="Password" autofocus="autofocus"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" required="required" TextMode="Password" placeholder="كلمة المرور"></asp:TextBox>
                                </div>
                                <div class="btn-group">
                                        <asp:CheckBox ID="cbRemmember" runat="server" CssClass="control-label"  Text="تذكر بياناتي"></asp:CheckBox>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <asp:Button ID="btnlogin" runat="server" class="btn btn-lg btn-success btn-block login_header text-right" Text="دخول" OnClick="btnlogin_Click" />
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>

</html>

