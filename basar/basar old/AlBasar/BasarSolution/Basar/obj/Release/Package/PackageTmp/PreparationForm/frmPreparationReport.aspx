<%@ Page Title="" Language="C#" MasterPageFile="~/Master/WideAdmin.Master" AutoEventWireup="true" CodeBehind="frmPreparationReport.aspx.cs" Inherits="Basar.PreparationForm.frmPreparationReport " %>

<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../calendercontent/css/prettify-1.0.css" rel="stylesheet" />
    <link href="../calendercontent/css/base.css" rel="stylesheet" />
    <link href="../calendercontent/css/bootstrap-datetimepicker.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- /.row -->
    <div class="row">

        <div class="col-lg-12">
            <div class="panel panel-success div_shadow">
                <div class="panel-heading">
                    <img src="../images/archivepng.png" alt="ارشيف" />
                    <strong>تقارير الخطة 
                    </strong>
                </div>
                <div class="panel-body">
                    <asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="form-horizontal">
                                <hr />
                                <asp:ValidationSummary runat="server" CssClass="text-danger" />
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="ddlYear" CssClass="col-md-2 control-label label_red">العام</asp:Label>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control" AppendDataBoundItems="true" DataTextField="YearNameAr" DataValueField="YearId">
                                            <asp:ListItem Text="عام الخطة" Value="-1"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <asp:Label runat="server" AssociatedControlID="ddlToure" CssClass="col-md-2 control-label label_red">الجولة</asp:Label>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlToure" runat="server" AppendDataBoundItems="true" CssClass="form-control" DataTextField="TourDsecAr" DataValueField="TourId" AutoPostBack="True" OnSelectedIndexChanged="ddlToure_SelectedIndexChanged">
                                            <asp:ListItem Text="الجولة" Value="-1"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="ddlCountries" CssClass="col-md-2 control-label label_red">الدولة</asp:Label>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlCountries" runat="server" AppendDataBoundItems="true" DataTextField="CountryDsecAr" DataValueField="CountryId" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged">
                                            <asp:ListItem Text="الدولة" Value="-1"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <asp:Label runat="server" AssociatedControlID="ddlCamps" CssClass="col-md-2 control-label label_red">المخيم
                                    </asp:Label>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlCamps" runat="server" DataTextField="CampDsecAr" AppendDataBoundItems="True" DataValueField="CampId" CssClass="form-control">
                                            <asp:ListItem Value="-1">اختر المخيم</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="ddlTeam" CssClass="col-md-2 control-label label_red">الفريق</asp:Label>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlTeam" runat="server" CssClass="form-control" AppendDataBoundItems="True" DataTextField="TeamDsecAr" DataValueField="TeamId">
                                            <asp:ListItem Text="الفريق" Value="-1"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <asp:RequiredFieldValidator ID="rfvddlTeam" runat="server" CssClass="col-md-1 control-label label_red" ErrorMessage="الفريق" Display="Dynamic" SetFocusOnError="True" ToolTip=" الفريق" Text="*" ControlToValidate="ddlTeam"></asp:RequiredFieldValidator>
                                    <asp:Label runat="server" AssociatedControlID="ddlSponosr" CssClass="col-md-2 control-label label_red">الراعي</asp:Label>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlSponosr" runat="server" CssClass="form-control" DataTextField="SponsorDsecAr" AppendDataBoundItems="true" DataValueField="SponsorId">
                                            <asp:ListItem Text="الراعي" Value="-1"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <!---->
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="txtStartDate" CssClass="col-md-2 control-label label_red">بداية المخيم</asp:Label>
                                    <div class="col-md-3">
                                        <div class='input-group date' id='datetimepicker6'>
                                            <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" placeholder="بداية المخيم"></asp:TextBox>
                                            <span class="input-group-addon">
                                                <span class="fa fa-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtStartDate" CssClass="col-md-1 control-label label_red" ErrorMessage="تاريخ الميلاد" />
                                    <asp:Label runat="server" AssociatedControlID="txtEndDate" CssClass="col-md-2 control-label label_red">نهاية المخيم</asp:Label>
                                    <div class="col-md-3">
                                        <div class='input-group date' id='datetimepicker7'>
                                            <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" placeholder="بداية المخيم"></asp:TextBox>
                                            <span class="input-group-addon">
                                                <span class="fa fa-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="rblPreliminaryStatus" CssClass="col-md-2 control-label label_red">الزيارة التحضيرية</asp:Label>
                                    <div class="col-md-4">
                                        <asp:RadioButtonList ID="rblPreliminaryStatus" runat="server" Width="60%" RepeatDirection="Horizontal" RepeatColumns="2">
                                            <asp:ListItem Value="true" Text="نعم"></asp:ListItem>
                                            <asp:ListItem Value="false" Text="لا"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="rfvrblPreliminaryStatus" runat="server" CssClass="col-md-2 text-danger" ErrorMessage="حالة الزيارة التحضيرية" Display="Dynamic" SetFocusOnError="True" ToolTip=" حالة الزيارة التحضيرية" Text="*" ControlToValidate="rblPreliminaryStatus"></asp:RequiredFieldValidator>
                                    </div>
                                    <asp:Label runat="server" AssociatedControlID="ddlCampStatus" CssClass="col-md-2 control-label label_red">حالة المخيم</asp:Label>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlCampStatus" runat="server" CssClass="form-control" DataTextField="CampStatusDescAR" DataValueField="CampStatusId" AppendDataBoundItems="True">
                                            <asp:ListItem Text="حالة المخيم" Value="-1"></asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-2">
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Button ID="btnSearch" runat="server" Text="بحث" CausesValidation="false" CssClass="btn btn-success" OnClick="btnSearch_Click" />
                                    </div>
                                    <div class="col-md-2">
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Button ID="btnNew" runat="server" Text="جديد" CssClass="btn btn-primary" OnClick="btnNew_Click" CausesValidation="false" />

                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:GridView ID="gvAnnualPlan" runat="server" AutoGenerateColumns="False" Width="98%" CssClass="table table-bordered table-hover" AllowPaging="True" OnRowCommand="gvAnnualPlan_RowCommand" OnDataBound="gvAnnualPlan_DataBound" EmptyDataText="لا يوجد مخيمات في البحث" OnPageIndexChanging="gvAnnualPlan_PageIndexChanging" PageSize="70">
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
                                <!--End from horizintal-->
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
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

    </div>
    <script src="../calendercontent/js/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="../js/jsCalender.js"></script>
    <script type="text/javascript">
        $(function () {
            dateCalender();
            updatepanelCalender();
        });
    </script>

</asp:Content>
