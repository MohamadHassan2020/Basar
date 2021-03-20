<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="frmCountry.aspx.cs" Inherits="Basar.AdminForm.frmCountry" %>

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
                    الدول
                </div>
                <div class="panel-body">
                    <asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-lg-3">
                                </div>
                                <div class="col-lg-6">
                                    <div class="input-group div_padding">
                                        <label for="">الدولة</label>
                                    </div>
                                    <div class="input-group custom-search-form">
                                        <asp:TextBox ID="txtCountryDesc" runat="server" placeholder="إسم الدولة" CssClass="form-control"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">
                                                <i class="fa fa-bicycle"></i>
                                            </button>
                                        </span>
                                    </div>
                                    <div class="input-group div_padding">
                                        <label for="">Country</label>
                                    </div>
                                    <div class="input-group custom-search-form">
                                        <asp:TextBox ID="txtCountryDescEn" runat="server" placeholder="Country Name" CssClass="form-control"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">
                                                <i class="fa fa-android"></i>
                                            </button>
                                        </span>
                                    </div>
                                    <div class="input-group text-danger">
                                        <label for="">الرحلة</label>
                                    </div>
                                    <div class="input-group custom-search-form">
                                        <asp:DropDownList ID="ddlToure" runat="server" CssClass="form-control" DataTextField="TourDsecAr" DataValueField="TourId"></asp:DropDownList>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">
                                                <i class="fa fa-save"></i>
                                            </button>
                                        </span>
                                    </div>
                                    <div class="input-group div_padding">
                                        <label for="">رمز الدولة</label>
                                    </div>
                                    <div class="input-group custom-search-form">
                                        <asp:TextBox ID="txtCountryCode" runat="server" placeholder="رمز الدولة" CssClass="form-control"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">
                                                <i class="fa fa-android"></i>
                                            </button>
                                        </span>
                                    </div>
                                    <div class="input-group div_padding">
                                        <label for="">الحالة</label>
                                    </div>
                                    <div class="input-group custom-search-form">
                                        <asp:RadioButtonList ID="rblCountryStatus" runat="server" CssClass="form-control" RepeatDirection="Horizontal" Style="width: 100%" RepeatColumns="2">
                                            <asp:ListItem Value="true" Text="نشط"></asp:ListItem>
                                            <asp:ListItem Value="false" Text="غير نشط"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="rfvrblCountryStatus" runat="server" CssClass="text-danger" ErrorMessage="حالة الدولة" Display="Dynamic" SetFocusOnError="True" ToolTip=" حالة الدولة" Text="*" ControlToValidate="rblCountryStatus"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="input-group  div_padding">
                                        <span class="input-group-btn">
                                            <asp:Button ID="btnNew" runat="server" Text="جديد" CssClass="btn btn-primary" OnClick="btnNew_Click" CausesValidation="false" />
                                            <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                                        </span>
                                    </div>
                                </div>

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
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="panel-footer">
                    تسجيل الدول المستفاده من مؤسسة البصر  العالمية
                       
                </div>
            </div>
        </div>

    </div>
</asp:Content>
