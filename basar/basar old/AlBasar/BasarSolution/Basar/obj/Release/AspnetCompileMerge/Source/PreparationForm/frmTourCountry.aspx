<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="frmTourCountry.aspx.cs" Inherits="Basar.PreparationForm.frmTourCountry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div class="col-lg-10">
            <div class="panel panel-primary div_shadow">
                <div class="panel-heading">
                    دول الرحلة
                </div>
                <div class="panel-body">
                    <asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="form-horizontal">
                                <hr />
                                <asp:ValidationSummary runat="server" CssClass="text-danger" />
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <asp:Label runat="server" AssociatedControlID="cblTour" CssClass="control-label label_red">الرحلة</asp:Label>
                                        <asp:CheckBoxList ID="cblTour" runat="server" CssClass="control-label text-danger" DataTextField="TourDsecAr" DataValueField="TourId" Width="98%" RepeatColumns="8"></asp:CheckBoxList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <asp:Label runat="server" AssociatedControlID="cblCountries" CssClass="control-label label_red">الدولة</asp:Label>
                                        <asp:CheckBoxList ID="cblCountries" runat="server" CssClass="control-label text-success" DataTextField="CountryDsecAr" DataValueField="CountryId" Width="98%" RepeatColumns="8"></asp:CheckBoxList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-4">
                                        <asp:Button ID="btnNew" runat="server" Text="جديد" CssClass="btn btn-danger" OnClick="btnNew_Click" CausesValidation="false" TabIndex="-1" />
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass=" btn btn-success" OnClick="btnSave_Click" />

                                    </div>
                                </div>
                            </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="panel-footer">
                    دول الرحلة                       
                </div>
            </div>
        </div>

    </div>
</asp:Content>
