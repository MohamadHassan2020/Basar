<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="frmIndicator.aspx.cs" Inherits="Basar.PreparationForm.frmIndicator" %>

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
                    بنود الزيارة التحضيرية 
                </div>
                <div class="panel-body">
                    <asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-lg-3">
                                </div>
                                <div class="col-lg-6">
                                    <div class="input-group div_padding">
                                        <label for="">وصف البند</label>
                                    </div>
                                    <div class="input-group custom-search-form">
                                        <asp:TextBox ID="txtIndicatorIdDescAr" runat="server" placeholder="وصف البند" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">
                                                <i class="fa fa-bicycle"></i>
                                            </button>
                                        </span>
                                    </div>
                                    <div class="input-group div_padding">
                                        <label for="">Indicator</label>
                                    </div>
                                    <div class="input-group custom-search-form">
                                        <asp:TextBox ID="txtIndicatorIdDescEn" runat="server" placeholder="Indicator" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">
                                                <i class="fa fa-paperclip"></i>
                                            </button>
                                        </span>
                                    </div>
                                    <div class="input-group div_padding">
                                        <label for="">العدد </label>
                                    </div>
                                    <div class="input-group custom-search-form">
                                        <asp:TextBox ID="txtIndicatorNumber" runat="server" placeholder="العدد" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">
                                                <i class="fa fa-android"></i>
                                            </button>
                                        </span>
                                    </div>
                                    
                                    <div class="input-group text-danger">
                                        <label for="">فئة الصنف</label>
                                    </div>

                                    <div class="input-group custom-search-form div_padding">
                                        <asp:DropDownList ID="ddlSurveyCategory" runat="server" CssClass="form-control" DataValueField="SurveyCategoryId" DataTextField="SurveyCategoryDescAr"></asp:DropDownList>
                                        <span class="input-group-btn">
                                            <asp:LinkButton CssClass="btn btn-default" ID="lbtnFind" runat="server">
                                        <i class="fa fa-search"></i>
                                            </asp:LinkButton>
                                        </span>
                                    </div>
                                    <div class="input-group div_padding">
                                        <label for="">طبي / إداري</label>
                                    </div>
                                    <div class="input-group custom-search-form">
                                        <asp:RadioButtonList ID="rblIndicatorDivider" runat="server" CssClass="form-control" RepeatDirection="Horizontal" Style="width: 100%" RepeatColumns="2">
                                            <asp:ListItem Value="true" Text="طبي"></asp:ListItem>
                                            <asp:ListItem Value="false" Text="إداري"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="rfvrblIndicatorDivider" runat="server" CssClass="text-danger" ErrorMessage="طبي / إداري" Display="Dynamic" SetFocusOnError="True" ToolTip=" طبي / إداري" Text="*" ControlToValidate="rblIndicatorDivider"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="input-group div_padding">
                                        <label for="">الحالة</label>
                                    </div>
                                    <div class="input-group custom-search-form">
                                        <asp:RadioButtonList ID="rblIndicatorStatus" runat="server" CssClass="form-control" RepeatDirection="Horizontal" Style="width: 100%" RepeatColumns="2">
                                            <asp:ListItem Value="true" Text="نشط"></asp:ListItem>
                                            <asp:ListItem Value="false" Text="غير نشط"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="rfvrblIndicatorStatus" runat="server" CssClass="text-danger" ErrorMessage="حالة البند" Display="Dynamic" SetFocusOnError="True" ToolTip=" حالة البند" Text="*" ControlToValidate="rblIndicatorStatus"></asp:RequiredFieldValidator>
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
