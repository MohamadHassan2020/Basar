<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="frmClinicalReport.aspx.cs" Inherits="Basar.PreparationForm.frmClinicalReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../js/jquery-ui.min.css" rel="stylesheet" />
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div class="col-lg-10">
            <div class="panel panel-primary div_shadow">
                <div class="panel-heading">
                    <i class="fa fa-info fa-2x"></i>
                    <strong>احصائية المخيم 
                    </strong>
                </div>
                <div class="panel-body">
                    <asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="form-horizontal">
                                <div class="alert alert-info">
                                    <strong><i class="fa fa-bell"></i>يجب التأكد من اخال المخيم في الخطة أولاً </strong>
                                </div>
                                <hr />
                                <asp:ValidationSummary runat="server" CssClass="text-danger" />
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="ddlYear" CssClass="col-md-2 control-label label_red">العام</asp:Label>
                                    <div class="col-md-4">
                                        <div class="custom-search-form">
                                            <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control" AutoPostBack="true" DataTextField="YearNameAr" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" DataValueField="YearId" AppendDataBoundItems="true">
                                                <asp:ListItem Text="العام" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <asp:Label runat="server" AssociatedControlID="ddlToure" CssClass="col-md-2 control-label label_red">الجولة</asp:Label>
                                    <div class="col-md-4">
                                        <div class="input-group custom-search-form">
                                            <asp:DropDownList ID="ddlToure" runat="server" CssClass="form-control" DataTextField="TourDsecAr" DataValueField="TourId" AutoPostBack="True" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlToure_SelectedIndexChanged">
                                                <asp:ListItem Text="-- الجولـــة --" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="ddlCountries" CssClass="col-md-2 control-label label_red">الدولة</asp:Label>
                                    <div class="col-md-4">
                                        <div class="input-group custom-search-form">
                                            <asp:DropDownList ID="ddlCountries" runat="server" DataTextField="CountryDsecAr" DataValueField="CountryId" AppendDataBoundItems="true" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged">
                                                <asp:ListItem Value="">الدولــة</asp:ListItem>
                                            </asp:DropDownList>

                                        </div>
                                    </div>
                                    <asp:Label runat="server" AssociatedControlID="ddlCamps" CssClass="col-md-2 control-label label_red">المخيم
                                    </asp:Label>
                                    <div class="col-md-3">
                                        <div class="input-group custom-search-form">
                                            <asp:DropDownList ID="ddlCamps" runat="server" DataTextField="CampDsecAr" DataValueField="CampId" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCamps_SelectedIndexChanged">
                                                <asp:ListItem Value="">اختر المخيم</asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="input-group-btn">
                                                <asp:LinkButton class="btn btn-default" ID="lbtnSearch" runat="server" CausesValidation="false" OnClick="lbtnSearch_Click">
                                                <i class="fa fa-search"></i>
                                                </asp:LinkButton>
                                            </span>
                                        </div>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="ddlTeam" CssClass="col-md-2 control-label label_red">الفريق</asp:Label>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlTeam" runat="server" CssClass="form-control" AppendDataBoundItems="True" DataTextField="TeamDsecAr" AutoPostBack="true" DataValueField="TeamId" OnSelectedIndexChanged="ddlTeam_SelectedIndexChanged">
                                            <asp:ListItem Text="الفريق" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>


                                </div>

                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="ddlManager" CssClass="col-md-2 control-label label_red">المدير</asp:Label>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlManager" runat="server" CssClass="form-control" AppendDataBoundItems="True" DataTextField="ManagerName" DataValueField="ManagerId">
                                            <asp:ListItem Text="المدير" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <asp:Label runat="server" AssociatedControlID="ddlChiefSurgeon" CssClass="col-md-2 control-label label_red">الجراح</asp:Label>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlChiefSurgeon" runat="server" CssClass="form-control" AppendDataBoundItems="True" DataTextField="ManagerName" DataValueField="ManagerId">
                                            <asp:ListItem Text="الجراح" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <asp:GridView ID="gvAxes" runat="server" AutoGenerateColumns="False" EmptyDataText="" CssClass="table table-bordered table-hover">
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
                                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderTemplate>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbtnAxesEN" runat="server" CssClass="control-label label_red" Text='<%# Bind("AxesEN")  %>'>  </asp:Label>
                                                        <asp:HiddenField ID="hfAxesId" runat="server" Value='<%# Bind("AxesId")  %>'></asp:HiddenField>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        Male
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtMaleAxes" runat="server" Text='<%# Bind("MaleAxes")  %>' onkeypress="return onlyNumbers(this);" MIN="0" TextMode="Number" CssClass="form-control" Width="80px">  </asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        Female
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtFemaleAxes" runat="server" MIN="0" Text='<%# Bind("FemaleAxes")  %>' onkeypress="return onlyNumbers(this);" TextMode="Number" CssClass="form-control" Width="80px">  </asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        MEMO
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtAxesNote" runat="server" Text='<%# Bind("AxesNote")  %>' MaxLength="100" CssClass="form-control">  </asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="txtCampReportNote" CssClass="col-md-2 control-label label_red">ملاحظات</asp:Label>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txtCampReportNote" runat="server" CssClass="form-control" Rows="2" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:CheckBox ID="cbInvolvedAgencies" runat="server" Text="تم مراجعة الأرقام بشكل صحيح" CssClass="checkbox-inline text-danger col-md-offset-2" />
                                    <asp:LinkButton ID="btnSend" runat="server" Text="" CssClass="btn btn-primary col-md-offset-1" OnClick="btnSend_Click">
                                        
                                    <span class="fa fa-save"> </span>
                                    حفظ
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="lbtnClear" runat="server" Text="" CssClass="btn btn-primary" OnClick="lbtnClear_Click">
                                    <span class="fa fa-minus"> </span>
                                    مسح الشاشة
                                    </asp:LinkButton>
                                </div>

                            </div>
                            <script src="../js/only-Numbers.js"></script>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
</asp:Content>
