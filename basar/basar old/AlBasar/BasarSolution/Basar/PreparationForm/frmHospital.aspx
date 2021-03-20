<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="frmHospital.aspx.cs" Inherits="Basar.PreparationForm.frmHospital" %>

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
                    المستشفيات
               
                </div>
                <div class="panel-body">
                    <div class="row">

                        <div class="col-lg-1">
                        </div>
                        <div class="col-lg-2">
                             <div class="input-group div_padding">
                                <label for="" class="control-label">الدولة</label>
                            </div>
                            <div class="input-group div_padding">
                                <label for="" class="control-label">المستشفى</label>
                            </div>
                            <div class="input-group div_padding">
                                <label for="" class="control-label">رقم الجوال</label>
                            </div>
                             <div class="input-group div_padding">
                                <label for="" class="control-label" >البريد الالكتروني</label>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="input-group custom-search-form div_padding">
                                <asp:DropDownList ID="ddlCountries" runat="server"   CssClass="form-control"></asp:DropDownList>
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <i class="fa fa-android"></i>
                                    </button>
                                </span>
                            </div>
                            <div class="input-group custom-search-form div_padding">
                                <asp:TextBox ID="txtSponsorName" runat="server" placeholder="المستشفى" CssClass="form-control"></asp:TextBox>
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <i class="fa fa-android"></i>
                                    </button>
                                </span>
                            </div>
                            <div class="input-group custom-search-form div_padding">
                                <asp:TextBox ID="txtSponsorMobile" runat="server" placeholder="الجوال" CssClass="form-control"></asp:TextBox>
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <i class="fa fa-mobile"></i>
                                    </button>
                                </span>
                            </div>
                            <div class="input-group custom-search-form div_padding">
                                <asp:TextBox ID="txtSponsorEmail" runat="server" placeholder="البريد الالكتروني" CssClass="form-control"></asp:TextBox>
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <i class="fa fa-mail-forward"></i>
                                    </button>
                                </span>
                            </div>
                            <div class="input-group  div_padding">
                                <span class="input-group-btn">
                                    <asp:Button ID="btnNew" runat="server" Text="جديد" CssClass="btn btn-primary" />
                                    <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn btn-primary" />
                                </span>
                            </div>
                        </div>
                        <div class="col-lg-4">
                        </div>
                        <div class="col-lg-1">
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
                    تسجيل المستشفيات بالدول
                       
                </div>
            </div>
        </div>

    </div>
</asp:Content>
