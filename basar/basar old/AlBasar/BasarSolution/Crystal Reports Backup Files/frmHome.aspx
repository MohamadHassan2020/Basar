<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="frmHome.aspx.cs" Inherits="Basar.Home.frmHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"></h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="panel">

            <div class="panel-heading">
                <h3 class="alert alert-success">ملخص خطة العام الحالي 2018</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">

                    <asp:GridView ID="gvAnnualPlan" runat="server" AutoGenerateColumns="False" Width="98%" CssClass="table table-bordered table-hover" AllowPaging="True" OnDataBound="gvAnnualPlan_DataBound" EmptyDataText="لا يوجد مخيمات في البحث" OnPageIndexChanging="gvAnnualPlan_PageIndexChanging" PageSize="30">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <label for="MBCountLabel" class="label_red">م</label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="MBCountLabel" CssClass="label_red" runat="server"
                                        Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    الجولة
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="imgStatus" runat="server" Height="36px" Width="36px" />
                                    <asp:Label ID="lblTourDsecAr" runat="server" Text='<%# Bind("TourDsecAr")  %>'>  </asp:Label>
                                    <asp:Label ID="lblTeamDsecAr" runat="server" Text='<%# Bind("TeamDsecAr")  %>'>  </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    الدولة
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCountryDsecAr" runat="server" Text='<%# Bind("CountryDsecAr") %>'>  </asp:Label>
                                    <asp:Label ID="lblAnnualPlanId" runat="server" Text='<%# Bind("AnnualPlanId")  %>' Visible="False">  </asp:Label>
                                    <asp:Label ID="lblYearId" runat="server" Text='<%# Bind("YearId")  %>' Visible="False">  </asp:Label>
                                    <asp:Label ID="lblTeamId" runat="server" Text='<%# Bind("TeamId")  %>' Visible="False">  </asp:Label>
                                    <asp:Label ID="lblTourId" runat="server" Text='<%# Bind("TourId")  %>' Visible="False">  </asp:Label>
                                    <asp:Label ID="lblCountryId" runat="server" Text='<%# Bind("CountryId")  %>' Visible="False">  </asp:Label>
                                    <asp:Label ID="lblCampId" runat="server" Text='<%# Bind("CampId")  %>' Visible="False">  </asp:Label>
                                    <asp:Label ID="lblSponsorId" runat="server" Text='<%# Bind("SponsorId")  %>' Visible="False">  </asp:Label>
                                    <asp:Label ID="lblCampStatusImage" runat="server" Text='<%# Bind("CampStatusImage")  %>' Visible="False">  </asp:Label>
                                    <asp:Label ID="lblAnnualPlanRemark" runat="server" Text='<%# Bind("AnnualPlanRemark")  %>' Visible="False">  </asp:Label>
                                    <asp:Label ID="lblPreliminaryStatus" runat="server" Text='<%# Bind("PreliminaryStatus")  %>' Visible="False">  </asp:Label>
                                    <asp:HiddenField ID="hfCampStatusId" runat="server" Value='<%# Bind("CampStatusId")  %>' />
                                    <asp:HiddenField ID="hfCampStatusDescAR" runat="server" Value='<%# Bind("CampStatusDescAR")  %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    المخيم
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCampDsecAr" runat="server" Text='<%# Bind("CampDsecAr")  %>'>    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    الراعي
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblSponsorDsecAr" runat="server" Text='<%# Bind("SponsorDsecAr")  %>'>   </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    بداية المخيم
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAnnualPlanStartDate" runat="server" Text='<%# Bind("AnnualPlanStartDateFormat")  %>'>    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    نهاية المخيم
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAnnualPlanEndDate" runat="server" Text='<%# Bind("AnnualPlanEndDateFormat")  %>'>   </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerSettings PageButtonCount="5" />
                    </asp:GridView>
                </div>
            </div>
            <div class="panel-info">
                <div class="panel-heading">
                    علامات ارشادية
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-10">
                            <asp:GridView ID="gvCampStatus" runat="server" AutoGenerateColumns="False" OnDataBound="gvCampStatus_DataBound" Width="98%" CssClass="table table-bordered table-hover" ShowHeader="False">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="imgStatus_gv" runat="server" Height="36px" Width="36px" />
                                            <asp:Label ID="lblCampStatusDescAR_gv" runat="server" Text='<%# Bind("CampStatusDescAR")  %>'>  </asp:Label>
                                            <asp:HiddenField ID="hfImageStatus_gv" runat="server" Value='<%# Bind("CampStatusImage")  %>'></asp:HiddenField>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
    <div class="row">
    </div>
    <!-- /.row -->
</asp:Content>
