<%@ Page Title="" Language="C#" MasterPageFile="~/Master/WideAdmin.Master" AutoEventWireup="true" CodeBehind="frmPreliminary.aspx.cs" Inherits="Basar.PreparationForm.frmPreliminary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- /.row -->
    <div class="row">


        <div class="panel panel-primary div_shadow">
            <div class="panel-heading">
                الزيارات التحضيرية 
               
            </div>
        </div>
        <div class="col-md-10 col-md-offset-1">
            <asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="form-horizontal">
                        <hr />
                        <asp:ValidationSummary runat="server" CssClass="text-danger" />
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="ddlYear" CssClass="col-md-2 control-label label_red">العام</asp:Label>
                            <div class="col-md-4">

                                <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control" DataTextField="YearNameAr" DataValueField="YearId"></asp:DropDownList>

                            </div>

                            <asp:Label runat="server" AssociatedControlID="ddlCountries" CssClass="col-md-2 control-label label_red">الدولة</asp:Label>
                            <div class="col-md-4">

                                <asp:DropDownList ID="ddlCountries" runat="server" DataTextField="CountryDsecAr" DataValueField="CountryId" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged">
                                    <asp:ListItem Value="-1">الدولــة</asp:ListItem>
                                </asp:DropDownList>

                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="ddlCamps" CssClass="col-md-2 control-label label_red">المخيم
                            <abbr title="هذه المخيمات التي تحتاج زيارة تحضيرية فقط" class="initialism"><span class="fa fa-info"></span></abbr>  
                            </asp:Label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlCamps" runat="server" DataTextField="CampDsecAr" DataValueField="CampId" CssClass="form-control">
                                    <asp:ListItem Value="-1">اختر المخيم</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:Label runat="server" AssociatedControlID="ddlSurveyCategory" CssClass="col-md-2 control-label label_red">المؤشر</asp:Label>
                            <div class="col-md-4 has-feedback">
                                <asp:DropDownList ID="ddlSurveyCategory" runat="server" CssClass="form-control" DataValueField="SurveyCategoryId" DataTextField="SurveyCategoryDescAr"></asp:DropDownList>



                            </div>

                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="rblIndicatorDivider" CssClass="col-md-2 control-label label_red">الفئة</asp:Label>
                            <div class="col-md-3">
                                <asp:RadioButtonList ID="rblIndicatorDivider" runat="server" CssClass="form-control" RepeatDirection="Horizontal" Width="90%">
                                    <asp:ListItem Text="إداري" Value="false" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="طبي" Value="true"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <div class="col-md-1">

                                <button runat="server" id="btnFind" class="btn btn-primary btn-md hidden-print" title="عرض بنود الخطة" onserverclick="btnFind_Click">
                                    
                            <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>

                    </div>
                </ContentTemplate>
            
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="row">
        <asp:UpdatePanel ID="upSecond" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="col-lg-12 div_padding">
                    <asp:GridView ID="gvIndicator" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-responsive table-hover ">
                        <Columns>
                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-Width="5%" ControlStyle-Width="5%" ItemStyle-Width="5%">
                                <HeaderTemplate>
                                    <label for="MBCountLabel">م</label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="MBCountLabel" CssClass="label_red" runat="server"
                                        Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <div class="input-group custom-search-form ">

                                        <span class="input-group-btn">
                                            <a href="frmIndicator.aspx" target="popup"
                                                onclick="window.open('frmIndicator.aspx','popup','width=800,height=600,scrollbars=1,resizable=no'); return false;">
                                                <button class="btn btn-default" type="button">
                                                    <i class="fa fa-save"></i>
                                                </button>
                                            </a>
                                        </span>
                                        <label for="" class="text-center">البند</label>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblIndicatorDescAr" runat="server" Text='<%# Bind("IndicatorDescAr")  %>'>   </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    العدد
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblIndicatorNumber" runat="server" Text='<%# Bind("IndicatorNumber")  %>' CssClass="td-txt-number">   </asp:Label>
                                    <asp:Label ID="lblIndicatorId" runat="server" Text='<%# Bind("IndicatorId")  %>'  Visible="false" >   </asp:Label>
                                     <asp:Label ID="lblCampIndicatorStatus" runat="server" Text='<%# Bind("CampIndicatorStatus")  %>'  Visible="false" >   </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    المتوفر
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="txtAvailableNumber" runat="server"  Text='<%# Bind("AvailableNumber")  %>' placeholder="المتوفر" CssClass="form-control td-txt-number input-sm" TextMode="Number">   </asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    غير المتوفر
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="txtMissingNumber" runat="server" Text='<%# Bind("MissingNumber")  %>'  TextMode="Number" placeholder="غير المتوفر" CssClass="form-control td-txt-number input-sm">   </asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    الحاله
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:RadioButtonList ID="rblCampIndicatorStatus" runat="server" CssClass="control-label td-txt-memo input-sm" RepeatDirection="Horizontal" RepeatColumns="3">
                                        <asp:ListItem Text="مناسب" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="غير مناسب " Value="0"></asp:ListItem>
                                        <asp:ListItem Text="ملاحظات " Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    ملاحظات
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="txtCampIndicatorMemo" runat="server" Text='<%# Bind("CampIndicatorMemo")  %>'  MaxLength="200" placeholder="ملاحظات" CssClass="form-control td-txt-memo input-sm">   </asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnFind" EventName="ServerClick" />
                </Triggers>
        </asp:UpdatePanel>
    </div>
    <div class="row">
        <asp:UpdatePanel ID="upThird" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="col-lg-4">
                </div>
                <div class="col-lg-2">
                    <button runat="server" id="btnNew" class="btn btn-primary btn-lg hidden-print" title="مسح الشاشة" tabindex="-1" onserverclick="btnNew_ServerClick">
                        <i class="fa fa-folder-o"></i>
                        جديد
                    </button>
                </div>
                <div class="col-lg-2">
                    <button runat="server" id="btnSave" class="btn btn-primary btn-lg hidden-print" title="حفظ" tabindex="-1" onserverclick="btnSave_ServerClick">
                        <i class="fa fa-save"></i>
                        حفظ
                    </button>
                </div>
                <div class="col-lg-4">
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="ServerClick" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
    <div class="panel-footer">
        <p>
            <span class="h5">الزيارة التحضيرية</span>
        </p>

    </div>
    <script src="../js/hightlightrow.js"></script>
    <script type="text/javascript">
        rowfocus();

    </script>
</asp:Content>
