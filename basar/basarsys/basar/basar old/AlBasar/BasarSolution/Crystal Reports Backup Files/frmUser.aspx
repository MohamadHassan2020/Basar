<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="frmUser.aspx.cs" Inherits="Basar.AdminForm.frmUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row div_padding">
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div class="col-lg-10">
            <div class="panel panel-primary div_shadow">
                <div class="panel-heading">
                    المستخدمون
               
                </div>
                <div class="panel-body">
                    <div class="row">

                        <div class="col-lg-3">
                        </div>

                        <div class="col-lg-6">
                            <asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>

                                    <div class="input-group">
                                        <label for="">إسم المستخدم</label>
                                    </div>
                                    <div class="input-group custom-search-form">

                                        <asp:TextBox ID="txtUserName" runat="server" placeholder="إسم المستخدم" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">
                                                <i class="fa fa-android"></i>
                                            </button>
                                        </span>
                                    </div>
                                    <div class="input-group custom-search-form">
                                        <label for="">رمز الدخول</label>
                                    </div>
                                    <div class="input-group custom-search-form">
                                        <asp:TextBox ID="txtUserCode" runat="server" placeholder="رمز الدخول" CssClass="form-control" MaxLength="20"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">
                                                <i class="fa fa-android"></i>
                                            </button>
                                        </span>
                                    </div>
                                    <div class="input-group custom-search-form">
                                        <label for="">البريد الالكتروني</label>
                                    </div>
                                    <div class="input-group custom-search-form">
                                        <asp:TextBox ID="txtUserEmail" runat="server" placeholder="البريد الالكتروني" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">
                                                <i class="fa fa-android"></i>
                                            </button>
                                        </span>
                                    </div>
                                    <div class="input-group custom-search-form">
                                        <label for="">كلمة المرور</label>
                                    </div>
                                    <div class="input-group custom-search-form">
                                        <asp:TextBox ID="txtUserPassword" runat="server" placeholder="كلمة المرور" CssClass="form-control" MaxLength="50" TextMode="Password"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">
                                                <i class="fa fa-android"></i>
                                            </button>
                                        </span>
                                    </div>
                                    <div class="input-group custom-search-form">
                                        <label for="">تأكيد كلمة المرور</label>
                                    </div>
                                    <div class="input-group custom-search-form">
                                        <asp:TextBox ID="txtUserPasswordConfirm" runat="server" placeholder="تأكيد كلمة المرور" CssClass="form-control" MaxLength="50" TextMode="Password"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">
                                                <i class="fa fa-android"></i>
                                            </button>
                                        </span>
                                    </div>
                                    <div class="input-group  div_padding">
                                        <span class="input-group-btn">
                                            <asp:Button ID="btnNew" runat="server" Text="جديد" CssClass="btn btn-primary" />
                                            <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                                        </span>
                                    </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="col-lg-3">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                            </div>
                            <div class="col-lg-6 div_padding">
                            </div>
                            <div class="col-lg-3">
                            </div>
                        </div>
                    </div>
                <div class="panel-footer">
                    تسجيل الدول المستفاده من مؤسسة البصر  العالمية
                       
                </div>
            </div>
        </div>

    </div>
</asp:Content>
